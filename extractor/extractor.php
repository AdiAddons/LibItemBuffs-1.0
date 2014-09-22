<?php
/*
AdiRareLocations extractor - Extract locations of rare mobs from wowhead.com.
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

use RollingCurl\Request;
use RollingCurl\RollingCurl;

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


function getCachePath($url)
{
    $hash = sha1($url);
    return __DIR__.'/cache/'.substr($hash, 0, 1).'/'.substr($hash, 1, 1).'/'.substr($hash, 2);
}

function saveToCache($url, $content)
{
    $cacheFile = getCachePath($url);
    if(!is_dir(dirname($cacheFile))) {
        mkdir(dirname($cacheFile), 0777, true);
    }
    return file_put_contents($cacheFile, $content);
}

function fetchFromCache($url)
{
    $cacheFile = getCachePath($url);
    return file_exists($cacheFile) ? file_get_contents($cacheFile) : null;
}

$rollingCurl = new RollingCurl();
$rollingCurl
    ->addOptions([
        CURLOPT_HTTPHEADER     => ['User-Agent: LibItemBuffs-1.0 extractor'],
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_MAXREDIRS      => 5,
    ])
    ->setCallback(function(Request $request, RollingCurl $rollingCurl) {
        $info = $request->getResponseInfo();
        if($info['http_code'] !== 200) {
            printf("ERROR: %s => %d\n", $request->getUrl(), $info['http_code']);
            return;
        }

        saveToCache($request->getUrl(), $request->getResponseText());

        list($callback, $args) = $request->getExtraInfo();
        array_unshift($args, $request->getResponseText());
        call_user_func_array($callback, $args);
    });

function fetch($path, callable $callback, array $args = [])
{
    $url = BASEURL.'/'.$path;

    if(null !== $content = fetchFromCache($url)) {
        array_unshift($args, $content);
        call_user_func_array($callback, $args);
    } else {
        $request = new Request($url);
        $request->setExtraInfo([$callback, $args]);
        global $rollingCurl;
        $rollingCurl->add($request);
    }

}

function parseTooltip($content, callable $callback, array $args = [])
{
    $matches = [];
    if(!preg_match('/\{.+\}/s', $content, $matches)) {
        return;
    }
    $tooltip = json_decode(
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
    array_unshift($args, $tooltip);
    call_user_func_array($callback, $args);
}

function getTooltip($path, callable $callback, array $args = [])
{
    return fetch($path.'&power', 'parseTooltip', [$callback, $args]);
}

foreach($INPUT as $itemType => $lists) {
    foreach($lists as $what => $path) {
        fetch($path, 'parseItemList', [$itemType, $what]);
    }
}

function parseItemList($content, $itemType, $what)
{
    $matches = [];
    if(!preg_match('/var listviewitems = (.*)/m', $content, $matches)) {
        return;
    }
    $itemList = $matches[1];
    if(!preg_match_all('/"id":(\d+)/', $itemList, $matches, PREG_SET_ORDER)) {
        return;
    }
    printf("Found %d %s(s).\n", count($matches), $what);
    foreach($matches as $groups) {
        $itemId = intval($groups[1]);
        getTooltip("item=$itemId", 'parseItemTooltip', [$itemType, $what, $itemId]);
    }
}

function parseItemTooltip($tooltip, $itemType, $what, $itemId)
{
    if(!isset($tooltip['name_enus'], $tooltip['tooltip_enus'])) {
        return;
    }
    $itemName = $tooltip['name_enus'];
    if(preg_match('/\bCommendation\b/i', $itemName) || $itemName === "UNUSED") {
        return;
    }
    $matches = [];
    if(!preg_match_all('%(Use|Equip)\s*:\s*<a\s+href="/spell=(\d+)"%i', $tooltip['tooltip_enus'], $matches, PREG_SET_ORDER)) {
        return;
    }
    printf("Analyzing %s #%d: %s\n", $what, $itemId, $itemName);
    foreach($matches as $groups) {
        $spellId = intval($groups[2]);
        if($groups[1] == 'Use') {
            getTooltip("spell=$spellId", 'parseSpellTooltip', [$itemType, $what, $itemId, $itemName, $spellId]);
        } else {
            fetch("spell=$spellId", 'parseOnEquip', [$itemType, $what, $itemId, $itemName]);
        }
    }
}

function parseOnEquip($content, $itemType, $what, $itemId, $itemName)
{
    $matches = [];
    if(!preg_match_all('/g_spells\.createIcon\((\d+),/', $content, $matches)) {
        return;
    }
    foreach($matches[1] as $buffId) {
        $buffId = intval($buffId);
        getTooltip("spell=$buffId", 'parseSpellTooltip', [$itemType, $what, $itemId, $itemName, $buffId]);
    }
}

function parseSpellTooltip($tooltip, $itemType, $what, $itemId, $itemName, $spellId)
{
    if(!isset($tooltip['buff_enus'], $tooltip['name_enus'])) {
        return;
    }
    $spellName = $tooltip['name_enus'];
    if(preg_match('/^((Bountiful )?Food|Refresh|(Holiday )?Drink)/i', $spellName) || $spellName === "UNUSED") {
        // Ignore food and drink buffs
        return;
    }
    printf("Found buff %s (#%d) for %s %s (#%d).\n", $spellName, $spellId, $what, $itemName, $itemId);
}

$rollingCurl->execute();

die(1);

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
$code[] = "";
$code[] = "LibStub('LibItemBuffs-1.0'):__UpgradeDatabase(version, trinkets, consumables, enchantments)";

$filename = "LibItemBuffs-Database-1.0.lua";
$lib = file_get_contents("../$filename");
$pos = strpos($lib, '--== CUT HERE ==--');
file_put_contents("../$filename", substr($lib, 0, $pos).join("\n", $code)."\n");
