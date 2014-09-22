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

$output = [];

$rollingCurl = new RollingCurl();
$cache = new FileCache(__DIR__.'/cache');
$queue = new TaskQueue();

function refreshStatus()
{
    global $queue, $rollingCurl;
    $completed = $queue->getCompleted() + $rollingCurl->countCompleted();
    $pending = count($queue) + $rollingCurl->countActive() + $rollingCurl->countPending();
    $total = $completed + $pending;
    $ratio = $total > 0 ? $completed / $total : 0;
    $width = floor(60 * $ratio);
    printf("\r%s%s %4d/%4d (%3d%%)", str_repeat('#', $width), str_repeat('.', 60-$width), $completed, $total, floor(100 * $ratio));
}

$rollingCurl
    ->addOptions([
        CURLOPT_HTTPHEADER     => ['User-Agent: LibItemBuffs-1.0 extractor'],
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_MAXREDIRS      => 5,
    ])
    ->setCallback(function(Request $request, RollingCurl $rollingCurl) {
        refreshStatus();

        $info = $request->getResponseInfo();
        if($info['http_code'] !== 200) {
            printf("\nHTTP ERROR: %s => %d\n", $request->getUrl(), $info['http_code']);
            return;
        }

        global $cache;
        $cache->store($request->getUrl(), $request->getResponseText());

        list($callback, $args) = $request->getExtraInfo();
        array_unshift($args, $request->getResponseText());
        call_user_func_array($callback, $args);
    })
    ->setIdleCallback(function(RollingCurl $rollingCurl) use($queue) {
        $queue->process();
    });

function fetch($path, callable $callback, array $args = [])
{
    global $cache;
    $url = BASEURL.'/'.$path;

    if(null !== $content = $cache->fetch($url)) {
        global $queue;
        array_unshift($args, $content);
        $queue->enqueue($callback, $args);
    } else {
        global $rollingCurl;
        $request = new Request($url);
        $request->setExtraInfo([$callback, $args]);
        $rollingCurl->add($request);
    }

    refreshStatus();
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
    //printf("Found %d %s(s).\n", count($matches), $what);
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
    //printf("Analyzing %s #%d: %s\n", $what, $itemId, $itemName);
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
    //printf("Found buff %s (#%d) for %s %s (#%d).\n", $spellName, $spellId, $what, $itemName, $itemId);
    global $output;
    if(!isset($output[$spellId])) {
        $output[$spellId] = [
            'type' => $itemType,
            'name' => $spellName,
            'items' => []
        ];
    }
    $output[$spellId]['items'][$itemId] = $itemName;
}

do {
    $queue->process();
    $rollingCurl->execute();
    refreshStatus();
} while(count($queue) > 0);

function intSort($a, $b) { return intval($a) - intval($b); }

uksort($output, 'intSort');

$code = [ "--== CUT HERE ==--\nversion = ".date("YmdHis")."\n" ];

foreach($output as $spellId => $spellData) {
    $spellName = $spellData['name'];
    $items = $spellData['items'];
    $num = count($items);
    if($num == 0) {
        continue;
    }
    list($itemId, $itemName) = each($items);
    $code[] = sprintf("%-11s[%6d] = ", $spellData['type'], $spellId);
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
