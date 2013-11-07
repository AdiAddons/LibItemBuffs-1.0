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

echo "Fetching trinket list: ";
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
		}
	}
}
echo "\n".count($trinkets)." trinkets found\n\n";

$buffs = array();

echo "Fetching trinket data: ";
foreach($trinkets as $id) {
	$page = fetchPage("/item=".$id);
	echo "o";
	$crawler = new Crawler();
	$crawler->addContent($page);

	foreach($crawler->filter('#main-contents table a[href]')->extract('href') as $spellURL) {
		if(preg_match('@^/spell=(\d+)$@', $spellURL, $matches)) {
			$buffs[intval($matches[1])] = $id;
			echo ".";
		}
	}
}
echo "\n";

print_r($buffs);

/*
$data = array();

echo "Fetching locations: ";
foreach($npcIds as $npcId => $achievementId) {
	$crawler = new Crawler();
	$crawler->addContent(fetchPage('/npc='.$npcId));

	foreach($crawler->filter('script[type="text/javascript"]')->extract('_text') as $script) {
		if(preg_match('/g_mapperData = (\{.+?\});/is', $script, $groups)) {
			$jsdata = preg_replace('/(\w+):/', '"$1":', $groups[1]);
			foreach(json_decode($jsdata, true) as $whMapId => $coords) {
				if(empty($mapMap[$whMapId])) {
					echo "\nUnknown wowhead map id: $whMapId ";
					continue;
				}
				$mapId = $mapMap[$whMapId];
				foreach($coords as $floor => $points) {
					$x = 0.0;
					$y = 0.0;
					foreach($points['coords'] as $coords) {
						$x += $coords[0];
						$y += $coords[1];
					}
					$x /= $points['count'];
					$y /= $points['count'];
					$data[$achievementId][$npcId][$mapId][] = array($floor, $x, $y);
				}
				echo '.';
			}
		}
	}
}
echo "done\n";

echo "Writing the database: ";

$fh = fopen("../Database.lua", "w");
fputs($fh, "-- File generated automatically ; editing is pointless.\n");
fputs($fh, "local _, ns = ...\n");
fputs($fh, "ns.NPCs = {\n");
foreach($data as $achievementId => $npcs) {
	fprintf($fh, "\t[%d] = {\n", $achievementId);
	foreach($npcs as $npcId => $maps) {
		fprintf($fh, "\t\t[%d] = {\n", $npcId);
		foreach($maps as $mapId => $allCoords) {
			fprintf($fh, "\t\t\t[%d] = {\n", $mapId);
			foreach($allCoords as $coords) {
				vfprintf($fh, "\t\t\t\t{ %d, %g, %g },\n", $coords);
				echo '.';
			}
			fputs($fh, "\t\t\t},\n");
		}
		fputs($fh, "\t\t},\n");
	}
	fputs($fh, "\t},\n");
}
fputs($fh, "}\n");
fclose($fh);
echo "done\n";
*/
