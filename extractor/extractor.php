<?php

/*
LibItemBuffs-1.0 extractor - Extract buffs provided by items from wowhead.com.
Copyright (C) 2013 Adirelle (adirelle@gmail.com)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

require_once('vendor/autoload.php');

use Http\BasicClient;
use Http\CachingClient;
use Http\QueuingClient;
use React\EventLoop\Factory;

define('BASEURL', 'http://www.wowhead.com');

$INPUT = [
    'trinkets' => [
        'trinket' => 'items=4.-4'
    ],
    'consumables' => [
        "potion" => 'items=0.1',
        "elixirs" => 'items=0.2',
        "flask" => 'items=0.3',
        "scroll" => 'items=0.4',
        "food & drink" => 'items=0.5',
        "other" => 'items=0.8',
        "first aid" => 'items?filter=na=bandage;cr=86;crs=6;crv=0',
        "miscellaneous" => 'items=15?filter=cr=161:62;crs=1:1;crv=0:2' // Filter out items without cooldown
    ]
];

$loop = Factory::create();

$basicClient = BasicClient::create("8.8.8.8", $loop);
$cachingClient = new CachingClient($basicClient, __DIR__.'/cache', $loop);
$client = new QueuingClient($cachingClient, 20, $loop);

function fetch($path)
{
    global $client;
    return $client->get(BASEURL.'/'.$path)
        ->then(['\React\Stream\BufferedSink', 'createPromise'])
        ->then(function($data) {
            echo ".";
            return $data;
        });
}

function getTooltip($path)
{
    return fetch($path.'&power')->then(function($content) {
        $matches = [];
        if(preg_match('/\{.+\}/s', $content, $matches)) {
            return json_decode(
                preg_replace(
                    "/^\s*(\w+):/m",
                    '"\1":',
                    str_replace(
                        ['"', "'", '%QUOTE%'],
                        ['\\"', '"', "'"],
                        str_replace('\\\'', '%QUOTE%', $matches[0])
                    )
                ),
                true
            );
        }
        return;
    });
}

$itemLists = [];
$itemTypes = [];
$spells = [];
$spellItems = [];
$spellNames = [];
$buffItems = [];
$pathTypes = [];

foreach($INPUT as $kind => $lists) {
    foreach($lists as $path) {
        $pathTypes[$path] = $kind;
        $itemLists[$path] = fetch($path);
    }
}

echo "Fecthing ".count($itemLists)." lists: ";
\React\Promise\all($itemLists)
    ->then(function($lists) use(&$pathTypes, &$itemTypes) {
        echo "\nParsing lists: ";
        $items = [];
        foreach($lists as $path => $content) {
            $matches = [];
            if(!preg_match('/var listviewitems = (.*)/m', $content, $matches)) {
                echo "X";
                continue;
            }
            $itemList = $matches[1];
            if(!preg_match_all('/"id":(\d+)/', $itemList, $matches, PREG_SET_ORDER)) {
                echo "x";
                continue;
            }
            foreach($matches as $groups) {
                $itemId = intval($groups[1]);
                $itemTypes[$itemId] = $pathTypes[$path];
                $items[$itemId] = getTooltip("item=$itemId");
            }
            echo ".";
        }
        echo "\nFecthing ".count($items)." item tooltips: ";
        return $items;
    })
    ->then('\React\Promise\all')
    ->then(function($tooltips) use(&$spells, &$spellItems) {
        echo "\nAnalysing ".count($tooltips)." item tooltips: ";
        $onEquip = [];
        foreach($tooltips as $itemId => $tooltip) {
            if(!isset($tooltip['name_enus'], $tooltip['tooltip_enus'])) {
                echo "X";
                continue;
            }
            $name = $tooltip['name_enus'];
            if(preg_match('/\bCommendation\b/i', $name) || $name === "UNUSED") {
                echo "i";
                continue;
            }
            $matches = [];
            if(!preg_match_all('%(Use|Equip)\s*:\s*<a\s+href="/spell=(\d+)"%i', $tooltip['tooltip_enus'], $matches, PREG_SET_ORDER)) {
                echo "-";
                continue;
            }
            $itemSpells[$itemId] = [];
            foreach($matches as $groups) {
                $spellId = intval($groups[2]);
                $spellItems[$spellId][$itemId] = $name;
                if($groups[1] == 'Use') {
                    $spells[$spellId] = getTooltip("spell=$spellId");
                    echo ".";
                } else {
                    $onEquip[$spellId] = fetch("spell=$spellId");
                    echo "o";
                }
            }
        }
        echo "\n".count($spells)." on-use spells found.\n";
        echo "Fetching ".count($onEquip)." on-equip spells: ";
        return $onEquip;
    })
    ->then('\React\Promise\all')
    ->then(function($pages) use(&$spells, &$spellItems) {
        echo "\nAnalysing ".count($pages)." on-equip spells: ";
        foreach($pages as $spellId => $content) {
            $matches = [];
            $items = $spellItems[$spellId];
            if(!preg_match_all('/g_spells\.createIcon\((\d+),/', $content, $matches)) {
                echo "x";
                continue;
            }
            foreach($matches[1] as $buffId) {
                $buffId = intval($buffId);
                if(isset($spellItems[$buffId])) {
                    $spellItems[$buffId] = array_replace($spellItems[$buffId], $items);
                } else {
                    $spellItems[$buffId] = $items;
                }
                if(!isset($spells[$buffId])) {
                    $spells[$buffId] = getTooltip("spell=$buffId");
                    echo ".";
                } else {
                    echo "-";
                }
            }
        }
        echo "\nFetching ".count($spells)." spell tooltips: ";
        return $spells;
    })
    ->then('\React\Promise\all')
    ->then(function($tooltips) use(&$spellNames, &$spellItems) {
        echo "\nAnalyzing ".count($tooltips)." spell tooltips: ";
        foreach($tooltips as $spellId => $tooltip) {
            if(!isset($tooltip['buff_enus'], $tooltip['name_enus'])) {
                echo "x";
                continue;
            }
            $name = $tooltip['name_enus'];
            if(preg_match('/^((Bountiful )?Food|Refresh|(Holiday )?Drink)/i', $name) || $name === "UNUSED") {
                // Ignore food and drink buffs
                echo "i";
                continue;
            }
            echo ".";
            $spellNames[$spellId] = $name;
        };
        echo "\nDone.\n";
    });

$loop->run();

function intSort($a, $b) { return intval($a) - intval($b); }

uksort($spellNames, 'intSort');

$code = [ "--== CUT HERE ==--\nversion = ".date("YmdHis")."\n" ];

foreach($spellNames as $spellId => $spellName) {
    $items = $spellItems[$spellId];
    $num = count($items);
    if($num == 0) {
        continue;
    }
    list($itemId, $itemName) = each($items);
    $itemType = $itemTypes[$itemId];
    $code[] = sprintf("%-11s[%6d] = ", $itemType, $spellId);
    if($num == 1) {
        if($spellName !== $itemName) {
            $code[] = sprintf("%6d -- %s <= %s\n", $itemId, $spellName, $itemName);
        } else {
            $code[] = sprintf("%6d -- %s\n", $itemId, $spellName);
        }
        continue;
    }
    uksort($items, 'intSort');
    $code[] = sprintf("{ -- %s\n", $spellName);
    foreach($items as $itemId => $itemName) {
        if($itemType != $itemTypes[$itemId]) {
            $code[] = "-- Types mélangés ! ======================\n";
        }
        $code[] = sprintf("    %6d, -- %s\n", $itemId, $itemName);
    }
    $code[] = "}\n";
}

$code[] = "\n";
$code[] = "LibStub('LibItemBuffs-1.0'):__UpgradeDatabase(version, trinkets, consumables, enchantments)\n";

$filename = "LibItemBuffs-Database-1.0.lua";
$lib = file_get_contents("../$filename");
$pos = strpos($lib, '--== CUT HERE ==--');
file_put_contents("../$filename", substr($lib, 0, $pos).join("", $code));
