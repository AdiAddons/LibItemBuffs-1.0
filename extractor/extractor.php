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
				$trinkets[intval($groups[1])] = 'trinkets';
				echo '.';
			}
		} else {
			echo 'x';
		}
	}
}
echo "\nDone\n".count($trinkets)." trinkets found\n\n";

$categories = array(
	"potion" => '0.1', // Potions
	"elixir" => '0.2', // Elixirs
	"flask" => '0.3', // Flasks
	"scroll" => '0.4', // Scrolls
	"food & drink" => '0.5', // Foods & Drinks
	"other" => '0.8', // Other
);
$consumables = array();

foreach($categories as $cat => $param) {
	echo "Fetching $cat list:\n";
	$crawler = new Crawler();
	$crawler->addContent(fetchPage('/items='.$param));
	$scripts = $crawler->filter('script[type="text/javascript"]')->extract('_text');
	$n = 0;
	foreach($scripts as $script) {
		if(strpos($script, 'new Listview') !== FALSE) {
			if(preg_match_all('/"id":(\d+)/', $script, $matches, PREG_SET_ORDER)) {;
				foreach($matches as $groups) {
					$consumables[intval($groups[1])] = 'consumables';
					echo '.';
					$n++;
				}
			} else {
				echo 'x';
			}
		}
	}
	echo "\nDone\n$n ${cat}s found\n\n";
}

$allItems = $trinkets;
foreach($consumables as $id => $kind) {
	$allItems[$id] = $kind;
}

$spellsToScan = array();
$buffs = array(
	'consumables' => array(),
	'trinkets' => array(),
);

$names = array();

echo "Scanning tooltips:\n";
foreach($allItems as $itemID => $kind) {
	$data_js = fetchPage("/item=".$itemID.'&power');

	@list(, $nameLine, , , $tooltipLine, ) = explode("\n",  str_replace('\\\'', '%%%', $data_js));

	if($nameLine && $tooltipLine) {
		@list(, $name, ) = explode("'", $nameLine);
		@list(, $tooltip, ) = explode("'", $tooltipLine);

		$names[$itemID] = str_replace('%%%', "'", $name);
		$tooltip = str_replace('%%%', "'", $tooltip);

		if(preg_match_all('%(Use|Equip)\s*:\s*<a\s+href="/spell=(\d+)"%i', $tooltip, $matches, PREG_SET_ORDER)) {
			foreach($matches as $match) {
				list(, $type, $spellID) = $match;
				if($type == 'Use') {
					$buffs[$kind][$spellID] = $itemID;
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

$allCount = count($buffs['consumables']) + count($buffs['trinkets']);
printf("\nDone\n%d buffs found, %d spells to scan.\n\n", $allCount, count($spellsToScan));

if(!empty($spellsToScan)) {
	echo "Scanning spells:\n";
	$buffCount = 0;
	foreach($spellsToScan as $spellID => $itemID) {
		$page = fetchPage("/spell=".$spellID);
		if(preg_match_all('/g_spells\.createIcon\((\d+),/', $page, $matches)) {
			$kind = $allItems[$itemID];
			foreach($matches[1] as $buffID) {
				echo '.';
				$buffCount++;
				$buffs[$kind][$buffID] = $itemID;
			}
		} else {
			echo 'x';
		}
	}
	echo "\nDone\n$buffCount more buffs found.\n\n";
}

$allCount = count($buffs['consumables']) + count($buffs['trinkets']);

echo "\n".$allCount." total buffs.\n\n";

$files = array(
	'consumables' => 'LibItemBuffs-Consumables-1.0.lua',
	'trinkets' => 'LibItemBuffs-Trinkets-1.0.lua',
);

$code = array(
	'--== CUT HERE ==--',
	'version = '.date("YmdHis")
);

foreach(array('trinkets', 'consumables') as $cat) {
	$code[] = "-- ".ucfirst($cat);
	ksort($buffs[$cat]);
	foreach($buffs[$cat] as $spell => $item) {
		$code[] = sprintf("%s[%6d] = %6d -- %s", $cat, $spell, $item, $names[$item]);
	}
}
$code[] = "";
$code[] = "LibStub('LibItemBuffs-1.0'):__UpgradeDatabase(version, trinkets, consumables)";

$filename = "LibItemBuffs-Database-1.0.lua";
$lib = file_get_contents("../$filename");
$pos = strpos($lib, '--== CUT HERE ==--');
file_put_contents("../$filename", substr($lib, 0, $pos).join("\n", $code)."\n");
