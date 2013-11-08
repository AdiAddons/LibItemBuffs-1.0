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

use Symfony\Component\DomCrawler\Crawler;
use Symfony\Component\CssSelector\CssSelector;

define('SITE_ROOT', 'http://www.wowhead.com');

function fetchPage($path) {
	$path = ltrim($path, '/');
	$cacheFile = "cache/".preg_replace('/\W/', '_', $path);
	if(file_exists($cacheFile)) {
		return file_get_contents($cacheFile);
	} else {
		$content = file_get_contents(SITE_ROOT.'/'.$path);
		if($content !== FALSE) {
			if(!is_dir("cache")) mkdir("cache");
			file_put_contents($cacheFile, $content);
		}
		return $content;
	}
}

$npcIds = array();

echo "Fetching trinket list:\n";
$crawler = new Crawler();
$crawler->addContent(fetchPage('/items=4.-4'));
$scripts = $crawler->filter('script[type="text/javascript"]')->extract('_text');
$trinkets = array();
$n = 0;
foreach($scripts as $script) {
	if(strpos($script, 'new Listview') !== FALSE) {
		if(preg_match_all('/"id":(\d+)/', $script, $matches, PREG_SET_ORDER)) {;
			foreach($matches as $groups) {
				$trinkets[] = intval($groups[1]);
				echo '.';
			}
		} else {
			echo 'x';
		}
	}
}
echo "\nDone\n".count($trinkets)." trinkets found\n\n";

$spellsToScan = array();
$buffs = array();

echo "Scanning trinket tooltips:\n";
foreach($trinkets as $itemID) {
	$tooltip_js = fetchPage("/item=".$itemID.'&power');

	if(preg_match('/tooltip_enus:\s*\'(.+)\'\s*$/m', $tooltip_js, $matches)) {
		$tooltip = $matches[1];
		if(preg_match_all('%(Use|Equip)\s*:\s*<a\s+href="/spell=(\d+)"%i', $tooltip, $matches, PREG_SET_ORDER)) {
			foreach($matches as $match) {
				list(, $type, $spellID) = $match;
				if($type == 'Use') {
					$buffs[$spellID] = $itemID;
					echo '.';
				} elseif($type == 'Equip') {
					$spellsToScan[$spellID] = $itemID;
					echo 'o';
				}
			}
		}
	} else {
		echo 'x';
	}
}
printf("\nDone\n%d buffs found, %d spells to scan.\n\n", count($buffs), count($spellsToScan));

if(!empty($spellsToScan)) {
	echo "Scanning spells:\n";
	$buffCount = 0;
	foreach($spellsToScan as $spellID => $itemID) {
		$page = fetchPage("/spell=".$spellID);
		if(preg_match_all('/g_spells\.createIcon\((\d+),/', $page, $matches)) {
			foreach($matches[1] as $buffID) {
				echo '.';
				$buffCount++;
				$buffs[$buffID] = $itemID;
			}
		} else {
			echo 'x';
		}
	}
	echo "\nDone\n$buffCount more buffs found.\n\n";
}

echo "\n".count($buffs)." total buffs.\n\n";

ksort($buffs);

$code = array('--== CUT HERE ==--');
foreach($buffs as $spell => $item) {
	$code[] = sprintf("lib[%6d] = %6d", $spell, $item);
}

$lib = file_get_contents("../LibItemBuffs-Trinkets-1.0.lua");
$pos = strpos($lib, '--== CUT HERE ==--');

file_put_contents("../LibItemBuffs-Trinkets-1.0.lua", substr($lib, 0, $pos).join("\n", $code)."\n");
