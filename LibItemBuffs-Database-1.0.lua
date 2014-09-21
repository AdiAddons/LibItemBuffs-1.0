--[[
LibItemBuffs-1.0 - buff-to-item database.
(c) 2013-2014 Adirelle (adirelle@gmail.com)

This file is part of LibItemBuffs-1.0.

LibItemBuffs-1.0 is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

LibItemBuffs-1.0 is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with LibItemBuffs-1.0.  If not, see <http://www.gnu.org/licenses/>.
--]]

local version
local trinkets = {}
local consumables = {
	-- Special case: Alchemist's Flask
	[79638] = 75525,
	[79639] = 75525,
	[79640] = 75525,
}

local enchantments = {
	-- MoP enchantments

	-- Weapon (we assign it to the main hand weapon though it could come from the off-hand)
	[109085] = INVSLOT_MAINHAND, -- Engineering: Lord Blastington's Scope of Doom
	[118334] = INVSLOT_MAINHAND, -- Enchanting: Dancing Steel (agility)
	[118335] = INVSLOT_MAINHAND, -- Enchanting: Dancing Steel (strength)
	[104993] = INVSLOT_MAINHAND, -- Enchanting: Jade Spirit
	[116660] = INVSLOT_MAINHAND, -- Enchanting: River's Song -- NEED CONFIRMATION
	[116631] = INVSLOT_MAINHAND, -- Enchanting: Colossus
	[104423] = INVSLOT_MAINHAND, -- Enchanting: Windsong (haste)
	[104510] = INVSLOT_MAINHAND, -- Enchanting: Windsong (mastery)
	[104509] = INVSLOT_MAINHAND, -- Enchanting: Windsong (critical strike)

	-- Glove
	[108788] = INVSLOT_HAND, -- Engineering: Phase Fingers -- NEED CONFIRMATION
	[ 96228] = INVSLOT_HAND, -- Engineering: Synapse Springs, Mark II (agility)
	[ 96229] = INVSLOT_HAND, -- Engineering: Synapse Springs, Mark II (strength)
	[ 96230] = INVSLOT_HAND, -- Engineering: Synapse Springs, Mark II (intellect)

	-- Belt
	[131459] = INVSLOT_WAIST, -- Engineering: Watergliding Jets

	-- Cloak
	[126389] = INVSLOT_BACK, -- Engineering: Goblin Glider -- NEED CONFIRMATION
	[125488] = INVSLOT_BACK, -- Tailoring: Darkglow Embroidery, rank 3 -- NEED CONFIRMATION
	[125487] = INVSLOT_BACK, -- Tailoring: Lightweave Embroidery, rank 3
	[125489] = INVSLOT_BACK, -- Tailoring: Swordguard  Embroidery, rank 3 -- NEED CONFIRMATION

	-- Legendary meta gems
	[137593] = INVSLOT_HEAD, -- Indomitable Primal Diamond
	[137288] = INVSLOT_HEAD, -- Courageous Primal Diamond
	[137596] = INVSLOT_HEAD, -- Capacitive Primal Diamond
	[137590] = INVSLOT_HEAD, -- Sinister Primal Diamond
}

-- Anything below this line is generated with the extractor. Editing it is useless.
--== CUT HERE ==--
version = 20140921195459
trinkets   [   408] =  32492 -- Kidney Shot <= Ashtongue Talisman of Lethality
consumables[   437] =   2455 -- Restore Mana <= Minor Mana Potion
consumables[   438] =   3385 -- Restore Mana <= Lesser Mana Potion
consumables[   439] =    118 -- Healing Potion <= Minor Healing Potion
consumables[   440] = { -- Healing Potion
       858, -- Lesser Healing Potion
      4596, -- Discolored Healing Potion
}
consumables[   441] =    929 -- Healing Potion
consumables[   673] =   5997 -- Minor Defense <= Elixir of Minor Defense
consumables[   746] =   1251 -- First Aid <= Linen Bandage
consumables[   833] =   1401 -- Green Tea <= Riverpaw Tea Leaf
trinkets   [   835] =   1404 -- Tidal Charm
consumables[  1090] =   2091 -- Sleep <= Magic Dust
trinkets   [  1139] =   5079 -- Cold Eye <= Cold Basilisk Eye
consumables[  1159] =   2581 -- First Aid <= Heavy Linen Bandage
consumables[  1940] =   1178 -- Rocket Blast <= Explosive Rocket
consumables[  2023] = { -- Restore Mana
      3827, -- Mana Potion
     35287, -- Luminous Bluetail
}
consumables[  2024] =   1710 -- Healing Potion <= Greater Healing Potion
consumables[  2367] =   2454 -- Lion's Strength <= Elixir of Lion's Strength
consumables[  2370] =   2456 -- Rejuvenation Potion <= Minor Rejuvenation Potion
consumables[  2374] =   2457 -- Minor Agility <= Elixir of Minor Agility
consumables[  2378] =   2458 -- Minor Fortitude <= Elixir of Minor Fortitude
consumables[  2379] = { -- Speed
      2459, -- Swiftness Potion
     54213, -- Molotov Cocktail
}
consumables[  2380] =   3384 -- Resistance <= Minor Magic Resistance Potion
consumables[  2823] = { -- Deadly Poison
     22053, -- Deadly Poison
     43232, -- Deadly Poison
}
consumables[  3160] =   3390 -- Lesser Agility <= Elixir of Lesser Agility
consumables[  3164] =   3391 -- Ogre's Strength <= Elixir of Ogre's Strength
consumables[  3166] =   3383 -- Wisdom <= Elixir of Wisdom
consumables[  3169] =   3387 -- Invulnerability <= Limited Invulnerability Potion
consumables[  3219] =   3382 -- Weak Troll's Blood <= Weak Troll's Blood Elixir
consumables[  3220] =   3389 -- Defense <= Elixir of Defense
consumables[  3222] =   3388 -- Strong Troll's Blood Elixir
consumables[  3223] =   3826 -- Major Troll's Blood Elixir
consumables[  3267] =   3530 -- First Aid <= Wool Bandage
consumables[  3268] =   3531 -- First Aid <= Heavy Wool Bandage
consumables[  3593] =   3825 -- Elixir of Fortitude
consumables[  3680] =   3823 -- Lesser Invisibility <= Lesser Invisibility Potion
consumables[  4042] = { -- Healing Potion
      3928, -- Superior Healing Potion
     18839, -- Combat Healing Potion
}
trinkets   [  4073] =   4396 -- Mechanical Dragonling
trinkets   [  4079] =   4397 -- Cloaking <= Gnomish Cloaking Device
consumables[  4130] =   4481 -- Banish Burning Exile <= Cresting Charm
consumables[  4131] =   4480 -- Banish Cresting Exile <= Thundering Charm
consumables[  4132] =   4479 -- Banish Thundering Exile <= Burning Charm
consumables[  4941] =   4623 -- Stoneshield <= Lesser Stoneshield Potion
trinkets   [  5171] =  32492 -- Slice and Dice <= Ashtongue Talisman of Lethality
consumables[  5665] =   5206 -- Fury of the Bogling <= Bogling Root
consumables[  6084] =   5332 -- Summon Ghost Saber <= Glowing Cat Figurine
consumables[  6114] =   5342 -- Raptor Punch
trinkets   [  6251] =  13382 -- Summon Crimson Cannon <= Cannonball Runner
consumables[  6405] =  66888 -- Furbolg Form <= Stave of Fur and Claw
consumables[  6612] =   5631 -- Rage <= Rage Potion
consumables[  6613] =   5633 -- Great Rage <= Great Rage Potion
consumables[  6615] = { -- Free Action
      5634, -- Free Action Potion
    116267, -- Free Action Potion
}
consumables[  6668] = { -- Red Firework
      9318, -- Red Firework
    104149, -- Red Firework
}
consumables[  6724] =   5816 -- Light of Elune
consumables[  7233] =   6049 -- Fire Protection <= Fire Protection Potion
consumables[  7239] =   6050 -- Frost Protection <= Frost Protection Potion
consumables[  7242] =   6048 -- Shadow Protection <= Shadow Protection Potion
consumables[  7245] =   6051 -- Holy Protection <= Holy Protection Potion
consumables[  7254] =   6052 -- Nature Protection <= Nature Protection Potion
consumables[  7840] =   6372 -- Swim Speed <= Swim Speed Potion
consumables[  7844] =   6373 -- Fire Power <= Elixir of Firepower
consumables[  7926] =   6450 -- First Aid <= Silk Bandage
consumables[  7927] =   6451 -- First Aid <= Heavy Silk Bandage
consumables[  7932] =   6452 -- Anti-Venom
consumables[  7933] =   6453 -- Strong Anti-Venom
consumables[  8063] =   6522 -- Deviate Fish
consumables[  8091] =   3013 -- Armor <= Scroll of Protection
consumables[  8094] =   1478 -- Armor <= Scroll of Protection II
consumables[  8095] =   4421 -- Armor <= Scroll of Protection III
consumables[  8096] =    955 -- Intellect <= Scroll of Intellect
consumables[  8097] =   2290 -- Intellect <= Scroll of Intellect II
consumables[  8098] =   4419 -- Intellect <= Scroll of Intellect III
consumables[  8099] =   1180 -- Stamina <= Scroll of Stamina
consumables[  8100] =   1711 -- Stamina <= Scroll of Stamina II
consumables[  8101] =   4422 -- Stamina <= Scroll of Stamina III
consumables[  8112] =   1181 -- Spirit <= Scroll of Spirit
consumables[  8113] =   1712 -- Spirit <= Scroll of Spirit II
consumables[  8114] =   4424 -- Spirit <= Scroll of Spirit III
consumables[  8115] =   3012 -- Agility <= Scroll of Agility
consumables[  8116] =   1477 -- Agility <= Scroll of Agility II
consumables[  8117] =   4425 -- Agility <= Scroll of Agility III
consumables[  8118] =    954 -- Strength <= Scroll of Strength
consumables[  8119] =   2289 -- Strength <= Scroll of Strength II
consumables[  8120] =   4426 -- Strength <= Scroll of Strength III
consumables[  8212] =   6662 -- Giant Growth <= Elixir of Giant Growth
consumables[  8213] =   6657 -- Cooked Deviate Fish <= Savory Deviate Delight
trinkets   [  8344] =   7506 -- Universal Remote <= Gnomish Universal Remote
consumables[  8679] =  43230 -- Wound Poison <= Instant Poison
consumables[  8690] =   6948 -- Hearthstone
consumables[  9512] =   7676 -- Restore Energy <= Thistle Tea
trinkets   [  9515] =   3456 -- Summon Tracking Hound <= Dog Whistle
trinkets   [ 10342] =   1490 -- Guardian Effect <= Guardian Talisman
trinkets   [ 10368] =  11302 -- Uther's Light Effect <= Uther's Strength
consumables[ 10667] =   8410 -- Rage of Ages <= R.O.I.D.S.
consumables[ 10668] =   8411 -- Spirit of Boar <= Lung Juice Cocktail
consumables[ 10669] =   8412 -- Strike of the Scorpok <= Ground Scorpok Assay
consumables[ 10692] =   8423 -- Infallible Mind <= Cerebral Cortex Compound
consumables[ 10693] =   8424 -- Spiritual Domination <= Gizzard Gum
consumables[ 10838] =   8544 -- First Aid <= Mageweave Bandage
consumables[ 10839] =   8545 -- First Aid <= Heavy Mageweave Bandage
consumables[ 11007] = { -- Weak Alcohol
      2686, -- Thunder Ale
      2723, -- Bottle of Dalaran Noir
      2894, -- Rhapsody Malt
     17196, -- Holiday Spirits
     19222, -- Cheap Beer
     40035, -- Northrend Honey Mead
     44570, -- Glass of Eversong Wine
     44616, -- Glass of Dalaran White
     61982, -- Fizzy Fruit Wine
     81407, -- Four Wind Soju
     82343, -- Lordaeron Lambic
     83095, -- Lagrave Stout
     98157, -- Big Blossom Brew
    117437, -- Skyreach Sunrise
    117441, -- Elekk's Neck
    117453, -- "Da Bruisery" OPA
}
consumables[ 11008] = { -- Standard Alcohol
      2593, -- Flask of Stormwind Tawny
      2596, -- Skin of Dwarven Stout
      3703, -- Southshore Stout
     11846, -- Wizbang's Special Brew
     17403, -- Steamwheedle Fizzy Spirits
     18287, -- Evermurky
     40036, -- Snowplum Brandy
     44571, -- Bottle of Silvermoon Port
     44575, -- Flask of Bitter Cactus Cider
     44617, -- Glass of Dalaran Red
     44618, -- Glass of Aged Dalaran Red
     44619, -- Glass of Peaked Dalaran Red
     57543, -- Stormhammer Stout
     61983, -- Imported E.K. Ale
     61984, -- Potent Pineapple Punch
     62908, -- Hair of the Dog
     63275, -- Gilnean Fortified Brandy
     63291, -- Blood Red Ale
     63292, -- Disgusting Rotgut
     63293, -- Blackheart Grog
     63296, -- Embalming Fluid
     63299, -- Sunkissed Wine
}
consumables[ 11009] = { -- Strong Alcohol
      2594, -- Flagon of Dwarven Mead
      2595, -- Jug of Badlands Bourbon
      4595, -- Junglevine Wine
      4600, -- Cherry Grog
      9260, -- Volatile Rum
      9360, -- Cuergo's Gold
     17402, -- Greatfather's Winter Ale
     18288, -- Molasses Firewater
     28284, -- Don Carlos Tequila
     29112, -- Cenarion Spirits
     32667, -- Bash Ale
     38350, -- Winterfin "Depth Charge"
     38432, -- Plugger's Blackrock Ale
     40042, -- Caraway Burnwine
     43695, -- Half Full Bottle of Prison Moonshine
     43696, -- Half Empty Bottle of Prison Moonshine
     44573, -- Cup of Frog Venom Brew
     44574, -- Skin of Mulgore Firewater
     61985, -- Banana Cocktail
     61986, -- Tol Barad Coconut Rum
     62674, -- Highland Spirits
     62790, -- Darkbrew Lager
     64639, -- Silversnap Ice
     81415, -- Pandaren Plum Wine
     82344, -- Hearthglen Ambrosia
     83094, -- Foote Tripel
     88531, -- Lao Chin's Last Mug
     89683, -- Hozen Cuervo
     93208, -- Darkmoon P.I.E.
    117439, -- "Da Bruisery" Hot & Wroth
    117440, -- Peglegger's Porter
    117442, -- Thunderbelly Mead
    117568, -- Jug of Ironwine
    119022, -- Shadowmoon Sugar Pear Cider
}
trinkets   [ 11209] =   8703 -- Summon Smithing Hammer <= Signet of Expertise
consumables[ 11319] =   8827 -- Water Walking <= Elixir of Water Walking
consumables[ 11328] =   8949 -- Agility <= Elixir of Agility
consumables[ 11334] =   9187 -- Greater Agility <= Elixir of Greater Agility
consumables[ 11348] =  13445 -- Greater Armor <= Elixir of Superior Defense
consumables[ 11349] =   8951 -- Armor <= Elixir of Greater Defense
consumables[ 11350] = { -- Fire Shield
      8956, -- Oil of Immolation
    118699, -- Oil of Immolation
}
consumables[ 11359] =   9030 -- Restoration <= Restorative Potion
consumables[ 11364] =   9036 -- Resistance <= Magic Resistance Potion
consumables[ 11371] =   9088 -- Gift of Arthas
consumables[ 11387] =   9144 -- Wildvine Potion
consumables[ 11389] = { -- Detect Undead
      9154, -- Elixir of Detect Undead
    116272, -- Elixir of Detect Undead
}
consumables[ 11390] =   9155 -- Arcane Elixir
consumables[ 11392] =   9172 -- Invisibility <= Invisibility Potion
consumables[ 11396] =   9179 -- Greater Intellect <= Elixir of Greater Intellect
consumables[ 11403] = { -- Dream Vision
      9197, -- Elixir of Dream Vision
    116273, -- Elixir of Dream Vision
}
consumables[ 11405] =   9206 -- Elixir of the Giants <= Elixir of Giants
consumables[ 11406] =   9224 -- Elixir of Demonslaying
consumables[ 11407] = { -- Detect Demon
      9233, -- Elixir of Detect Demon
    116274, -- Elixir of Detect Demon
}
consumables[ 11474] =   9264 -- Shadow Power <= Elixir of Shadow Power
consumables[ 11540] = { -- Blue Firework
      9312, -- Blue Firework
    104154, -- Blue Firework
}
consumables[ 11541] = { -- Green Firework
      9313, -- Green Firework
    104153, -- Green Firework
}
consumables[ 11542] = { -- Red Streaks Firework
      9314, -- Red Streaks Firework
    104152, -- Red Streaks Firework
}
consumables[ 11543] = { -- Red, White and Blue Firework
      9317, -- Red, White and Blue Firework
    104150, -- Red, White and Blue Firework
}
consumables[ 11544] = { -- Yellow Rose Firework
      9315, -- Yellow Rose Firework
     19026, -- Snake Burst Firework
    104148, -- Snake Burst Firework
    104151, -- Yellow Rose Firework
}
consumables[ 11629] = { -- Potent Alcohol
      9361, -- Cuergo's Gold with Worm
     12003, -- Dark Dwarven Lager
     19221, -- Darkmoon Special Reserve
     23848, -- Nethergarde Bitter
     44716, -- Mysterious Fermented Liquid
     61384, -- Doublerum
    113108, -- Ogre Moonshine
    116917, -- Sailor Zazzuk's 180-Proof Rum
}
consumables[ 11903] =   6149 -- Restore Mana <= Greater Mana Potion
consumables[ 12174] =  10309 -- Agility <= Scroll of Agility IV
consumables[ 12175] =  10305 -- Armor <= Scroll of Protection IV
consumables[ 12176] =  10308 -- Intellect <= Scroll of Intellect IV
consumables[ 12177] =  10306 -- Spirit <= Scroll of Spirit IV
consumables[ 12178] =  10307 -- Stamina <= Scroll of Stamina IV
consumables[ 12179] =  10310 -- Strength <= Scroll of Strength IV
trinkets   [ 12257] =    744 -- Breath of Fire <= Thunderbrew's Boot Flask
trinkets   [ 12438] =  18951 -- Slow Fall <= Evonice's Landin' Pilla
trinkets   [ 12733] =  10418 -- Mithril Insignia <= Glimmering Mithril Insignia
trinkets   [ 12749] =  10576 -- Mithril Mechanical Dragonling
trinkets   [ 12766] =  10455 -- Poison Cloud <= Chained Essence of Eranikus
trinkets   [ 13006] =  10716 -- Shrink Ray <= Gnomish Shrink Ray
trinkets   [ 13120] =  10720 -- Net-o-Matic <= Gnomish Net-o-Matic Projector
trinkets   [ 13183] =  10727 -- Goblin Dragon Gun
trinkets   [ 13237] =  10577 -- Goblin Mortar
trinkets   [ 13278] =  10645 -- Gnomish Death Ray
trinkets   [ 13744] =   2802 -- Blazing Emblem
trinkets   [ 14053] =   1713 -- Heal <= Ankh of Life
trinkets   [ 14530] =   2820 -- Speed <= Nifty Stopwatch
trinkets   [ 14537] =   7734 -- Six Demon Bag
consumables[ 14814] =  11325 -- Throw Dark Iron Ale <= Dark Iron Ale Mug
trinkets   [ 15595] =  11810 -- Force of Will
trinkets   [ 15601] =  11815 -- Hand of Justice
trinkets   [ 15604] =  11819 -- Second Wind
trinkets   [ 15646] =  11832 -- Burst of Knowledge
consumables[ 15700] =  11951 -- Whipper Root Tuber
consumables[ 15701] =  11952 -- Night Dragon's Breath
trinkets   [ 15712] =  11905 -- Linken's Boomerang
consumables[ 15822] =  12190 -- Dreamless Sleep <= Dreamless Sleep Potion
consumables[ 15852] =  12217 -- Dragonbreath Chili
consumables[ 16537] =  12586 -- Immature Venom Sac
consumables[ 16589] =   8529 -- Noggenfogger Elixir
trinkets   [ 16739] =   1973 -- Orb of Deception
consumables[ 17038] =  12820 -- Winterfall Firewater
trinkets   [ 17275] =  13164 -- Heart of the Scale
trinkets   [ 17283] =  13171 -- Smokey's Lighter
trinkets   [ 17330] =  13213 -- Poison <= Smolderweb's Eye
consumables[ 17528] = { -- Mighty Rage
     13442, -- Mighty Rage Potion
    116275, -- Mighty Rage Potion
}
consumables[ 17530] = { -- Restore Mana
     13443, -- Superior Mana Potion
     18841, -- Combat Mana Potion
}
consumables[ 17531] = { -- Restore Mana
     13444, -- Major Mana Potion
     28101, -- Unstable Mana Potion
     31840, -- Major Combat Mana Potion
     31841, -- Major Combat Mana Potion
     31854, -- Major Combat Mana Potion
     31855, -- Major Combat Mana Potion
}
consumables[ 17534] = { -- Healing Potion
     13446, -- Major Healing Potion
     28100, -- Volatile Healing Potion
     31838, -- Major Combat Healing Potion
     31839, -- Major Combat Healing Potion
     31852, -- Major Combat Healing Potion
     31853, -- Major Combat Healing Potion
}
consumables[ 17535] =  13447 -- Elixir of the Sages
consumables[ 17537] =  13453 -- Elixir of Brute Force
consumables[ 17538] =  13452 -- Elixir of the Mongoose
consumables[ 17539] =  13454 -- Greater Arcane Elixir
consumables[ 17540] =  13455 -- Greater Stoneshield <= Greater Stoneshield Potion
consumables[ 17543] =  13457 -- Fire Protection <= Greater Fire Protection Potion
consumables[ 17544] =  13456 -- Frost Protection <= Greater Frost Protection Potion
consumables[ 17546] =  13458 -- Nature Protection <= Greater Nature Protection Potion
consumables[ 17548] =  13459 -- Shadow Protection <= Greater Shadow Protection Potion
consumables[ 17549] =  13461 -- Arcane Protection <= Greater Arcane Protection Potion
consumables[ 17550] =  13462 -- Purification <= Purification Potion
consumables[ 17624] = { -- Petrification
     13506, -- Potion of Petrification
    116277, -- Potion of Petrification
}
consumables[ 17626] =  13510 -- Flask of the Titans
consumables[ 17627] =  13511 -- Distilled Wisdom <= Flask of Distilled Wisdom
consumables[ 17628] =  13512 -- Supreme Power <= Flask of Supreme Power
consumables[ 17629] =  13513 -- Chromatic Resistance <= Flask of Chromatic Resistance
trinkets   [ 17668] =  13515 -- Ramstein's Lightning Bolts
trinkets   [ 17712] =    833 -- Lifestone Healing <= Lifestone
consumables[ 18071] =  13724 -- Enriched Manna Biscuit
consumables[ 18124] =  13810 -- Blessed Sunfruit
trinkets   [ 18307] =  14022 -- Death by Peasant <= Barov Peasant Caller
trinkets   [ 18308] =  14023 -- Death by Peasant <= Barov Peasant Caller
trinkets   [ 18400] =  13379 -- Piccolo of the Flaming Fire
consumables[ 18608] =  14529 -- First Aid <= Runecloth Bandage
consumables[ 18610] =  14530 -- First Aid <= Heavy Runecloth Bandage
trinkets   [ 18805] =   4381 -- Recombobulate <= Minor Recombobulator
trinkets   [ 18946] =  14557 -- The Lion Horn of Stormwind
trinkets   [ 19638] =  15867 -- Prismstone <= Prismcharm
trinkets   [ 19804] =  16022 -- Arcanite Dragonling
trinkets   [ 20587] =  15873 -- Ragged John's Neverending Cup
consumables[ 21149] =  17198 -- Egg Nog <= Winter Veil Egg Nog
consumables[ 21393] =  17348 -- Healing Draught <= Major Healing Draught
consumables[ 21394] =  17349 -- Healing Draught <= Superior Healing Draught
consumables[ 21395] =  17351 -- Restore Mana <= Major Mana Draught
consumables[ 21396] =  17352 -- Restore Mana <= Superior Mana Draught
consumables[ 21920] =  17708 -- Frost Power <= Elixir of Frost Power
trinkets   [ 21954] =  17744 -- Dispel Poison <= Heart of Noxxion
consumables[ 21955] =  17747 -- Razorlash Root
trinkets   [ 21956] =  17759 -- Physical Protection <= Mark of Resolution
trinkets   [ 21970] =  17774 -- Mark of the Chosen
trinkets   [ 22563] = { -- Recall
     17690, -- Frostwolf Insignia Rank 1
     17905, -- Frostwolf Insignia Rank 2
     17906, -- Frostwolf Insignia Rank 3
     17907, -- Frostwolf Insignia Rank 4
     17908, -- Frostwolf Insignia Rank 5
     17909, -- Frostwolf Insignia Rank 6
}
trinkets   [ 22564] = { -- Recall
     17691, -- Stormpike Insignia Rank 1
     17900, -- Stormpike Insignia Rank 2
     17901, -- Stormpike Insignia Rank 3
     17902, -- Stormpike Insignia Rank 4
     17903, -- Stormpike Insignia Rank 5
     17904, -- Stormpike Insignia Rank 6
}
consumables[ 22729] =  18253 -- Rejuvenation Potion <= Major Rejuvenation Potion
trinkets   [ 23064] =  18637 -- Recombobulate <= Major Recombobulator
consumables[ 23065] =  18640 -- Throw Rock <= Happy Fun Rock
trinkets   [ 23097] =  18638 -- Fire Reflector <= Hyper-Radiant Flame Reflector
trinkets   [ 23131] =  18634 -- Frost Reflector <= Gyrofreeze Ice Reflector
trinkets   [ 23132] =  18639 -- Shadow Reflector <= Ultra-Flash Shadow Reflector
trinkets   [ 23133] =  10725 -- Gnomish Battle Chicken
trinkets   [ 23134] =  10587 -- Goblin Bomb <= Goblin Bomb Dispenser
consumables[ 23135] =  18662 -- Heavy Leather Ball
trinkets   [ 23271] =  18820 -- Ephemeral Power <= Talisman of Ephemeral Power
trinkets   [ 23506] =  19024 -- Aura of Protection <= Arena Grand Master
trinkets   [ 23595] =  19141 -- Luffa
consumables[ 23645] =  19183 -- Hourglass Sand
trinkets   [ 23682] =  19287 -- Heroism <= Darkmoon Card: Heroism
trinkets   [ 23684] =  19288 -- Aura of the Blue Dragon <= Darkmoon Card: Blue Dragon
trinkets   [ 23687] =  19289 -- Lightning Strike <= Darkmoon Card: Maelstrom
consumables[ 23692] =  19301 -- Alterac Manna Biscuit
trinkets   [ 23720] =  19337 -- Blessing of the Black Book <= The Black Book
trinkets   [ 23721] =  19336 -- Arcane Infused <= Arcane Infused Gem
trinkets   [ 23723] =  19339 -- Mind Quickening <= Mind Quickening Gem
trinkets   [ 23724] =  19340 -- Metamorphosis Rune <= Rune of Metamorphosis
trinkets   [ 23725] =  19341 -- Gift of Life <= Lifegiving Gem
trinkets   [ 23726] =  19342 -- Venomous Totem
trinkets   [ 23733] =  19343 -- Blinding Light <= Scrolls of Blinding Light
trinkets   [ 23734] =  19344 -- Nature Aligned <= Natural Alignment Crystal
trinkets   [ 23780] =  19345 -- Aegis of Preservation
consumables[ 23786] =  19440 -- Powerful Anti-Venom
trinkets   [ 23991] = { -- Damage Absorb
     20071, -- Talisman of Arathor
     20072, -- Defiler's Talisman
}
trinkets   [ 24268] =  19930 -- Mar'li's Brain Boost <= Mar'li's Eye
trinkets   [ 24347] =  19979 -- Master Angler <= Hook of the Master Angler
trinkets   [ 24352] =  19991 -- Devilsaur Fury <= Devilsaur Eye
trinkets   [ 24354] =  19990 -- Prayer Beads Blessing <= Blessed Prayer Beads
consumables[ 24360] =  20002 -- Greater Dreamless Sleep <= Greater Dreamless Sleep Potion
consumables[ 24361] =  20004 -- Mighty Troll's Blood Elixir
consumables[ 24363] =  20007 -- Mageblood Elixir
consumables[ 24364] =  20008 -- Living Free Action <= Living Action Potion
consumables[ 24382] =  20079 -- Spirit of Zanza
consumables[ 24383] =  20081 -- Swiftness of Zanza
consumables[ 24384] =  20031 -- Essence Mango
trinkets   [ 24389] =  20036 -- Chaos Fire <= Fire Ruby
consumables[ 24417] =  20080 -- Sheen of Zanza
trinkets   [ 24427] =  20130 -- Diamond Flask
trinkets   [ 24498] =  19952 -- Brilliant Light <= Gri'lek's Charm of Valor
trinkets   [ 24499] =  19956 -- Energized Shield <= Wushoolay's Charm of Spirits
trinkets   [ 24531] =  19953 -- Refocus <= Renataki's Charm of Beasts
trinkets   [ 24532] =  19954 -- Burst of Energy <= Renataki's Charm of Trickery
trinkets   [ 24542] =  19955 -- Nimble Healing Touch <= Wushoolay's Charm of Nature
trinkets   [ 24543] =  19957 -- Massive Destruction <= Hazza'rah's Charm of Destruction
trinkets   [ 24544] =  19959 -- Arcane Potency <= Hazza'rah's Charm of Magic
trinkets   [ 24546] =  19958 -- Rapid Healing <= Hazza'rah's Charm of Healing
trinkets   [ 24571] =  19951 -- Blood Fury <= Gri'lek's Charm of Might
trinkets   [ 24574] =  19948 -- Brittle Armor <= Zandalarian Hero Badge
trinkets   [ 24610] =  19947 -- Pagle's Broken Reel <= Nat Pagle's Broken Reel
trinkets   [ 24658] =  19950 -- Unstable Power <= Zandalarian Hero Charm
trinkets   [ 24661] =  19949 -- Restless Strength <= Zandalarian Hero Medallion
trinkets   [ 24854] =  20503 -- Mana Spring Totem <= Enamored Water Spirit
trinkets   [ 24865] =  20512 -- Sanctified Orb
trinkets   [ 24998] =  20636 -- Healing of the Ages <= Hibernation Crystal
consumables[ 25037] =  20709 -- Rumsey Rum Light
trinkets   [ 25112] =  20534 -- Summon Voidwalker <= Abyss Shard
consumables[ 25677] =  21038 -- Snowball <= Hardpacked Snowball
consumables[ 25690] =  21072 -- Brain Food <= Smoked Sagefish
consumables[ 25691] =  21217 -- Brain Food <= Sagefish Delight
consumables[ 25722] =  21114 -- Rumsey Rum Dark
trinkets   [ 25746] = { -- Damage Absorb
     21115, -- Defiler's Talisman
     21117, -- Talisman of Arathor
}
trinkets   [ 25747] = { -- Damage Absorb
     21116, -- Defiler's Talisman
     21118, -- Talisman of Arathor
}
trinkets   [ 25750] = { -- Damage Absorb
     21119, -- Talisman of Arathor
     21120, -- Defiler's Talisman
     65286, -- Ancient Seed Casing
}
consumables[ 25804] =  21151 -- Rumsey Rum Black Label
consumables[ 25823] = { -- Spotlight
     21536, -- Elune Stone
-- Types mélangés ! ======================
     45631, -- High-Powered Flashlight
}
consumables[ 25851] =  21171 -- Lightheaded <= Filled Festive Mug
trinkets   [ 25891] =  21180 -- Earthstrike
trinkets   [ 25892] =  21181 -- Grace of Earth
consumables[ 25990] =  21215 -- Graccu's Mince Meat Fruitcake
consumables[ 26030] =  11950 -- Windblossom Berries
trinkets   [ 26066] =  21326 -- Defender of the Timbermaw
consumables[ 26074] =  21328 -- Holiday Cheer <= Wand of Holiday Cheer
trinkets   [ 26166] =  21473 -- Obsidian Insight <= Eye of Moam
trinkets   [ 26168] =  21488 -- Chitinous Spikes <= Fetish of Chitinous Spikes
consumables[ 26265] =  21540 -- Create Elune Stone <= Elune's Lantern
consumables[ 26276] =  21546 -- Greater Firepower <= Elixir of Greater Firepower
consumables[ 26374] =  21713 -- Elune's Candle
consumables[ 26389] =  21721 -- Moonglow Alcohol <= Moonglow
trinkets   [ 26391] =  21579 -- Tentacle Call <= Vanquished Tentacle of C'Thun
trinkets   [ 26400] =  21647 -- Arcane Shroud <= Fetish of the Sand Reaver
trinkets   [ 26463] =  21685 -- Mercurial Shield <= Petrified Scarab
trinkets   [ 26467] =  21625 -- Persistent Shield <= Scarab Brooch
trinkets   [ 26480] =  21670 -- Badge of the Swarmguard
trinkets   [ 26551] =  21748 -- Jade Owl <= Figurine - Jade Owl
trinkets   [ 26571] =  21756 -- Golden Hare <= Figurine - Golden Hare
trinkets   [ 26576] =  21758 -- Black Pearl Panther <= Figurine - Black Pearl Panther
trinkets   [ 26581] =  21760 -- Truesilver Crab <= Figurine - Truesilver Crab
trinkets   [ 26593] =  21763 -- Truesilver Boar <= Figurine - Truesilver Boar
trinkets   [ 26599] =  21769 -- Ruby Serpent <= Figurine - Ruby Serpent
trinkets   [ 26600] =  21777 -- Emerald Owl <= Figurine - Emerald Owl
trinkets   [ 26609] =  21784 -- Black Diamond Crab <= Figurine - Black Diamond Crab
trinkets   [ 26614] =  21789 -- Dark Iron Scorpid <= Figurine - Dark Iron Scorpid
consumables[ 26677] =   3386 -- Cure Poison <= Potion of Curing
trinkets   [ 26789] =  21891 -- Shard of the Fallen Star
consumables[ 27030] =  21990 -- First Aid <= Netherweave Bandage
consumables[ 27031] =  21991 -- First Aid <= Heavy Netherweave Bandage
consumables[ 27571] =  22218 -- Cascade of Roses <= Handful of Rose Petals
trinkets   [ 27655] =  22321 -- Flame Lash <= Heart of Wyrmthalak
consumables[ 27661] =  22261 -- Love Fool
trinkets   [ 27675] =  22268 -- Chromatic Infusion <= Draconic Infused Emblem
trinkets   [ 28200] =  22678 -- Ascendance <= Talisman of Ascendance
consumables[ 28489] =  22823 -- Camouflage <= Elixir of Camouflage
consumables[ 28490] =  22824 -- Major Strength <= Elixir of Major Strength
consumables[ 28491] =  22825 -- Healing Power <= Elixir of Healing Power
consumables[ 28492] =  22826 -- Sneaking <= Sneaking Potion
consumables[ 28493] =  22827 -- Major Frost Power <= Elixir of Major Frost Power
consumables[ 28494] =  22828 -- Insane Strength Potion
consumables[ 28495] = { -- Healing Potion
     22829, -- Super Healing Potion
     32947, -- Auchenai Healing Potion
     33934, -- Crystal Healing Potion
     39671, -- Resurgent Healing Potion
     43531, -- Argent Healing Potion
     43569, -- Endless Healing Potion
}
consumables[ 28496] =  22830 -- Greater Stealth Detection <= Elixir of the Searching Eye
consumables[ 28497] =  39666 -- Mighty Agility <= Elixir of Mighty Agility
consumables[ 28499] = { -- Restore Mana
     22832, -- Super Mana Potion
     32948, -- Auchenai Mana Potion
     33935, -- Crystal Mana Potion
     40067, -- Icy Mana Potion
     43530, -- Argent Mana Potion
     43570, -- Endless Mana Potion
}
consumables[ 28501] =  22833 -- Major Firepower <= Elixir of Major Firepower
consumables[ 28502] =  22834 -- Major Armor <= Elixir of Major Defense
consumables[ 28503] =  22835 -- Major Shadow Power <= Elixir of Major Shadow Power
consumables[ 28504] =  22836 -- Major Dreamless Sleep <= Major Dreamless Sleep Potion
consumables[ 28506] =  22837 -- Potion of Heroes <= Heroic Potion
consumables[ 28507] =  22838 -- Haste <= Haste Potion
consumables[ 28508] =  22839 -- Destruction <= Destruction Potion
consumables[ 28509] =  22840 -- Greater Mana Regeneration <= Elixir of Major Mageblood
consumables[ 28511] = { -- Fire Protection
     22841, -- Major Fire Protection Potion
     32846, -- Major Fire Protection Potion
}
consumables[ 28512] = { -- Frost Protection
     22842, -- Major Frost Protection Potion
     32847, -- Major Frost Protection Potion
}
consumables[ 28513] = { -- Nature Protection
     22844, -- Major Nature Protection Potion
     32844, -- Major Nature Protection Potion
}
consumables[ 28515] =  22849 -- Ironshield <= Ironshield Potion
consumables[ 28517] =  22850 -- Rejuvenation Potion <= Super Rejuvenation Potion
consumables[ 28518] =  22851 -- Flask of Fortification
consumables[ 28519] =  22853 -- Flask of Mighty Restoration
consumables[ 28520] =  22854 -- Flask of Relentless Assault
consumables[ 28521] =  22861 -- Flask of Blinding Light
consumables[ 28536] = { -- Arcane Protection
     22845, -- Major Arcane Protection Potion
     32840, -- Major Arcane Protection Potion
}
consumables[ 28537] = { -- Shadow Protection
     22846, -- Major Shadow Protection Potion
     32845, -- Major Shadow Protection Potion
}
consumables[ 28538] =  22847 -- Holy Protection <= Major Holy Protection Potion
consumables[ 28540] =  22866 -- Flask of Pure Death
consumables[ 28548] =  22871 -- Shrouding <= Shrouding Potion
trinkets   [ 28760] =  23027 -- Mana Infusion <= Warmth of Forgiveness
trinkets   [ 28777] =  23041 -- Slayer's Crest
trinkets   [ 28778] =  23042 -- Loatheb's Reflection
trinkets   [ 28779] =  23046 -- Essence of Sapphiron <= The Restrained Essence of Sapphiron
trinkets   [ 28780] =  23047 -- The Eye of the Dead <= Eye of the Dead
trinkets   [ 28862] =  23001 -- The Eye of Diminution <= Eye of Diminution
trinkets   [ 28866] =  22954 -- Kiss of the Spider
consumables[ 29236] =   3087 -- Shimmer Stout <= Mug of Shimmer Stout
consumables[ 29251] =  23329 -- Enriched Lasher Root
consumables[ 29271] =  23334 -- Power Surge <= Cracked Power Core
consumables[ 29276] =  23354 -- Crystalized Mana Residue
consumables[ 29308] =  23381 -- Power Surge <= Chipped Power Core
consumables[ 29312] =  23386 -- Condesned Mana Powder <= Condensed Mana Powder
consumables[ 29348] =  23444 -- Goldenmist Special Brew
trinkets   [ 29506] =  23558 -- The Burrower's Shell
trinkets   [ 29601] =  28727 -- Enlightenment <= Pendant of the Violet Eye
trinkets   [ 29602] =  23570 -- Jom Gabbar
consumables[ 30161] =  49703 -- Purple Firework <= Perpetual Purple Firework
consumables[ 30167] =  49704 -- Red Ogre Costume <= Carved Ogre Idol
consumables[ 30262] =  23768 -- White Smoke Flare
consumables[ 30263] =  23769 -- Red Smoke Flare
consumables[ 30264] =  23771 -- Green Smoke Flare
trinkets   [ 30507] =  23835 -- Poultryizer <= Gnomish Poultryizer
consumables[ 30550] =  23862 -- Redemption of the Fallen
consumables[ 30557] =  23865 -- Wrath of the Titans
consumables[ 30562] =  23857 -- Legacy of the Mountain King
consumables[ 30567] =  23864 -- Torment of the Worgen
trinkets   [ 31038] =  24124 -- Felsteel Boar <= Figurine - Felsteel Boar
trinkets   [ 31039] =  24125 -- Dawnstone Crab <= Figurine - Dawnstone Crab
trinkets   [ 31040] =  24126 -- Living Ruby Serpent <= Figurine - Living Ruby Serpent
trinkets   [ 31045] =  24127 -- Talasite Owl <= Figurine - Talasite Owl
trinkets   [ 31047] =  24128 -- Nightseye Panther <= Figurine - Nightseye Panther
consumables[ 31367] =  24268 -- Netherweave Net
trinkets   [ 31771] =  24376 -- Shell of Deterrence <= Runed Fungalcap
trinkets   [ 31794] =  24390 -- Focused Mind <= Auslese's Light Channeler
consumables[ 31958] =  24538 -- Fire Bomb Trigger <= Fire Bomb
trinkets   [ 32140] =  24551 -- Talisman of the Horde
consumables[ 32304] =  25548 -- Tallstalk Mushroom
consumables[ 32305] =  25550 -- Toadstool Toxin <= Redcap Toadstool
trinkets   [ 32355] = { -- Focused Power
     25619, -- Glowing Crystal Insignia
     25620, -- Ancient Crystal Talisman
}
trinkets   [ 32362] = { -- Burning Hatred
     25628, -- Ogre Mauler's Badge
     25633, -- Uniting Charm
}
trinkets   [ 32367] =  25634 -- Power of Prayer <= Oshu'gun Relic
trinkets   [ 32599] =  25786 -- Soothe <= Hypnotist's Watch
trinkets   [ 32600] =  25787 -- Avoidance <= Charm of Alacrity
trinkets   [ 32645] =  32492 -- Envenom <= Ashtongue Talisman of Lethality
consumables[ 32812] =  25886 -- Purple Smoke Flare
trinkets   [ 33012] =  26055 -- Consume Essence <= Oculus of the Hidden Eye
trinkets   [ 33014] =  27416 -- Consume Life <= Fetish of the Fallen
consumables[ 33077] =  27498 -- Agility <= Scroll of Agility V
consumables[ 33078] =  27499 -- Intellect <= Scroll of Intellect V
consumables[ 33079] =  27500 -- Armor <= Scroll of Protection V
consumables[ 33080] =  27501 -- Spirit <= Scroll of Spirit V
consumables[ 33081] =  27502 -- Stamina <= Scroll of Stamina V
consumables[ 33082] =  27503 -- Strength <= Scroll of Strength V
trinkets   [ 33089] =  27529 -- Vigilance of the Colossus <= Figurine of the Colossus
trinkets   [ 33370] = { -- Spell Haste
     27683, -- Quagmirran's Eye
     28190, -- Scarab of the Infinite Cycle
}
trinkets   [ 33394] =  27896 -- Replenish Mana <= Alembic of Infernal Power
trinkets   [ 33400] =  27828 -- Accelerated Mending <= Warp-Scarab Brooch
trinkets   [ 33479] =  27891 -- Adamantine Shell <= Adamantine Figurine
trinkets   [ 33486] =  27900 -- Heart's Mystique <= Jewel of Charismatic Mystique
trinkets   [ 33504] = { -- Mark of Conquest
     27920, -- Mark of Conquest
     27921, -- Mark of Conquest
}
trinkets   [ 33513] = { -- Mark of Defiance
     27922, -- Mark of Defiance
     27924, -- Mark of Defiance
}
trinkets   [ 33523] = { -- Mark of Vindication
     27926, -- Mark of Vindication
     27927, -- Mark of Vindication
}
trinkets   [ 33649] =  28034 -- Rage of the Unraveller <= Hourglass of the Unraveller
trinkets   [ 33662] =  28040 -- Arcane Energy <= Vengeance of the Illidari
trinkets   [ 33667] =  28041 -- Ferocity <= Bladefist's Breadth
trinkets   [ 33668] =  28042 -- Tenacity <= Regal Protectorate
consumables[ 33720] =  28102 -- Onslaught Elixir
consumables[ 33721] =  40070 -- Spellpower Elixir
consumables[ 33726] =  28104 -- Elixir of Mastery
trinkets   [ 33743] =  28108 -- Power Infused Mushroom
trinkets   [ 33758] =  28109 -- Essence Infused Mushroom
consumables[ 33772] =  28112 -- Underspore Pod
trinkets   [ 33807] =  28288 -- Abacus of Violent Odds
trinkets   [ 33828] =  25829 -- Talisman of the Alliance
trinkets   [ 33943] =  32481 -- Flight Form <= Charm of Swift Flight
trinkets   [ 34000] =  28223 -- The Arcanist's Stone <= Arcanist's Stone
trinkets   [ 34106] =  28121 -- Unyielding Courage <= Icon of Unyielding Courage
trinkets   [ 34210] =  28370 -- Endless Blessings <= Bangle of Endless Blessings
trinkets   [ 34321] =  28418 -- Call of the Nexus <= Shiffar's Nexus-Horn
consumables[ 34372] = 118191 -- Speak with Archmage Vargoth <= Archmage Vargoth's Spare Staff
trinkets   [ 34519] =  28528 -- Time's Favor <= Moroes' Lucky Pocket Watch
trinkets   [ 34587] =  28579 -- Romulo's Poison <= Romulo's Poison Vial
trinkets   [ 34747] =  28789 -- Recurring Power <= Eye of Magtheridon
trinkets   [ 34775] =  28830 -- Dragonspine Flurry <= Dragonspine Trophy
trinkets   [ 35163] =  29370 -- Blessing of the Silver Crescent <= Icon of the Silver Crescent
trinkets   [ 35165] =  29376 -- Essence of the Martyr
trinkets   [ 35166] =  29383 -- Lust for Battle <= Bloodlust Brooch
trinkets   [ 35337] = { -- Spell Power
     29132, -- Scryer's Bloodgem
     29179, -- Xi'ri's Gift
}
trinkets   [ 35352] =  29181 -- Soothe <= Timelapse Shard
consumables[ 35474] =  29532 -- Drums of Panic
consumables[ 35475] =  29528 -- Drums of War
consumables[ 35476] =  29529 -- Drums of Battle
consumables[ 35477] =  29530 -- Drums of Speed
consumables[ 35478] =  29531 -- Drums of Restoration
trinkets   [ 35733] =  29776 -- Ancient Power <= Core of Ar'kelos
trinkets   [ 36347] =  30293 -- Healing Power <= Heavenly Inspiration
trinkets   [ 36372] =  30300 -- Phalanx <= Dabiri's Enigma
trinkets   [ 36432] =  30340 -- Spell Power <= Starkiller's Bauble
trinkets   [ 37174] =  30450 -- Perceived Weakness <= Warp-Spring Coil
trinkets   [ 37198] =  30447 -- Blessing of Righteousness <= Tome of Fiery Redemption
trinkets   [ 37243] =  30663 -- Revitalize <= Fathom-Brooch of the Tidewalker
trinkets   [ 37360] =  30696 -- Consecrated Weapon <= Scourgebane
trinkets   [ 37508] =  30448 -- Shot Power <= Talon of Al'ar
trinkets   [ 37656] =  32496 -- Wisdom <= Memento of Tyrande
trinkets   [ 37877] =  30841 -- Blessing of Faith <= Lower City Prayerbook
trinkets   [ 38324] =  30619 -- Regeneration <= Fel Reaver's Piston
trinkets   [ 38325] =  30620 -- Regeneration <= Spyglass of the Hidden Fleet
trinkets   [ 38329] =  30621 -- Threat Reduction <= Prism of Inner Calm
trinkets   [ 38332] =  28590 -- Blessing of Life <= Ribbon of Sacrifice
trinkets   [ 38346] =  28370 -- Meditation <= Bangle of Endless Blessings
trinkets   [ 38348] =  30626 -- Unstable Currents <= Sextant of Unstable Currents
trinkets   [ 38351] =  30629 -- Displacement <= Scarab of Displacement
consumables[ 38543] =  31437 -- Drake Essence <= Medicinal Drake Essence
consumables[ 38908] =  31676 -- Fel Regeneration Potion
consumables[ 38929] =  31677 -- Fel Mana <= Fel Mana Potion
consumables[ 38954] =  31679 -- Fel Strength Elixir
trinkets   [ 39200] =  25937 -- Heroism <= Terokkar Tablet of Precision
trinkets   [ 39201] =  25936 -- Spell Power <= Terokkar Tablet of Vim
trinkets   [ 39228] =  27770 -- Argussian Compass
trinkets   [ 39439] =  31856 -- Aura of the Crusader <= Darkmoon Card: Crusade
trinkets   [ 39443] =  31857 -- Aura of Wrath <= Darkmoon Card: Wrath
trinkets   [ 39445] =  31858 -- Vengeance <= Darkmoon Card: Vengeance
consumables[ 39625] =  32062 -- Elixir of Major Fortitude
consumables[ 39626] =  32063 -- Earthen Elixir
consumables[ 39627] =  32067 -- Elixir of Draenic Wisdom
consumables[ 39628] =  32068 -- Elixir of Ironskin
trinkets   [ 40396] =  32483 -- Fel Infusion <= The Skull of Gul'dan
trinkets   [ 40402] =  30665 -- Deep Meditation <= Earring of Soulful Meditation
trinkets   [ 40459] =  32485 -- Fire Blood <= Ashtongue Talisman of Valor
trinkets   [ 40464] =  32501 -- Protector's Vigor <= Shadowmoon Insignia
trinkets   [ 40477] =  32505 -- Forceful Strike <= Madness of the Betrayer
trinkets   [ 40480] =  32493 -- Power of the Ashtongue <= Ashtongue Talisman of Shadows
trinkets   [ 40483] =  32488 -- Insight of the Ashtongue <= Ashtongue Talisman of Insight
trinkets   [ 40487] =  32487 -- Deadly Aim <= Ashtongue Talisman of Swiftness
consumables[ 40530] =  32566 -- Picnic <= Picnic Basket
trinkets   [ 40538] =  32534 -- Tenacity <= Brooch of the Immortal King
consumables[ 40548] =  32576 -- Create Charged Crystal Focus <= Depleted Crystal Focus
consumables[ 40567] =  32599 -- Unstable Flask of the Bandit
consumables[ 40568] =  32596 -- Unstable Flask of the Elder
consumables[ 40572] =  32598 -- Unstable Flask of the Beast
consumables[ 40573] =  32600 -- Unstable Flask of the Physician
consumables[ 40575] =  32597 -- Unstable Flask of the Soldier
consumables[ 40576] =  32601 -- Unstable Flask of the Sorcerer
trinkets   [ 40724] =  32654 -- Valor <= Crystalforged Trinket
trinkets   [ 40729] =  32658 -- Heightened Reflexes <= Badge of Tenacity
trinkets   [ 40811] =  32694 -- Netherwing Ally <= Overseer's Badge
trinkets   [ 40815] = { -- Netherwing Ally
     32695, -- Captain's Badge
     32864, -- Commander's Badge
}
consumables[ 41031] =  32722 -- Enriched Terocone Juice
consumables[ 41237] =  32578 -- Charged Crystal Focus
trinkets   [ 41261] =  32770 -- Combat Valor <= Skyguard Silver Cross
trinkets   [ 41263] =  32771 -- Combat Gallantry <= Airman's Ribbon of Gallantry
trinkets   [ 41301] =  32782 -- Time-Lost Figurine
consumables[ 41304] = { -- Blue Brew
     32783, -- Blue Ogre Brew
     32909, -- Blue Ogre Brew Special
}
consumables[ 41306] = { -- Red Brew
     32784, -- Red Ogre Brew
     32910, -- Red Ogre Brew Special
}
consumables[ 41443] =  32839 -- Cauldron of Major Arcane Protection
consumables[ 41494] =  32849 -- Cauldron of Major Fire Protection
consumables[ 41495] =  32850 -- Cauldron of Major Frost Protection
consumables[ 41497] =  32851 -- Cauldron of Major Nature Protection
consumables[ 41498] =  32852 -- Cauldron of Major Shadow Protection
consumables[ 41608] =  32901 -- Relentless Assault of Shattrath <= Shattrath Flask of Relentless Assault
consumables[ 41609] =  32898 -- Fortification of Shattrath <= Shattrath Flask of Fortification
consumables[ 41610] =  32899 -- Mighty Restoration of Shattrath <= Shattrath Flask of Mighty Restoration
consumables[ 41611] =  32900 -- Supreme Power of Shattrath <= Shattrath Flask of Supreme Power
consumables[ 41617] =  32903 -- Restore Mana <= Cenarion Mana Salve
consumables[ 41618] =  32902 -- Restore Mana <= Bottled Nethergon Energy
consumables[ 41619] =  32904 -- Healing Potion <= Cenarion Healing Salve
consumables[ 41620] =  32905 -- Healing Potion <= Bottled Nethergon Vapor
trinkets   [ 42084] =  30627 -- Fury of the Crashing Waves <= Tsunami Talisman
trinkets   [ 42292] = { -- PvP Trinket
     18834, -- Insignia of the Horde
     18845, -- Insignia of the Horde
     18846, -- Insignia of the Horde
     18849, -- Insignia of the Horde
     18850, -- Insignia of the Horde
     18851, -- Insignia of the Horde
     18852, -- Insignia of the Horde
     18853, -- Insignia of the Horde
     18854, -- Insignia of the Alliance
     18856, -- Insignia of the Alliance
     18857, -- Insignia of the Alliance
     18858, -- Insignia of the Alliance
     18859, -- Insignia of the Alliance
     18862, -- Insignia of the Alliance
     18863, -- Insignia of the Alliance
     18864, -- Insignia of the Alliance
     28234, -- Medallion of the Alliance
     28235, -- Medallion of the Alliance
     28236, -- Medallion of the Alliance
     28237, -- Medallion of the Alliance
     28238, -- Medallion of the Alliance
     28239, -- Medallion of the Horde
     28240, -- Medallion of the Horde
     28241, -- Medallion of the Horde
     28242, -- Medallion of the Horde
     28243, -- Medallion of the Horde
     29592, -- Insignia of the Horde
     29593, -- Insignia of the Alliance
     30343, -- Medallion of the Horde
     30344, -- Medallion of the Horde
     30345, -- Medallion of the Horde
     30346, -- Medallion of the Horde
     30348, -- Medallion of the Alliance
     30349, -- Medallion of the Alliance
     30350, -- Medallion of the Alliance
     30351, -- Medallion of the Alliance
     37864, -- Medallion of the Alliance
     37865, -- Medallion of the Horde
     38588, -- Medallion of the Horde
     38589, -- Medallion of the Alliance
     40476, -- Insignia of the Alliance
     40477, -- Insignia of the Horde
     40483, -- Insignia of the Scourge
     42122, -- Medallion of the Horde
     42123, -- Medallion of the Alliance
     42124, -- Medallion of the Alliance
     42126, -- Medallion of the Horde
     44097, -- Inherited Insignia of the Horde
     44098, -- Inherited Insignia of the Alliance
     46081, -- Titan-Forged Rune of Audacity
     46082, -- Titan-Forged Rune of Determination
     46083, -- Titan-Forged Rune of Accuracy
     46084, -- Titan-Forged Rune of Cruelty
     46085, -- Titan-Forged Rune of Alacrity
     51377, -- Medallion of the Alliance
     51378, -- Medallion of the Horde
     60794, -- Vicious Gladiator's Medallion of Cruelty
     60799, -- Vicious Gladiator's Medallion of Meditation
     60800, -- Vicious Gladiator's Medallion of Tenacity
     60801, -- Vicious Gladiator's Medallion of Cruelty
     60806, -- Vicious Gladiator's Medallion of Meditation
     60807, -- Vicious Gladiator's Medallion of Tenacity
     64789, -- Bloodthirsty Gladiator's Medallion of Cruelty
     64790, -- Bloodthirsty Gladiator's Medallion of Cruelty
     64791, -- Bloodthirsty Gladiator's Medallion of Meditation
     64792, -- Bloodthirsty Gladiator's Medallion of Meditation
     64793, -- Bloodthirsty Gladiator's Medallion of Tenacity
     64794, -- Bloodthirsty Gladiator's Medallion of Tenacity
     69861, -- Medallion of the Alliance
     69862, -- Medallion of the Horde
     70390, -- Ruthless Gladiator's Medallion of Cruelty
     70391, -- Ruthless Gladiator's Medallion of Meditation
     70392, -- Ruthless Gladiator's Medallion of Tenacity
     70393, -- Ruthless Gladiator's Medallion of Cruelty
     70394, -- Ruthless Gladiator's Medallion of Meditation
     70395, -- Ruthless Gladiator's Medallion of Tenacity
     70602, -- Vicious Gladiator's Medallion of Cruelty
     70603, -- Vicious Gladiator's Medallion of Cruelty
     70604, -- Vicious Gladiator's Medallion of Meditation
     70605, -- Vicious Gladiator's Medallion of Meditation
     70606, -- Vicious Gladiator's Medallion of Tenacity
     70607, -- Vicious Gladiator's Medallion of Tenacity
     72410, -- Ruthless Gladiator's Medallion of Cruelty
     72411, -- Ruthless Gladiator's Medallion of Cruelty
     72412, -- Ruthless Gladiator's Medallion of Tenacity
     72413, -- Ruthless Gladiator's Medallion of Tenacity
     72414, -- Ruthless Gladiator's Medallion of Meditation
     72415, -- Ruthless Gladiator's Medallion of Meditation
     73534, -- Cataclysmic Gladiator's Medallion of Meditation
     73535, -- Cataclysmic Gladiator's Medallion of Meditation
     73536, -- Cataclysmic Gladiator's Medallion of Tenacity
     73537, -- Cataclysmic Gladiator's Medallion of Tenacity
     73538, -- Cataclysmic Gladiator's Medallion of Cruelty
     73539, -- Cataclysmic Gladiator's Medallion of Cruelty
     84450, -- Dreadful Gladiator's Medallion of Cruelty
     84451, -- Dreadful Gladiator's Medallion of Cruelty
     84452, -- Dreadful Gladiator's Medallion of Tenacity
     84453, -- Dreadful Gladiator's Medallion of Tenacity
     84454, -- Dreadful Gladiator's Medallion of Meditation
     84455, -- Dreadful Gladiator's Medallion of Meditation
     84931, -- Malevolent Gladiator's Medallion of Tenacity
     84932, -- Malevolent Gladiator's Medallion of Meditation
     84933, -- Malevolent Gladiator's Medallion of Meditation
     84943, -- Malevolent Gladiator's Medallion of Cruelty
     84944, -- Malevolent Gladiator's Medallion of Cruelty
     84945, -- Malevolent Gladiator's Medallion of Tenacity
     91329, -- Tyrannical Gladiator's Medallion of Cruelty
     91330, -- Tyrannical Gladiator's Medallion of Cruelty
     91331, -- Tyrannical Gladiator's Medallion of Tenacity
     91332, -- Tyrannical Gladiator's Medallion of Tenacity
     91333, -- Tyrannical Gladiator's Medallion of Meditation
     91334, -- Tyrannical Gladiator's Medallion of Meditation
     91682, -- Malevolent Gladiator's Medallion of Cruelty
     91683, -- Malevolent Gladiator's Medallion of Cruelty
     91684, -- Malevolent Gladiator's Medallion of Tenacity
     91685, -- Malevolent Gladiator's Medallion of Tenacity
     91686, -- Malevolent Gladiator's Medallion of Meditation
     91687, -- Malevolent Gladiator's Medallion of Meditation
     93898, -- Bequeathed Insignia of the Horde
     93899, -- Bequeathed Insignia of the Alliance
     94338, -- Tyrannical Gladiator's Medallion of Meditation
     94361, -- Tyrannical Gladiator's Medallion of Tenacity
     94386, -- Tyrannical Gladiator's Medallion of Cruelty
     94387, -- Tyrannical Gladiator's Medallion of Tenacity
     94388, -- Tyrannical Gladiator's Medallion of Meditation
     94454, -- Tyrannical Gladiator's Medallion of Cruelty
    100006, -- Tyrannical Gladiator's Medallion of Meditation
    100031, -- Tyrannical Gladiator's Medallion of Tenacity
    100056, -- Tyrannical Gladiator's Medallion of Cruelty
    100057, -- Tyrannical Gladiator's Medallion of Tenacity
    100058, -- Tyrannical Gladiator's Medallion of Meditation
    100124, -- Tyrannical Gladiator's Medallion of Cruelty
    100568, -- Grievous Gladiator's Medallion of Meditation
    100591, -- Grievous Gladiator's Medallion of Tenacity
    100616, -- Grievous Gladiator's Medallion of Cruelty
    100617, -- Grievous Gladiator's Medallion of Tenacity
    100618, -- Grievous Gladiator's Medallion of Meditation
    100684, -- Grievous Gladiator's Medallion of Cruelty
    102483, -- Crafted Malevolent Gladiator's Medallion of Tenacity
    102625, -- Prideful Gladiator's Medallion of Meditation
    102672, -- Prideful Gladiator's Medallion of Tenacity
    102738, -- Prideful Gladiator's Medallion of Cruelty
    102822, -- Grievous Gladiator's Medallion of Meditation
    102869, -- Grievous Gladiator's Medallion of Tenacity
    102935, -- Grievous Gladiator's Medallion of Cruelty
    103333, -- Grievous Gladiator's Medallion of Tenacity
    103334, -- Grievous Gladiator's Medallion of Cruelty
    103335, -- Grievous Gladiator's Medallion of Meditation
    103530, -- Prideful Gladiator's Medallion of Tenacity
    103531, -- Prideful Gladiator's Medallion of Cruelty
    103532, -- Prideful Gladiator's Medallion of Meditation
    111229, -- Primal Gladiator's Medallion of Cruelty
    111230, -- Primal Gladiator's Medallion of Tenacity
    111231, -- Primal Gladiator's Medallion of Meditation
    111305, -- Gladiator's Emblem
    111306, -- Gladiator's Medallion
    115156, -- Primal Combatant's Medallion of Cruelty
    115157, -- Primal Combatant's Medallion of Tenacity
    115158, -- Primal Combatant's Medallion of Meditation
    115756, -- Primal Gladiator's Medallion of Cruelty
    115757, -- Primal Gladiator's Medallion of Tenacity
    115758, -- Primal Gladiator's Medallion of Meditation
    117736, -- Tournament Gladiator's Medallion of Cruelty
    117737, -- Tournament Gladiator's Medallion of Tenacity
    117738, -- Tournament Gladiator's Medallion of Meditation
    117937, -- Tournament Gladiator's Medallion of Cruelty
    117938, -- Tournament Gladiator's Medallion of Tenacity
    117939, -- Tournament Gladiator's Medallion of Meditation
}
consumables[ 42309] =  33053 -- Brain Food <= Hot Buttered Trout
consumables[ 42383] =  33081 -- Voodoo Skull
consumables[ 42391] =  33083 -- Throw Booze <= Orcish Grog
consumables[ 42667] =  33176 -- Flying Broom
consumables[ 42735] =  33208 -- Chromatic Wonder <= Flask of Chromatic Wonder
consumables[ 42766] = { -- Fishing Chair
     33223, -- Fishing Chair
     86596, -- Nat's Fishing Chair
}
consumables[ 43185] =  33447 -- Healing Potion <= Runic Healing Potion
consumables[ 43186] =  33448 -- Restore Mana <= Runic Mana Potion
consumables[ 43194] =  33457 -- Agility <= Scroll of Agility VI
consumables[ 43195] =  33458 -- Intellect <= Scroll of Intellect VI
consumables[ 43196] =  33459 -- Armor <= Scroll of Protection VI
consumables[ 43197] =  33460 -- Spirit <= Scroll of Spirit VI
consumables[ 43198] =  33461 -- Stamina <= Scroll of Stamina VI
consumables[ 43199] =  33462 -- Strength <= Scroll of Strength VI
trinkets   [ 43710] =  33828 -- Diabolic Remedy <= Tome of Diabolic Remedy
trinkets   [ 43712] =  33829 -- Mojo Madness <= Hex Shrunken Head
trinkets   [ 43713] =  33830 -- Hardened Skin <= Ancient Aqir Artifact
trinkets   [ 43716] =  33831 -- Call of the Berserker <= Berserker's Call
consumables[ 43730] =  33866 -- Electrified <= Stormchops
consumables[ 43771] =  43005 -- Pet Treat <= Spiced Mammoth Treats
consumables[ 43816] =  33930 -- Charm of the Bloodletter <= Amani Charm of the Bloodletter
consumables[ 43818] =  33931 -- Charm of Mighty Mojo <= Amani Charm of Mighty Mojo
consumables[ 43820] =  33932 -- Charm of the Witch Doctor <= Amani Charm of the Witch Doctor
consumables[ 43822] =  33933 -- Charm of the Raging Defender <= Amani Charm of the Raging Defender
trinkets   [ 43995] =  34029 -- Death by Voodoo Gnome <= Tiny Voodoo Mask
trinkets   [ 44055] = { -- Tremendous Fortitude
     33832, -- Battlemaster's Determination
     34049, -- Battlemaster's Audacity
     34050, -- Battlemaster's Perseverance
     34162, -- Battlemaster's Depravity
     34163, -- Battlemaster's Cruelty
     34576, -- Battlemaster's Cruelty
     34577, -- Battlemaster's Depravity
     34578, -- Battlemaster's Determination
     34579, -- Battlemaster's Audacity
     34580, -- Battlemaster's Perseverance
     35326, -- Battlemaster's Alacrity
     35327, -- Battlemaster's Alacrity
}
consumables[ 44467] =  34130 -- Recovery Diver's Potion
consumables[ 44755] =  34191 -- Snowflakes <= Handful of Snowflakes
trinkets   [ 45040] =  34427 -- Battle Trance <= Blackened Naaru Sliver
trinkets   [ 45042] =  34429 -- Power Circle <= Shifting Naaru Sliver
trinkets   [ 45049] =  34428 -- Tenacity <= Steely Naaru Sliver
consumables[ 45051] =  34440 -- Mad Alchemist's Potion
trinkets   [ 45052] =  34430 -- Evocation <= Glimmering Naaru Sliver
trinkets   [ 45053] =  34472 -- Disdain <= Shard of Contempt
trinkets   [ 45055] =  34470 -- Shadow Bolt <= Timbal's Focusing Crystal
trinkets   [ 45062] =  34471 -- Holy Energy <= Vial of the Sunwell
trinkets   [ 45064] =  34471 -- Vessel of the Naaru <= Vial of the Sunwell
consumables[ 45094] =  34480 -- Romantic Picnic <= Romantic Picnic Basket
consumables[ 45131] =  34498 -- Create Paper Airplane, Zeppelin <= Paper Zeppelin Kit
consumables[ 45135] =  34499 -- Create Paper Airplane, Flying Machine <= Paper Flying Machine Kit
consumables[ 45153] =  34258 -- Throw Love Rocket <= Love Rocket
consumables[ 45373] =  34537 -- Bloodberry <= Bloodberry Elixir
consumables[ 45417] =  34684 -- Summer Flower Shower <= Handful of Summer Petals
consumables[ 45543] =  34721 -- First Aid <= Frostweave Bandage
consumables[ 45544] =  34722 -- First Aid <= Heavy Frostweave Bandage
consumables[ 45694] =  34832 -- Captain Rumsey's Lager
consumables[ 46203] =  35227 -- Goblin Weather Machine <= Goblin Weather Machine - Prototype 01-B
trinkets   [ 46567] =  23836 -- Rocket Launch <= Goblin Rocket Launcher
trinkets   [ 46780] =  35693 -- Empyrean Tortoise <= Figurine - Empyrean Tortoise
trinkets   [ 46782] =  35694 -- Khorium Boar <= Figurine - Khorium Boar
trinkets   [ 46783] =  35700 -- Crimson Serpent <= Figurine - Crimson Serpent
trinkets   [ 46784] =  35702 -- Shadowsong Panther <= Figurine - Shadowsong Panther
trinkets   [ 46785] =  35703 -- Seaspray Albatross <= Figurine - Seaspray Albatross
consumables[ 46837] =  35716 -- Pure Death of Shattrath <= Shattrath Flask of Pure Death
consumables[ 46839] =  35717 -- Blinding Light of Shattrath <= Shattrath Flask of Blinding Light
consumables[ 46927] =  35720 -- Strong Alcohol <= Lord of Frost's Private Label
consumables[ 47004] = { -- Red Firework Rocket
      5740, -- Red Fireworks Rocket
    104155, -- Red Fireworks Rocket
}
trinkets   [ 47215] =  35935 -- Runic Infusion <= Infused Coldstone Rune
trinkets   [ 47217] =  35937 -- Foaming Rage <= Braxley's Backyard Moonshine
consumables[ 47430] =  36770 -- Undigestible <= Zort's Protective Elixir
consumables[ 47431] =  36771 -- Capture Jormungar Spawn <= Sturdy Crates
trinkets   [ 47806] =  36871 -- Towering Rage <= Fury of the Encroaching Storm
trinkets   [ 47807] =  36872 -- Healing Focus <= Mender of the Oncoming Dawn
trinkets   [ 47816] = { -- Spell Power
     36874, -- Horn of the Herald
     38257, -- Strike of the Seas
}
consumables[ 47977] =  37011 -- Magic Broom
trinkets   [ 48041] =  37127 -- Summon the Brewmaiden <= Brightbrew Charm
trinkets   [ 48042] =  37128 -- Summon the Black Brewmaiden <= Balebrew Charm
consumables[ 48099] =  37091 -- Intellect <= Scroll of Intellect VII
consumables[ 48100] =  37092 -- Intellect <= Scroll of Intellect VIII
consumables[ 48101] =  37093 -- Stamina <= Scroll of Stamina VII
consumables[ 48102] =  37094 -- Stamina <= Scroll of Stamina VIII
consumables[ 48103] =  37097 -- Spirit <= Scroll of Spirit VII
consumables[ 48104] =  37098 -- Spirit <= Scroll of Spirit VIII
consumables[ 48129] =  37118 -- Scroll of Recall
trinkets   [ 48332] =  37254 -- Going Ape! <= Super Simian Sphere
consumables[ 48719] =  37449 -- Water Breathing <= Breath of Murloc
consumables[ 48739] =  37464 -- Winterfin First Responder <= Winterfin Horn of Distress
trinkets   [ 48846] = { -- Runic Infusion
     37555, -- Warsong's Wrath
     38213, -- Harbinger's Wrath
}
trinkets   [ 48847] =  37556 -- Precise Strikes <= Talisman of the Tundra
trinkets   [ 48848] =  37557 -- Feral Fury <= Warsong's Fervor
trinkets   [ 48855] =  37558 -- Healing Purity <= Tidal Boon
trinkets   [ 48865] =  37560 -- Perfumed Grace <= Vial of Renewal
trinkets   [ 48868] =  37562 -- Skycaller's Swiftness <= Fury of the Crimson Drake
trinkets   [ 48875] = { -- Spell Power
     38760, -- Mendicant's Charm
     38762, -- Insignia of Bloody Fire
}
consumables[ 49512] =   1399 -- Fireball <= Magic Candle
consumables[ 49590] =  37888 -- Arcane Disruption <= Arcane Disruptor
trinkets   [ 49623] =  37835 -- Effervescence <= Je'Tze's Bell
consumables[ 49761] =  42986 -- Rocket-Propelled Goblin Grenade <= The RP-GG
trinkets   [ 50261] =  38258 -- Nimble Fingers <= Sailor's Knotted Charm
trinkets   [ 50263] =  38259 -- Quickness of the Sailor <= First Mate's Pocketwatch
consumables[ 50282] =  38266 -- Throw Relic <= Rotund Relic
consumables[ 50317] =  38301 -- Summon Disco Ball <= D.I.S.C.O.
consumables[ 50477] =  38308 -- Ethereal Essence Sphere
trinkets   [ 50708] =  19992 -- Primal Instinct <= Devilsaur Tooth
consumables[ 50809] =  38351 -- Murliver Oil
consumables[ 50986] =  38466 -- Sulfuron Slammer
trinkets   [ 51348] =  38359 -- Venture Company Beatdown! <= Goblin Repetition Reducer
trinkets   [ 51353] =  38358 -- Venture Company Beatdown! <= Arcane Revitalizer
consumables[ 51640] =  38578 -- Taunt Flag Targeting <= The Flag of Ownership
trinkets   [ 51952] =  38289 -- Dark Iron Luck <= Coren's Lucky Coin
trinkets   [ 51953] =  38290 -- Dark Iron Pipeweed <= Dark Iron Smoking Pipe
trinkets   [ 51954] =  38288 -- Hopped Up <= Direbrew Hops
trinkets   [ 51955] =  38287 -- Dire Drunkard <= Empty Mug of Direbrew
trinkets   [ 51978] =  38080 -- Jormungar Slime <= Automated Weapon Coater
trinkets   [ 51985] =  38070 -- Far-Seeing Eyes <= Foresight's Anticipation
trinkets   [ 51987] =  38081 -- Arcane Infusion <= Scarab of Isanoth
consumables[ 52410] =  39213 -- Place Seaforium Charge <= Massive Seaforium Charge
trinkets   [ 52419] =  38674 -- Deflection <= Soul Harvester's Charm
trinkets   [ 52424] =  38675 -- Retaliation <= Signet of the Dark Brotherhood
consumables[ 52697] =  39327 -- Noth's Special Brew
consumables[ 53746] =  40068 -- Wrath Elixir
consumables[ 53747] =  40072 -- Elixir of Spirit
consumables[ 53748] =  40073 -- Mighty Strength <= Elixir of Mighty Strength
consumables[ 53749] =  40076 -- Guru's Elixir
consumables[ 53750] =  40077 -- Crazy Alchemist's Potion
consumables[ 53751] =  40078 -- Elixir of Mighty Fortitude
consumables[ 53752] =  40079 -- Lesser Flask of Toughness
consumables[ 53753] =  40081 -- Nightmare Slumber <= Potion of Nightmares
consumables[ 53755] =  46376 -- Flask of the Frost Wyrm
consumables[ 53758] =  46379 -- Flask of Stoneblood
consumables[ 53760] =  46377 -- Flask of Endless Rage
consumables[ 53761] =  40087 -- Rejuvenation Potion <= Powerful Rejuvenation Potion
consumables[ 53762] =  40093 -- Indestructible <= Indestructible Potion
consumables[ 53763] =  40097 -- Protection <= Elixir of Protection
consumables[ 53764] =  40109 -- Mighty Mana Regeneration <= Elixir of Mighty Mageblood
consumables[ 53908] =  40211 -- Speed <= Potion of Speed
consumables[ 53909] =  40212 -- Wild Magic <= Potion of Wild Magic
consumables[ 53910] =  40213 -- Arcane Protection <= Mighty Arcane Protection Potion
consumables[ 53911] =  40214 -- Fire Protection <= Mighty Fire Protection Potion
consumables[ 53913] =  40215 -- Frost Protection <= Mighty Frost Protection Potion
consumables[ 53914] =  40216 -- Nature Protection <= Mighty Nature Protection Potion
consumables[ 53915] =  40217 -- Shadow Protection <= Mighty Shadow Protection Potion
trinkets   [ 54092] =  40354 -- Monster Slayer's Kit
consumables[ 54212] =  46378 -- Flask of Pure Mojo
trinkets   [ 54308] =  40492 -- Summon Argent Knight <= Argent War Horn
trinkets   [ 54329] =  40601 -- Argent Dawn Banner
trinkets   [ 54418] =  40593 -- Argent Tome Bunny Spawn <= Argent Tome
consumables[ 54494] =  22831 -- Major Agility <= Elixir of Major Agility
consumables[ 54497] =   1177 -- Lesser Armor <= Oil of Olaf
trinkets   [ 54696] =  38212 -- Wracking Pains <= Death Knight's Anguish
trinkets   [ 54739] =  37559 -- Star of Light <= Serrah's Star
trinkets   [ 54839] =  38071 -- Purified Spirit <= Valonforth's Remembrance
consumables[ 55001] = 107640 -- Parachute <= Potion of Slow Fall
trinkets   [ 55018] =  40767 -- Sonic Awareness <= Sonic Booster
trinkets   [ 55019] =  40865 -- Sonic Shield <= Noise Machine
trinkets   [ 55039] =  41121 -- Gnomish Lightning Generator
consumables[ 55346] =  41367 -- Dark Jade Beam <= Dark Jade Focusing Lens
consumables[ 55420] =  41427 -- Dalaran Firework
consumables[ 55536] =  41509 -- Frostweave Net
trinkets   [ 55748] =  39889 -- Argent Fury <= Horn of Argent Fury
trinkets   [ 55915] = { -- Tremendous Fortitude
     42128, -- Battlemaster's Hostility
     42129, -- Battlemaster's Accuracy
     42130, -- Battlemaster's Avidity
     42131, -- Battlemaster's Conviction
     42132, -- Battlemaster's Bravery
}
trinkets   [ 56121] =  42341 -- Ruby Hare <= Figurine - Ruby Hare
trinkets   [ 56184] =  42395 -- Twilight Serpent <= Figurine - Twilight Serpent
trinkets   [ 56186] =  42413 -- Sapphire Owl <= Figurine - Sapphire Owl
trinkets   [ 56188] =  42418 -- Emerald Boar <= Figurine - Emerald Boar
consumables[ 56190] =  42420 -- Shadow Crystal Focusing Lens
consumables[ 56191] =  42421 -- Shadow Jade Focusing Lens
consumables[ 57301] =  34753 -- Great Feast
trinkets   [ 57350] =  42988 -- Illusionary Barrier <= Darkmoon Card: Illusion
consumables[ 57375] =  43002 -- Land Mines <= Inflatable Land Mines
consumables[ 57388] =  43004 -- Critter Bite <= Critter Bites
consumables[ 57426] =  43015 -- Fish Feast
trinkets   [ 58157] =  30446 -- Solarian's Grace <= Solarian's Sapphire
consumables[ 58448] =  43465 -- Strength <= Scroll of Strength VII
consumables[ 58449] =  43466 -- Strength <= Scroll of Strength VIII
consumables[ 58450] =  43463 -- Agility <= Scroll of Agility VII
consumables[ 58451] =  43464 -- Agility <= Scroll of Agility VIII
consumables[ 58452] =  43467 -- Armor <= Scroll of Protection VII
consumables[ 58465] =  43478 -- Gigantic Feast
consumables[ 58474] =  43480 -- Small Feast
consumables[ 58496] =  43488 -- Sad <= Last Week's Mammoth
consumables[ 58499] =  43490 -- Happy <= Tasty Cupcake
consumables[ 58500] =  43491 -- Angry <= Bad Clams
consumables[ 58502] =  43492 -- Scared <= Haunted Herring
trinkets   [ 58904] =  43573 -- Tears of Anguish <= Tears of Bitter Anguish
consumables[ 59385] =  43850 -- Certificate of Ownership
consumables[ 59640] =  44012 -- Underbelly Elixir
trinkets   [ 59657] = { -- Argent Valor
     44013, -- Cannoneer's Fuselighter
     44015, -- Cannoneer's Morale
}
trinkets   [ 59658] =  44014 -- Argent Heroism <= Fezzik's Pocketwatch
trinkets   [ 59757] =  44063 -- Figurine - Monarch Crab
trinkets   [ 59789] =  44074 -- Oracle Ablutions <= Oracle Talisman of Ablution
trinkets   [ 59821] =  44073 -- Frenzyheart Fury <= Frenzyheart Insignia of Fury
trinkets   [ 59914] = { -- Discerning Eye of the Beast
     42992, -- Discerning Eye of the Beast
     93897, -- Piercing Eye of the Beast
}
trinkets   [ 60054] =  40683 -- Valor Medal of the First War
trinkets   [ 60062] = { -- Essence of Life
     40685, -- The Egg of Mortal Essence
     49078, -- Ancient Pickled Egg
}
trinkets   [ 60064] = { -- Now is the time!
     40682, -- Sundial of the Exiled
     44912, -- Flow of Knowledge
     49076, -- Mithril Pocketwatch
}
trinkets   [ 60065] = { -- Reflection of Torment
     40684, -- Mirror of Truth
     44914, -- Anvil of Titans
     49074, -- Coren's Chromium Coaster
}
consumables[ 60106] =  44114 -- Old Spices
consumables[ 60122] =  44228 -- Baby Spice
trinkets   [ 60180] = { -- Resolute
     37638, -- Offering of Sacrifice
     39292, -- Repelling Charge
}
trinkets   [ 60196] =  42989 -- Berserker! <= Darkmoon Card: Berserker!
trinkets   [ 60203] =  42990 -- Darkmoon Card: Death
trinkets   [ 60214] =  36993 -- Seal of the Pantheon
trinkets   [ 60215] =  37872 -- Lavanthor's Talisman
trinkets   [ 60218] =  37220 -- Essence of Gossamer
trinkets   [ 60258] =  40372 -- Rune of Repulsion
trinkets   [ 60286] =  40257 -- Defender's Code
trinkets   [ 60299] =  37723 -- Incisor Fragment
trinkets   [ 60302] =  37390 -- Meteorite Whetstone
trinkets   [ 60305] =  37166 -- Heart of a Dragon <= Sphere of Red Dragon's Blood
trinkets   [ 60307] =  37064 -- Vestige of Haldor
trinkets   [ 60314] =  40431 -- Fury of the Five Flights
trinkets   [ 60319] =  40531 -- Mark of Norgannon
consumables[ 60320] =  44314 -- Scroll of Recall <= Scroll of Recall II
consumables[ 60321] =  44315 -- Scroll of Recall <= Scroll of Recall III
consumables[ 60340] =  44325 -- Accuracy <= Elixir of Accuracy
consumables[ 60341] =  44327 -- Deadly Strikes <= Elixir of Deadly Strikes
consumables[ 60343] =  44328 -- Mighty Defense <= Elixir of Mighty Defense
consumables[ 60344] =  44329 -- Expertise <= Elixir of Expertise
consumables[ 60346] =  44331 -- Lightning Speed <= Elixir of Lightning Speed
consumables[ 60347] =  44332 -- Mighty Thoughts <= Elixir of Mighty Thoughts
trinkets   [ 60437] =  40256 -- Grim Toll
trinkets   [ 60439] =  39257 -- Loatheb's Shadow
trinkets   [ 60443] =  40371 -- Bandit's Insignia
consumables[ 60458] =  44430 -- Toss Your Luck! <= Titanium Seal of Dalaran
trinkets   [ 60471] =  36972 -- Tome of Arcane Phenomena
trinkets   [ 60479] =  37660 -- Forge Ember
trinkets   [ 60480] =  37873 -- Mark of the War Prisoner
trinkets   [ 60483] =  37264 -- Pendulum of Telluric Currents
trinkets   [ 60486] =  40432 -- Illustration of the Dragon Soul
trinkets   [ 60488] =  40373 -- Extract of Necromatic Power <= Extract of Necromantic Power
trinkets   [ 60492] =  39229 -- Embrace of the Spider
trinkets   [ 60494] =  40255 -- Dying Curse
trinkets   [ 60517] =  37734 -- Talisman of Troll Divinity
trinkets   [ 60520] =  37657 -- Spark of Life
trinkets   [ 60521] =  37844 -- Winged Talisman
trinkets   [ 60525] =  40430 -- Majestic Dragon Figurine
trinkets   [ 60526] =  40532 -- Living Ice Crystals
trinkets   [ 60527] =  39388 -- Essence Flow <= Spirit-World Glass
trinkets   [ 60530] =  40258 -- Forethought Talisman
trinkets   [ 60538] =  40382 -- Soul of the Dead
trinkets   [ 60986] = { -- Medallion of Heroism
     44579, -- Medallion of Heroism
     44597, -- Medallion of Heroism
}
trinkets   [ 61426] =  38763 -- Infinite Spirit <= Futuresight Rune
trinkets   [ 61427] =  38764 -- Infinite Speed <= Rune of Finite Variation
trinkets   [ 61428] =  38765 -- Infinite Power <= Rune of Infinite Power
trinkets   [ 61617] =  43837 -- Warm Glow <= Softly Glowing Orb
trinkets   [ 61619] =  43838 -- Tentacles <= Chuchu's Tiny Box of Horrors
trinkets   [ 61620] =  43836 -- Bleeding Heart <= Thorny Rose Brooch
trinkets   [ 61671] =  43829 -- Crusader's Glory <= Crusader's Locket
trinkets   [ 61778] =  38761 -- Scything Talons <= Talon of Hatred
consumables[ 61781] = 116400 -- Turkey Feathers <= Silver-Plated Turkey Shooter
consumables[ 62061] =  21213 -- Festive Holiday Mount <= Preserved Holly
consumables[ 62062] =  37816 -- Brewfestive Holiday Mount <= Preserved Brewfest Hops
trinkets   [ 62088] =  39811 -- Infiltrator's Guile <= Badge of the Infiltrator
consumables[ 62380] =  44939 -- Lesser Flask of Resistance
consumables[ 62949] =  45057 -- Wind-Up Train Wrecker
trinkets   [ 63250] = { -- Jouster's Fury
     45131, -- Jouster's Fury
     45219, -- Jouster's Fury
}
consumables[ 63729] =  45621 -- Minor Accuracy <= Elixir of Minor Accuracy
consumables[ 64385] =  45984 -- Spinning <= Unusual Compass
trinkets   [ 64524] =  46086 -- Platinum Disks of Battle
trinkets   [ 64525] =  46087 -- Platinum Disks of Sorcery
trinkets   [ 64527] =  46088 -- Platinum Disks of Swiftness
trinkets   [ 64707] =  45466 -- Scale of Fates
trinkets   [ 64712] =  45148 -- Living Flame
trinkets   [ 64713] =  45518 -- Flame of the Heavens <= Flare of the Heavens
trinkets   [ 64739] =  45535 -- Show of Faith
trinkets   [ 64741] =  45490 -- Pandora's Plea
consumables[ 64749] =  44221 -- Loaned Gryphon <= Loaned Gryphon Reins
consumables[ 64762] =  44229 -- Loaned Wind Rider <= Loaned Wind Rider Reins
trinkets   [ 64763] =  45158 -- Heart of Iron
trinkets   [ 64765] =  45507 -- The General's Heart
trinkets   [ 64772] =  45609 -- Comet's Trail
trinkets   [ 64790] =  45522 -- Blood of the Old God
trinkets   [ 64800] =  45263 -- Wrathstone
trinkets   [ 64981] =  46312 -- Summon Random Vanquished Tentacle <= Vanquished Clutches of Yogg-Saron
trinkets   [ 64999] =  46051 -- Meteoric Inspiration <= Meteorite Crystal
trinkets   [ 65003] =  45929 -- Memories of Love <= Sif's Remembrance
trinkets   [ 65004] =  45866 -- Alacrity of the Elements <= Elemental Focus Stone
trinkets   [ 65006] =  45308 -- Eye of the Broodmother
trinkets   [ 65008] =  45292 -- Energy Siphon
trinkets   [ 65011] =  45313 -- Furnace Stone
trinkets   [ 65012] =  46021 -- Royal Seal of King Llane
trinkets   [ 65014] =  45286 -- Pyrite Infusion <= Pyrite Infuser
trinkets   [ 65019] =  45931 -- Mjolnir Runestone
trinkets   [ 65024] =  46038 -- Implosion <= Dark Matter
consumables[ 65247] =  33874 -- Really Well Fed <= Kibler's Bits
consumables[ 65252] =  40084 -- Mixture of Endless Rage
consumables[ 65253] =  40082 -- Mixture of the Frost Wyrm
consumables[ 65254] =  40404 -- Mixture of Pure Mojo
consumables[ 65255] =  40083 -- Mixture of Stoneblood
consumables[ 65451] =  46709 -- Using MiniZep Controller <= MiniZep Controller
consumables[ 66476] =  46887 -- Bountiful Feast
consumables[ 67019] =  47499 -- Flask of the North
consumables[ 67486] = { -- Healing Potion Injector
     23822, -- Healing Potion Injector
     33092, -- Healing Potion Injector
}
consumables[ 67487] = { -- Mana Potion Injector
     23823, -- Mana Potion Injector
     33093, -- Mana Potion Injector
}
consumables[ 67489] =  41166 -- Runic Healing Injector
consumables[ 67490] =  42545 -- Runic Mana Injector
trinkets   [ 67596] = { -- Tremendous Fortitude
     42133, -- Battlemaster's Fury
     42134, -- Battlemaster's Precision
     42135, -- Battlemaster's Vivacity
     42136, -- Battlemaster's Rage
     42137, -- Battlemaster's Ruination
}
trinkets   [ 67631] =  47216 -- Aegis <= The Black Heart
trinkets   [ 67666] =  47215 -- Mana Mana <= Tears of the Vanquished
trinkets   [ 67669] =  47213 -- Elusive Power <= Abyssal Rune
trinkets   [ 67671] =  47214 -- Fury <= Banner of Victory
trinkets   [ 67683] =  48722 -- Celerity <= Shard of the Crystal Heart
trinkets   [ 67684] =  48724 -- Hospitality <= Talisman of Resurgence
trinkets   [ 67694] =  47735 -- Defensive Tactics <= Glyph of Indomitability
trinkets   [ 67695] =  47734 -- Rage <= Mark of Supremacy
trinkets   [ 67696] = { -- Energized
     47041, -- Solace of the Defeated
     47271, -- Solace of the Fallen
}
trinkets   [ 67699] = { -- Fortitude
     47080, -- Satrina's Impeding Scarab
     47290, -- Juggernaut's Vitality
}
trinkets   [ 67726] = { -- Escalating Power
     47728, -- Binding Light
     47880, -- Binding Stone
}
trinkets   [ 67728] = { -- Hardening Armor
     47727, -- Fervor of the Frostborn
     47882, -- Eitrigg's Oath
}
trinkets   [ 67736] = { -- Volatile Power
     47726, -- Talisman of Volatile Power
     47879, -- Fetish of Volatile Power
}
trinkets   [ 67738] = { -- Rising Fury
     47725, -- Victor's Call
     47881, -- Vengeance of the Forsaken
}
trinkets   [ 67740] = { -- Escalating Power
     47947, -- Binding Light
     48019, -- Binding Stone
}
trinkets   [ 67742] = { -- Hardening Armor
     47949, -- Fervor of the Frostborn
     48021, -- Eitrigg's Oath
}
trinkets   [ 67744] = { -- Volatile Power
     47946, -- Talisman of Volatile Power
     48018, -- Fetish of Volatile Power
}
trinkets   [ 67747] = { -- Rising Fury
     47948, -- Victor's Call
     48020, -- Vengeance of the Forsaken
}
trinkets   [ 67750] = { -- Energized
     47059, -- Solace of the Defeated
     47432, -- Solace of the Fallen
}
trinkets   [ 67753] = { -- Fortitude
     47088, -- Satrina's Impeding Scarab
     47451, -- Juggernaut's Vitality
}
trinkets   [ 68270] =  49118 -- Summon the Brewmaiden <= Bubbling Brightbrew Charm
trinkets   [ 68271] =  49116 -- Summon the Black Brewmaiden <= Bitter Balebrew Charm
consumables[ 68417] = { -- Wrapping Paper - Dummy Spell
      5042, -- Red Ribboned Wrapping Paper
      5048, -- Blue Ribboned Wrapping Paper
     17303, -- Blue Ribboned Wrapping Paper
     17304, -- Green Ribboned Wrapping Paper
     17307, -- Purple Ribboned Wrapping Paper
}
trinkets   [ 68443] =  49080 -- Drunken Evasiveness <= Brawler's Souvenir
consumables[ 69377] =  49632 -- Fortitude <= Runescroll of Fortitude
consumables[ 69378] =  49633 -- Blessing of Forgotten Kings <= Drums of Forgotten Kings
trinkets   [ 71396] =  50355 -- Rage of the Fallen <= Herkuml War Token
trinkets   [ 71401] =  50342 -- Icy Rage <= Whispering Fanged Skull
trinkets   [ 71403] =  50198 -- Fatal Flaws <= Needle-Encrusted Scorpion
trinkets   [ 71541] =  50343 -- Icy Rage <= Whispering Fanged Skull
trinkets   [ 71563] =  50259 -- Deadly Precision <= Nevermelting Ice Crystal
trinkets   [ 71565] =  50339 -- Replenish Mana <= Sliver of Pure Ice
trinkets   [ 71566] =  50260 -- Replenished <= Ephemeral Snowflake
trinkets   [ 71568] =  50260 -- Urgency <= Ephemeral Snowflake
trinkets   [ 71569] =  50235 -- Increased Fortitude <= Ick's Rotting Thumb
trinkets   [ 71570] =  50340 -- Cultivated Power <= Muradin's Spyglass
trinkets   [ 71572] =  50345 -- Cultivated Power <= Muradin's Spyglass
trinkets   [ 71574] =  50346 -- Replenish Mana <= Sliver of Pure Ice
trinkets   [ 71575] =  50341 -- Invigorated <= Unidentifiable Organ
trinkets   [ 71577] =  50344 -- Invigorated <= Unidentifiable Organ
trinkets   [ 71579] =  50357 -- Elusive Power <= Maghia's Misguided Quill
trinkets   [ 71584] =  50358 -- Revitalized <= Purified Lunar Dust
trinkets   [ 71586] =  50356 -- Hardened Skin <= Corroded Skeleton Key
trinkets   [ 71601] =  50353 -- Surge of Power <= Dislodged Foreign Object
trinkets   [ 71605] =  50360 -- Siphoned Power <= Phylactery of the Nameless Lich
trinkets   [ 71607] =  50354 -- Release of Light <= Bauble of True Blood
trinkets   [ 71610] =  50359 -- Echoes of Light <= Althor's Abacus
trinkets   [ 71633] =  50352 -- Thick Skin <= Corpse Tongue Coin
trinkets   [ 71635] =  50361 -- Aegis of Dalaran <= Sindragosa's Flawless Fang
trinkets   [ 71636] =  50365 -- Siphoned Power <= Phylactery of the Nameless Lich
trinkets   [ 71638] =  50364 -- Aegis of Dalaran <= Sindragosa's Flawless Fang
trinkets   [ 71639] =  50349 -- Thick Skin <= Corpse Tongue Coin
trinkets   [ 71641] =  50366 -- Echoes of Light <= Althor's Abacus
trinkets   [ 71644] =  50348 -- Surge of Power <= Dislodged Foreign Object
trinkets   [ 71646] =  50726 -- Release of Light <= Bauble of True Blood
consumables[ 73320] =  52201 -- Frostborn Illusion <= Muradin's Favor
consumables[ 73324] =  52251 -- Portal: Dalaran <= Jaina's Locket
consumables[ 73331] =  52253 -- Lament of the Highborne <= Sylvanas' Music Box
trinkets   [ 73522] =  52351 -- King of Boars <= Figurine - King of Boars
trinkets   [ 73549] =  52199 -- Demon Panther <= Figurine - Demon Panther
trinkets   [ 73550] =  52352 -- Earthen Guardian <= Figurine - Earthen Guardian
trinkets   [ 73551] =  52353 -- Jeweled Serpent <= Figurine - Jeweled Serpent
trinkets   [ 73552] =  52354 -- Dream Owl <= Figurine - Dream Owl
consumables[ 73619] =  52490 -- Stardust
consumables[ 74553] =  53049 -- First Aid <= Embersilk Bandage
consumables[ 74554] =  53050 -- First Aid <= Heavy Embersilk Bandage
consumables[ 74555] =  53051 -- First Aid <= Dense Embersilk Bandage
consumables[ 75136] =  54452 -- Ethereal Portal
consumables[ 75148] =  54442 -- Embersilk Net
trinkets   [ 75456] =  54590 -- Piercing Twilight <= Sharpened Twilight Scale
trinkets   [ 75458] =  54569 -- Piercing Twilight <= Sharpened Twilight Scale
trinkets   [ 75466] =  54572 -- Twilight Flames <= Charred Twilight Scale
trinkets   [ 75473] =  54588 -- Twilight Flames <= Charred Twilight Scale
trinkets   [ 75477] =  54571 -- Scaly Nimbleness <= Petrified Twilight Scale
trinkets   [ 75480] =  54591 -- Scaly Nimbleness <= Petrified Twilight Scale
trinkets   [ 75490] =  54573 -- Eyes of Twilight <= Glowing Twilight Scale
trinkets   [ 75495] =  54589 -- Eyes of Twilight <= Glowing Twilight Scale
consumables[ 78164] =  49634 -- Drums of the Wild
consumables[ 78778] =  57099 -- Mysterious Potion
trinkets   [ 78830] =  56847 -- Projectile Vomit <= Chelsea's Nightmare
trinkets   [ 78922] =  56849 -- Summon Goblin Nurse <= Gus' First Aid Kit
consumables[ 78989] = { -- Healing Potion
     57191, -- Mythical Healing Potion
     63300, -- Rogue's Draught
}
consumables[ 78990] =  57192 -- Restore Mana <= Mythical Mana Potion
consumables[ 78992] =  57193 -- Rejuvenation Potion <= Mighty Rejuvenation Potion
consumables[ 78993] =  57194 -- Concentration <= Potion of Concentration
consumables[ 79468] =  58084 -- Ghost Elixir
consumables[ 79469] =  58085 -- Flask of Steelskin
consumables[ 79470] =  58086 -- Flask of the Draconic Mind
consumables[ 79471] =  58087 -- Flask of the Winds
consumables[ 79472] =  58088 -- Flask of Titanic Strength
consumables[ 79474] =  58089 -- Elixir of the Naga
consumables[ 79475] =  58090 -- Earthen Armor <= Earthen Potion
consumables[ 79476] =  58091 -- Volcanic Power <= Volcanic Potion
consumables[ 79477] =  58092 -- Elixir of the Cobra
consumables[ 79480] =  58093 -- Elixir of Deep Earth
consumables[ 79481] =  58094 -- Impossible Accuracy <= Elixir of Impossible Accuracy
consumables[ 79625] =  58142 -- Deathblood Venom
consumables[ 79632] =  58144 -- Mighty Speed <= Elixir of Mighty Speed
consumables[ 79633] =  58145 -- Tol'vir Agility <= Potion of the Tol'vir
consumables[ 79634] =  58146 -- Golem's Strength <= Golemblood Potion
consumables[ 79635] =  58148 -- Elixir of the Master
consumables[ 80256] =  58487 -- Teleport: Deepholm <= Potion of Deepholm
consumables[ 80263] =  58488 -- Potion of Treasure Finding
consumables[ 80265] =  58489 -- Potion of Illusion
consumables[ 80532] =  44330 -- Armor Piercing <= Elixir of Armor Piercing
consumables[ 80760] =  58933 -- Westfall Mud Pie
trinkets   [ 82645] =  60403 -- Elementium Dragonling
consumables[ 82674] =  64457 -- Teleport With Error <= The Last Relic of Argus
trinkets   [ 84212] =  23040 -- Glyph of Deflection
trinkets   [ 84213] =  29387 -- Gnome Ingenuity <= Gnomeregan Auto-Dodger 600
trinkets   [ 84960] = { -- Tremendous Fortitude
     61026, -- Vicious Gladiator's Emblem of Cruelty
     61030, -- Vicious Gladiator's Emblem of Proficiency
     61031, -- Vicious Gladiator's Emblem of Meditation
     61032, -- Vicious Gladiator's Emblem of Tenacity
}
trinkets   [ 84966] =  61034 -- Call of Victory <= Vicious Gladiator's Badge of Victory
trinkets   [ 84968] =  61035 -- Call of Dominance <= Vicious Gladiator's Badge of Dominance
trinkets   [ 84969] =  61033 -- Call of Conquest <= Vicious Gladiator's Badge of Conquest
trinkets   [ 85022] =  61047 -- Surge of Conquest <= Vicious Gladiator's Insignia of Conquest
trinkets   [ 85027] =  61045 -- Surge of Dominance <= Vicious Gladiator's Insignia of Dominance
trinkets   [ 85032] =  61046 -- Surge of Victory <= Vicious Gladiator's Insignia of Victory
consumables[ 85624] =  61381 -- Yance's Special Burger <= Yance's Special Burger Patty
consumables[ 86507] =  62251 -- Fortitude <= Runescroll of Fortitude II
consumables[ 86939] =  62237 -- Read Journal <= Adventurer's Journal
consumables[ 87643] =  62289 -- Broiled Dragon Feast
consumables[ 87644] =  62290 -- Seafood Magnifique Feast
consumables[ 87648] =  62675 -- Starfire Espresso
consumables[ 87649] =  62680 -- Satisfied <= Chocolate Cookie
consumables[ 87915] =  60858 -- Goblin Barbecue Feast <= Goblin Barbecue
consumables[ 88728] =  63122 -- Herbouflage <= Lifegiving Seed
consumables[ 89078] = { -- Baradin Healing Potion
     63144, -- Baradin's Wardens Healing Potion
     64994, -- Hellscream's Reach Healing Potion
}
consumables[ 89083] = { -- Baradin Mana Potion
     63145, -- Baradin's Wardens Mana Potion
     64993, -- Hellscream's Reach Mana Potion
}
trinkets   [ 89087] = { -- Lightning Strike
     62049, -- Darkmoon Card: Hurricane
     62051, -- Darkmoon Card: Hurricane
}
trinkets   [ 89091] =  62047 -- Volcanic Destruction <= Darkmoon Card: Volcano
trinkets   [ 89181] =  62048 -- Mighty Earthquake <= Darkmoon Card: Earthquake
trinkets   [ 89182] =  62050 -- Giant Wave <= Darkmoon Card: Tsunami
consumables[ 89188] =  63246 -- Origami Beetle
consumables[ 89201] =  62238 -- Origami Rock
consumables[ 89211] =  62239 -- Origami Slime
consumables[ 89342] =  63307 -- Spirit <= Scroll of Spirit IX
consumables[ 89343] =  63303 -- Agility <= Scroll of Agility IX
consumables[ 89344] =  63308 -- Armor <= Scroll of Protection IX
consumables[ 89345] =  63306 -- Stamina <= Scroll of Stamina IX
consumables[ 89346] =  63304 -- Strength <= Scroll of Strength IX
consumables[ 89347] =  63305 -- Intellect <= Scroll of Intellect IX
trinkets   [ 90842] =  57346 -- Mindfletcher <= Mindfletcher Talisman
trinkets   [ 90847] = { -- Prismatic
     59661, -- Pelagic Prism
     59664, -- Pelagic Prism
}
trinkets   [ 90854] = { -- Visionary
     59630, -- Severed Visionary Tentacle
     59633, -- Severed Visionary Tentacle
}
trinkets   [ 90885] =  55787 -- Witching Hour <= Witching Hourglass
trinkets   [ 90887] =  56320 -- Witching Hour <= Witching Hourglass
trinkets   [ 90889] =  61429 -- Fury of the Earthen <= Insignia of the Earthen Lord
trinkets   [ 90895] =  61411 -- Kiss of Death <= Stonemother's Kiss
trinkets   [ 90896] =  55810 -- Tendrils of Darkness <= Tendrils of Burrowing Dark
trinkets   [ 90898] =  56339 -- Tendrils of Darkness <= Tendrils of Burrowing Dark
trinkets   [ 90900] =  63842 -- Focus <= World-Queller Focus
trinkets   [ 90953] =  56138 -- Dead Winds <= Gale of Shadows
trinkets   [ 90985] =  56462 -- Dead Winds <= Gale of Shadows
trinkets   [ 90989] =  55889 -- Hymn of Power <= Anhuur's Hymnal
trinkets   [ 90992] =  56407 -- Hymn of Power <= Anhuur's Hymnal
trinkets   [ 90996] =  55879 -- Crescendo of Suffering <= Sorrowsong
trinkets   [ 91002] =  56400 -- Crescendo of Suffering <= Sorrowsong
trinkets   [ 91007] =  59326 -- Dire Magic <= Bell of Enraging Resonance
trinkets   [ 91019] =  58183 -- Soul Power <= Soul Casket
trinkets   [ 91024] =  59519 -- Revelation <= Theralion's Mirror
trinkets   [ 91027] =  59514 -- Heart's Revelation <= Heart of Ignacious
trinkets   [ 91041] =  59514 -- Heart's Judgment <= Heart of Ignacious
trinkets   [ 91047] = { -- Battle Magic
     62465, -- Stump of Time
     62470, -- Stump of Time
}
consumables[ 91073] =  64466 -- Summon Mau'ari <= Tiny Totem of Mau'ari
trinkets   [ 91075] =  63839 -- Vengeful Wisp <= Harmlight Token
trinkets   [ 91135] =  55256 -- Leviathan <= Sea Star
trinkets   [ 91136] =  56290 -- Leviathan <= Sea Star
trinkets   [ 91138] =  55819 -- Cleansing Tears <= Tear of Blood
trinkets   [ 91139] =  56351 -- Cleansing Tears <= Tear of Blood
trinkets   [ 91141] =  55854 -- Anthem <= Rainsong
trinkets   [ 91147] =  55995 -- Blessing of Isiset <= Blood of Isiset
trinkets   [ 91149] =  56414 -- Blessing of Isiset <= Blood of Isiset
trinkets   [ 91155] =  58184 -- Expansive Soul <= Core of Ripeness
trinkets   [ 91173] =  60233 -- Celerity <= Shard of Woe
trinkets   [ 91184] =  59500 -- Grounded Soul <= Fall of Mortality
trinkets   [ 91192] = { -- Pattern of Light
     62467, -- Mandala of Stirring Patterns
     62472, -- Mandala of Stirring Patterns
}
trinkets   [ 91296] =  56136 -- Egg Shell <= Corrupted Egg Shell
trinkets   [ 91308] =  56463 -- Egg Shell <= Corrupted Egg Shell
trinkets   [ 91320] =  59354 -- Inner Eye <= Jar of Ancient Remedies
trinkets   [ 91322] =  59354 -- Blind Spot <= Jar of Ancient Remedies
trinkets   [ 91336] =  57316 -- Heavy Lifting <= Egg-Lift Talisman
trinkets   [ 91338] =  59792 -- Dietary Enhancement <= Petrified Spider Crab
trinkets   [ 91340] =  56285 -- Typhoon <= Might of the Ocean
trinkets   [ 91341] =  66994 -- Typhoon <= Soul's Anguish
trinkets   [ 91344] = { -- Battle!
     59685, -- Kvaldir Battle Standard
     59689, -- Kvaldir Battle Standard
}
trinkets   [ 91345] =  61448 -- Favored <= Oremantle's Favor
trinkets   [ 91351] =  55814 -- Polarization <= Magnetite Mirror
trinkets   [ 91352] =  56345 -- Polarization <= Magnetite Mirror
trinkets   [ 91355] = { -- Fatality
     63838, -- Shrine-Cleansing Purifier
     63841, -- Tank-Commander Insignia
}
trinkets   [ 91363] =  55868 -- Heartened <= Heart of Solace
trinkets   [ 91364] =  56393 -- Heartened <= Heart of Solace
trinkets   [ 91368] =  56431 -- Eye of Doom <= Right Eye of Rajh
trinkets   [ 91370] =  56100 -- Eye of Doom <= Right Eye of Rajh
trinkets   [ 91374] =  56458 -- Battle Prowess <= Mark of Khardros
trinkets   [ 91376] =  56132 -- Battle Prowess <= Mark of Khardros
consumables[ 91722] =  64640 -- Puffer Breath <= Infectis Puffer Sashimi
consumables[ 91743] =  64361 -- Fountain of Knowledge <= Druid and Priest Statue Set
consumables[ 91749] =  64383 -- Wind Chime <= Kaldorei Wind Chimes
consumables[ 91752] =  64456 -- Arrival of the Naaru
consumables[ 91754] =  64481 -- Receive the Blessing of the Old God <= Blessing of the Old God
consumables[ 91756] =  64482 -- Whisper <= Puzzle Box of Yogg-Saron
consumables[ 91760] =  64646 -- Endure the Transformation <= Bones of Transformation
consumables[ 91771] =  64651 -- Wisp Form <= Wisp Amulet
trinkets   [ 91810] =  58180 -- Slayer <= License to Slay
trinkets   [ 91816] =  59224 -- Rageheart <= Heart of Rage
trinkets   [ 91821] =  59506 -- Race Against Death <= Crushing Weight
trinkets   [ 91828] = { -- Thrill of Victory
     62464, -- Impatience of Youth
     62469, -- Impatience of Youth
}
trinkets   [ 91832] =  59461 -- Raw Fury <= Fury of Angerforge
trinkets   [ 91836] =  59461 -- Forged Fury <= Fury of Angerforge
trinkets   [ 92043] =  57325 -- Invigorated <= Bileberry Smelling Salts
trinkets   [ 92045] = { -- Power of Focus
     59707, -- Wavespeaker's Focus
     59710, -- Wavespeaker's Focus
}
trinkets   [ 92052] =  66969 -- Herald of Doom <= Heart of the Vile
trinkets   [ 92055] =  61462 -- Gear Detected! <= Gear Detector
trinkets   [ 92069] =  55795 -- Final Key <= Key to the Endless Chamber
trinkets   [ 92071] = { -- Nimble
     63840, -- Juju of Nimbleness
     63843, -- Blood-Soaked Ale Mug
}
trinkets   [ 92085] =  55874 -- Grace <= Tia's Grace
trinkets   [ 92087] =  56295 -- Herald of Doom <= Grace of the Herald
trinkets   [ 92089] =  56394 -- Grace <= Tia's Grace
trinkets   [ 92091] =  56328 -- Final Key <= Key to the Endless Chamber
trinkets   [ 92094] =  56427 -- Eye of Vengeance <= Left Eye of Rajh
trinkets   [ 92096] =  56102 -- Eye of Vengeance <= Left Eye of Rajh
trinkets   [ 92098] =  56115 -- Speed of Thought <= Skardyn's Grace
trinkets   [ 92099] =  56440 -- Speed of Thought <= Skardyn's Grace
trinkets   [ 92104] =  58181 -- River of Death <= Fluid Death
trinkets   [ 92108] =  59520 -- Heedless Carnage <= Unheeded Warning
trinkets   [ 92123] = { -- Enigma
     62463, -- Unsolvable Riddle
     62468, -- Unsolvable Riddle
}
trinkets   [ 92124] =  59441 -- Nefarious Plot <= Prestor's Talisman of Machination
trinkets   [ 92126] =  59473 -- Twisted <= Essence of the Cyclone
consumables[ 92146] =  64881 -- Scarab Storm <= Pendant of the Scarab Storm
trinkets   [ 92162] =  59617 -- Mentally Prepared <= Mentalist's Protective Bottle
trinkets   [ 92166] = { -- Hardened Shell
     65803, -- Harrison's Insignia of Panache
     65804, -- Talisman of Sinister Order
     65805, -- Schnottz's Medallion of Command
}
trinkets   [ 92172] =  61433 -- Great Fortitude <= Insignia of Diplomacy
trinkets   [ 92174] =  56280 -- Hardened Shell <= Porcelain Crab
trinkets   [ 92179] =  55816 -- Lead Plating <= Leaden Despair
trinkets   [ 92184] =  56347 -- Lead Plating <= Leaden Despair
trinkets   [ 92186] =  55845 -- Amazing Fortitude <= Heart of Thunder
trinkets   [ 92187] =  56370 -- Amazing Fortitude <= Heart of Thunder
trinkets   [ 92188] = { -- Master Tactician
     63742, -- Za'brox's Lucky Tooth
     63745, -- Za'brox's Lucky Tooth
}
trinkets   [ 92199] =  55881 -- Blademaster <= Impetuous Query
trinkets   [ 92205] =  56449 -- Duelist <= Throngus's Finger
trinkets   [ 92208] =  56121 -- Duelist <= Throngus's Finger
trinkets   [ 92213] =  59515 -- Memory of Invincibility <= Vial of Stolen Memories
trinkets   [ 92216] =  64763 -- Surge of Conquest <= Bloodthirsty Gladiator's Insignia of Victory
trinkets   [ 92218] =  64762 -- Surge of Dominance <= Bloodthirsty Gladiator's Insignia of Dominance
trinkets   [ 92220] =  64761 -- Surge of Conquest <= Bloodthirsty Gladiator's Insignia of Conquest
trinkets   [ 92222] = { -- Image of Immortality
     62466, -- Mirror of Broken Images
     62471, -- Mirror of Broken Images
}
trinkets   [ 92223] = { -- Tremendous Fortitude
     64740, -- Bloodthirsty Gladiator's Emblem of Cruelty
     64741, -- Bloodthirsty Gladiator's Emblem of Meditation
     64742, -- Bloodthirsty Gladiator's Emblem of Tenacity
}
trinkets   [ 92224] =  64689 -- Call of Victory <= Bloodthirsty Gladiator's Badge of Victory
trinkets   [ 92225] =  64688 -- Call of Dominance <= Bloodthirsty Gladiator's Badge of Dominance
trinkets   [ 92226] =  64687 -- Call of Conquest <= Bloodthirsty Gladiator's Badge of Conquest
trinkets   [ 92233] =  58182 -- Tectonic Shift <= Bedrock Talisman
trinkets   [ 92235] =  59332 -- Turn of the Worm <= Symbiotic Worm
trinkets   [ 92318] =  65053 -- Dire Magic <= Bell of Enraging Resonance
trinkets   [ 92320] =  65105 -- Revelation <= Theralion's Mirror
trinkets   [ 92325] =  65110 -- Heart's Revelation <= Heart of Ignacious
trinkets   [ 92328] =  65110 -- Heart's Judgment <= Heart of Ignacious
trinkets   [ 92329] =  65029 -- Inner Eye <= Jar of Ancient Remedies
trinkets   [ 92331] =  65029 -- Blind Spot <= Jar of Ancient Remedies
trinkets   [ 92332] =  65124 -- Grounded Soul <= Fall of Mortality
trinkets   [ 92336] =  65175 -- Summon Fallen Footman <= Baradin Footman's Tags
trinkets   [ 92337] =  65176 -- Summon Fallen Grunt <= Baradin Grunt's Talisman
trinkets   [ 92342] =  65118 -- Race Against Death <= Crushing Weight
trinkets   [ 92345] =  65072 -- Rageheart <= Heart of Rage
trinkets   [ 92349] =  65026 -- Nefarious Plot <= Prestor's Talisman of Machination
trinkets   [ 92351] =  65140 -- Twisted <= Essence of the Cyclone
trinkets   [ 92355] =  65048 -- Turn of the Worm <= Symbiotic Worm
trinkets   [ 92357] =  65109 -- Memory of Invincibility <= Vial of Stolen Memories
trinkets   [ 92601] =  64645 -- Detonate Mana <= Tyrande's Favorite Doll
consumables[ 92649] =  62288 -- Cauldron of Battle
consumables[ 92712] =  65460 -- Big Cauldron of Battle
trinkets   [ 93225] =  53597 -- Tilt at Windmills <= Toy Windmill
trinkets   [ 93229] =  64627 -- Dying Breath
trinkets   [ 93248] = { -- Horn of the Traitor
     63632, -- Horn of the Traitor
     63633, -- Horn of the Traitor
}
consumables[ 93636] =  67097 -- Grim Campfire
trinkets   [ 93740] =  65931 -- Poison Cloud <= Essence of Eranikus' Shade
trinkets   [ 93742] =  65923 -- Death by Peasant <= Barov Servant Caller
trinkets   [ 93749] =  63245 -- Lunk's Kudos <= Lunk's Special Gear
trinkets   [ 93791] =  63241 -- Pilla <= Very Soft Pillow
consumables[ 93932] =  67415 -- Rejuvenation <= Draught of War
consumables[ 94160] =  67438 -- Flask of Flowing Water
consumables[ 94690] =  64373 -- Sword Dance <= Chalice of the Mountain Kings
consumables[ 94719] =  64488 -- The Innkeeper's Daughter
consumables[ 95007] =  64358 -- Soul Mirror <= Highborne Soul Mirror
trinkets   [ 95185] =  63194 -- Rhea's Child <= Rhea's Last Egg
trinkets   [ 95216] =  64597 -- Light's Embrace
trinkets   [ 95224] =  65357 -- Rainbow Generator
trinkets   [ 95227] =  63192 -- Tosselwrench's Shrinker
trinkets   [ 95870] =  66879 -- Lightning in a Bottle <= Bottled Lightning
trinkets   [ 95872] =  67101 -- Undying Flames <= Unquenchable Flame
trinkets   [ 95874] =  67037 -- Searing Words <= Binding Promise
trinkets   [ 95875] =  67118 -- Heartsparked <= Electrospark Heartstarter
trinkets   [ 95877] =  67152 -- La-La's Song <= Lady La-La's Singing Shell
trinkets   [ 95879] =  62978 -- Devourer's Stomach
trinkets   [ 95880] =  62966 -- Emissary's Watch
trinkets   [ 95881] =  62984 -- Omarion's Gift
trinkets   [ 95882] =  62995 -- Underlord's Mandible
consumables[ 96312] =  68806 -- Kalytha's Haunted Locket
trinkets   [ 96880] = { -- Tipping of the Scales
     68915, -- Scales of Life
     69109, -- Scales of Life
}
trinkets   [ 96908] =  68926 -- Victory <= Jaws of Defeat
trinkets   [ 96911] =  68927 -- Devour <= The Hungerer
trinkets   [ 96923] = { -- Titanic Power
     68972, -- Apparatus of Khaz'goroth
     69113, -- Apparatus of Khaz'goroth
}
trinkets   [ 96934] =  68972 -- Blessing of Khaz'goroth <= Apparatus of Khaz'goroth
trinkets   [ 96945] =  68981 -- Loom of Fate <= Spidersilk Spindle
trinkets   [ 96962] =  68982 -- Soul Fragment <= Necromantic Focus
trinkets   [ 96966] =  68983 -- Blaze of Life <= Eye of Blazing Power
trinkets   [ 96980] =  68995 -- Accelerated <= Vessel of Acceleration
trinkets   [ 96988] =  68996 -- Stay of Execution
trinkets   [ 97007] =  68998 -- Mark of the Firelord <= Rune of Zeth
trinkets   [ 97008] =  69000 -- Fiery Quintessence
trinkets   [ 97009] =  69001 -- Ancient Petrified Seed
trinkets   [ 97010] =  69002 -- Essence of the Eternal Flame
consumables[ 97020] =  69027 -- Eat Cone of Cold <= Cone of Cold
trinkets   [ 97121] =  69111 -- Victory <= Jaws of Defeat
trinkets   [ 97125] =  69112 -- Devour <= The Hungerer
trinkets   [ 97127] =  69113 -- Blessing of Khaz'goroth <= Apparatus of Khaz'goroth
trinkets   [ 97129] =  69138 -- Loom of Fate <= Spidersilk Spindle
trinkets   [ 97131] =  69139 -- Soul Fragment <= Necromantic Focus
trinkets   [ 97136] =  69149 -- Blaze of Life <= Eye of Blazing Power
trinkets   [ 97142] =  69167 -- Accelerated <= Vessel of Acceleration
consumables[ 97602] =  69233 -- Eat Cone of Cold <= Cone of Cold
trinkets   [ 98275] =  69762 -- Death by Voodoo Gnome <= Miniature Voodoo Mask
consumables[ 99659] =  70161 -- Mushroom Chair
trinkets   [ 99711] =  70517 -- Call of Conquest <= Vicious Gladiator's Badge of Conquest
trinkets   [ 99712] =  70518 -- Call of Dominance <= Vicious Gladiator's Badge of Dominance
trinkets   [ 99713] =  70519 -- Call of Victory <= Vicious Gladiator's Badge of Victory
trinkets   [ 99714] = { -- Tremendous Fortitude
     70563, -- Vicious Gladiator's Emblem of Cruelty
     70564, -- Vicious Gladiator's Emblem of Meditation
     70565, -- Vicious Gladiator's Emblem of Tenacity
}
trinkets   [ 99717] =  70577 -- Surge of Conquest <= Vicious Gladiator's Insignia of Conquest
trinkets   [ 99719] =  70578 -- Surge of Dominance <= Vicious Gladiator's Insignia of Dominance
trinkets   [ 99721] =  70579 -- Surge of Victory <= Vicious Gladiator's Insignia of Victory
trinkets   [ 99737] = { -- Tremendous Fortitude
     70396, -- Ruthless Gladiator's Emblem of Cruelty
     70397, -- Ruthless Gladiator's Emblem of Meditation
     70398, -- Ruthless Gladiator's Emblem of Tenacity
}
trinkets   [ 99739] =  70399 -- Call of Conquest <= Ruthless Gladiator's Badge of Conquest
trinkets   [ 99740] =  70400 -- Call of Victory <= Ruthless Gladiator's Badge of Victory
trinkets   [ 99741] =  70401 -- Call of Dominance <= Ruthless Gladiator's Badge of Dominance
trinkets   [ 99742] =  70402 -- Surge of Dominance <= Ruthless Gladiator's Insignia of Dominance
trinkets   [ 99746] =  70403 -- Surge of Victory <= Ruthless Gladiator's Insignia of Victory
trinkets   [ 99748] =  70404 -- Surge of Conquest <= Ruthless Gladiator's Insignia of Conquest
consumables[ 99767] =  70722 -- Little Wickerman
trinkets   [ 99915] =  70141 -- Caber Toss <= Dwyer's Caber
trinkets   [100322] =  70141 -- Pumped Up <= Dwyer's Caber
trinkets   [100612] =  70142 -- Summon Moonwell <= Moonwell Chalice
consumables[100959] =  71137 -- Keg Pony <= Brewfest Keg Pony
consumables[101184] =  71259 -- Leyara's Locket
trinkets   [101285] = { -- Summon the Black Brewmaiden
     71333, -- Bitterer Balebrew Charm
     87576, -- Bitterest Balebrew Charm
    117361, -- Bitterest Balebrew Charm
}
trinkets   [101286] = { -- Summon the Brewmaiden
     71334, -- Bubblier Brightbrew Charm
     87575, -- Bubbliest Brightbrew Charm
}
trinkets   [101287] =  71335 -- Reflection of Torment <= Coren's Chilled Chromium Coaster
trinkets   [101289] =  71336 -- Essence of Life <= Petrified Pickled Egg
trinkets   [101291] =  71337 -- Now is the time! <= Mithril Stopwatch
trinkets   [101293] =  71338 -- Drunken Evasiveness <= Brawler's Trophy
trinkets   [101492] =  70143 -- Summon Splashing Waters <= Moonwell Phial
trinkets   [101515] =  70144 -- Charged Blows <= Ricket's Magnetic Fireball
trinkets   [101518] =  70144 -- Magnetic Fireball <= Ricket's Magnetic Fireball
consumables[102362] =  72159 -- Red Ogre Mage Costume <= Magical Ogre Idol
consumables[102365] =  72161 -- Spurious Sarcophagus
trinkets   [102432] =  72455 -- Surge of Victory <= Ruthless Gladiator's Insignia of Victory
trinkets   [102434] =  72450 -- Call of Victory <= Ruthless Gladiator's Badge of Victory
trinkets   [102435] =  72449 -- Surge of Dominance <= Ruthless Gladiator's Insignia of Dominance
trinkets   [102437] =  72448 -- Call of Dominance <= Ruthless Gladiator's Badge of Dominance
trinkets   [102438] = { -- Tremendous Fortitude
     72359, -- Ruthless Gladiator's Emblem of Cruelty
     72360, -- Ruthless Gladiator's Emblem of Tenacity
     72361, -- Ruthless Gladiator's Emblem of Meditation
}
trinkets   [102439] =  72309 -- Surge of Conquest <= Ruthless Gladiator's Insignia of Conquest
trinkets   [102441] =  72304 -- Call of Conquest <= Ruthless Gladiator's Badge of Conquest
trinkets   [102659] =  72897 -- Arrow of Time
trinkets   [102660] =  72901 -- Rosary of Light
trinkets   [102662] =  72898 -- Foul Gift <= Foul Gift of the Demon Lord
trinkets   [102664] =  72899 -- Varo'then's Brooch
trinkets   [102667] =  72900 -- Veil of Lies
consumables[102694] =  72985 -- First Aid <= Windwool Bandage
consumables[102695] =  72986 -- First Aid <= Heavy Windwool Bandage
trinkets   [102740] = { -- Strength of Courage
     73062, -- Zealous Idol of Battle
     73155, -- Ebonsoul Idol of Battle
     73165, -- Valiant Idol of Battle
}
trinkets   [102741] = { -- Avoidance of the Snake
     73060, -- Zealous Defender's Idol
     73157, -- Ebonsoul Defender's Idol
     73167, -- Valiant Defender's Idol
     88636, -- Monastic Defender's Idol
}
trinkets   [102742] = { -- Mastery of Nimbleness
     73042, -- Zealous Defender's Stone
     73061, -- Zealous Stone of Battle
     73067, -- Wildsoul Stone of Rage
     73121, -- Shadowstalking Stone of Rage
     73135, -- Stormbinder Stone of Rage
     73150, -- Beastsoul Stone of Rage
     73154, -- Ebonsoul Stone of Battle
     73160, -- Ebonsoul Defender's Stone
     73164, -- Valiant Stone of Battle
     73170, -- Valiant Defender's Stone
     88634, -- Monastic Defender's Stone
     88639, -- Monastic Stone of Rage
}
trinkets   [102744] = { -- Haste of the Mongoose
     73064, -- Zealous Stone of Wisdom
     73065, -- Wildsoul Stone of Destruction
     73101, -- Magesoul Stone of Destruction
     73106, -- Dreadsoul Stone of Destruction
     73111, -- Seraphic Stone of Wisdom
     73116, -- Seraphic Stone of Destruction
     73126, -- Wildsoul Stone of Wisdom
     73140, -- Stormbinder Stone of Destruction
     73145, -- Stormbinder Stone of Wisdom
     88644, -- Monastic Stone of Wisdom
}
trinkets   [102746] = { -- Spirit of Wisdom
     73063, -- Zealous Idol of Wisdom
     73114, -- Seraphic Idol of Wisdom
     73129, -- Wildsoul Idol of Wisdom
     73142, -- Stormbinder Idol of Wisdom
     88647, -- Monastic Idol of Wisdom
}
trinkets   [102747] = { -- Agility of the Tiger
     73068, -- Wildsoul Idol of Rage
     73124, -- Shadowstalking Idol of Rage
     73132, -- Stormbinder Idol of Rage
     73147, -- Beastsoul Idol of Rage
     88642, -- Monastic Idol of Rage
}
trinkets   [102748] = { -- Intellect of the Sage
     73066, -- Wildsoul Idol of Destruction
     73104, -- Magesoul Idol of Destruction
     73109, -- Dreadsoul Idol of Destruction
     73119, -- Seraphic Idol of Destruction
     73137, -- Stormbinder Idol of Destruction
}
consumables[103740] =  74142 -- Darkmoon Firework
consumables[104958] =  74919 -- Pandaren Banquet
trinkets   [105132] =  73648 -- Call of Conquest <= Cataclysmic Gladiator's Badge of Conquest
trinkets   [105133] =  73496 -- Call of Victory <= Cataclysmic Gladiator's Badge of Victory
trinkets   [105134] =  73498 -- Call of Dominance <= Cataclysmic Gladiator's Badge of Dominance
trinkets   [105135] =  73643 -- Surge of Conquest <= Cataclysmic Gladiator's Insignia of Conquest
trinkets   [105137] =  73497 -- Surge of Dominance <= Cataclysmic Gladiator's Insignia of Dominance
trinkets   [105139] =  73491 -- Surge of Victory <= Cataclysmic Gladiator's Insignia of Victory
trinkets   [105144] = { -- Tremendous Fortitude
     73591, -- Cataclysmic Gladiator's Emblem of Meditation
     73592, -- Cataclysmic Gladiator's Emblem of Tenacity
     73593, -- Cataclysmic Gladiator's Emblem of Cruelty
}
consumables[105193] =  75016 -- Great Pandaren Banquet
consumables[105222] =  75038 -- Imbibe <= Mad Brewer's Breakfast
consumables[105617] =  75525 -- Alchemist's Flask
consumables[105681] =  76075 -- Mantid Elixir
consumables[105682] =  76076 -- Mad Hozen Elixir
consumables[105683] =  76077 -- Elixir of Weaponry
consumables[105684] =  76078 -- Elixir of the Rapids
consumables[105685] =  76079 -- Elixir of Peace
consumables[105686] =  76080 -- Elixir of Perfection
consumables[105687] =  76081 -- Elixir of Mirrors
consumables[105688] =  76083 -- Monk's Elixir
consumables[105689] =  76084 -- Flask of Spring Blossoms
consumables[105691] =  76085 -- Flask of the Warm Sun
consumables[105693] =  76086 -- Flask of Falling Leaves
consumables[105694] =  76087 -- Flask of the Earth
consumables[105696] =  76088 -- Flask of Winter's Bite
consumables[105697] =  76089 -- Virmen's Bite
consumables[105698] =  76090 -- Potion of the Mountains
consumables[105699] =  76091 -- Greater Potion of Luck
consumables[105701] =  76092 -- Potion of Focus
consumables[105702] =  76093 -- Potion of the Jade Serpent
consumables[105704] = { -- Alchemist's Rejuvenation
     76094, -- Alchemist's Rejuvenation
    113585, -- Iron Horde Rejuvenation Potion
}
consumables[105706] =  76095 -- Potion of Mogu Power
consumables[105707] =  76096 -- Darkwater Potion
consumables[105708] =  76097 -- Healing Potion <= Master Healing Potion
consumables[105709] = { -- Restore Mana
     76098, -- Master Mana Potion
    113545, -- Carved Drinking Horn
}
trinkets   [107947] =  77113 -- Agile <= Kiroptyric Sigil
trinkets   [107948] = { -- Ultimate Power
     77114, -- Bottled Wishes
     77115, -- Reflection of the Light
}
trinkets   [107949] =  77116 -- Titanic Strength <= Rotting Skull
trinkets   [107951] =  77117 -- Elusive <= Fire of the Deep
trinkets   [107960] =  77197 -- Combat Trance <= Wrath of Unchaining
trinkets   [107962] =  77199 -- Expansive Mind <= Heart of Unliving
trinkets   [107966] =  77200 -- Titanic Strength <= Eye of Unmaking
trinkets   [107968] =  77201 -- Preternatural Evasion <= Resolve of Undying
trinkets   [107970] =  77198 -- Combat Mind <= Will of Unbinding
trinkets   [107982] = { -- Velocity
     77202, -- Starcatcher Compass
     77203, -- Insignia of the Corrupted Mind
     77204, -- Seal of the Seven Signs
}
trinkets   [107986] =  77206 -- Master Tactician <= Soulshifter Vortex
trinkets   [107988] =  77205 -- Find Weakness <= Creche of the Final Dragon
trinkets   [107994] =  77207 -- Lightning Strike <= Vial of Shadows
trinkets   [107997] =  77210 -- Whirling Maw <= Bone-Link Fetish
trinkets   [108000] =  77209 -- Nick of Time <= Windward Heart
trinkets   [108005] =  77208 -- Shadowbolt Volley <= Cunning of the Cruel
trinkets   [109709] =  77973 -- Velocity <= Starcatcher Compass
trinkets   [109711] =  77993 -- Velocity <= Starcatcher Compass
trinkets   [109717] =  77974 -- Combat Trance <= Wrath of Unchaining
trinkets   [109719] =  77994 -- Combat Trance <= Wrath of Unchaining
trinkets   [109721] =  77979 -- Lightning Strike <= Vial of Shadows
trinkets   [109724] =  77999 -- Lightning Strike <= Vial of Shadows
trinkets   [109742] =  77972 -- Find Weakness <= Creche of the Final Dragon
trinkets   [109744] =  77992 -- Find Weakness <= Creche of the Final Dragon
trinkets   [109748] =  77977 -- Titanic Strength <= Eye of Unmaking
trinkets   [109750] =  77997 -- Titanic Strength <= Eye of Unmaking
trinkets   [109752] =  77982 -- Whirling Maw <= Bone-Link Fetish
trinkets   [109754] =  78002 -- Whirling Maw <= Bone-Link Fetish
trinkets   [109774] =  77970 -- Master Tactician <= Soulshifter Vortex
trinkets   [109776] =  77990 -- Master Tactician <= Soulshifter Vortex
trinkets   [109780] =  77978 -- Preternatural Evasion <= Resolve of Undying
trinkets   [109782] =  77998 -- Preternatural Evasion <= Resolve of Undying
trinkets   [109787] =  77971 -- Velocity <= Insignia of the Corrupted Mind
trinkets   [109789] =  77991 -- Velocity <= Insignia of the Corrupted Mind
trinkets   [109793] =  77975 -- Combat Mind <= Will of Unbinding
trinkets   [109795] =  77995 -- Combat Mind <= Will of Unbinding
trinkets   [109798] =  77980 -- Shadowbolt Volley <= Cunning of the Cruel
trinkets   [109800] =  78000 -- Shadowbolt Volley <= Cunning of the Cruel
trinkets   [109802] =  77969 -- Velocity <= Seal of the Seven Signs
trinkets   [109804] =  77989 -- Velocity <= Seal of the Seven Signs
trinkets   [109811] =  77976 -- Expansive Mind <= Heart of Unliving
trinkets   [109813] =  77996 -- Expansive Mind <= Heart of Unliving
trinkets   [109822] =  77981 -- Nick of Time <= Windward Heart
trinkets   [109825] =  78001 -- Nick of Time <= Windward Heart
trinkets   [109888] =  72899 -- Magistrike <= Varo'then's Brooch
trinkets   [109908] =  72898 -- Foul Gift <= Foul Gift of the Demon Lord
consumables[109933] =  78883 -- Darkmoon Firewater
trinkets   [109993] =  74035 -- Master Pit Fighter
trinkets   [109994] =  74034 -- Pit Fighter
trinkets   [110008] =  72901 -- Rosary of Light
consumables[111922] =  79257 -- Fortitude <= Runescroll of Fortitude III
consumables[113029] =  79338 -- Throw Bucket of Meaty Dog Food <= Bucket of Meaty Dog Food
consumables[113095] =  79769 -- Demon Hunter's Aspect
consumables[115037] =  80313 -- Ling-Ting's Herbal Journey <= Ling-Ting's Favorite Tea
consumables[116484] =  80822 -- The Golden Banana
trinkets   [117642] =  80773 -- Singing Cricket Medallion
trinkets   [117643] =  80774 -- Grove Viper Medallion
trinkets   [117644] =  80775 -- Coral Adder Medallion
trinkets   [117645] =  80776 -- Flamelager Medallion
trinkets   [117646] =  80777 -- Amberfly Idol
trinkets   [117647] =  80778 -- Silkbead Emblem <= Silkbead Idol
trinkets   [117648] =  80779 -- Mirror Strider Emblem
trinkets   [117649] =  80780 -- Greenpaw Idol
trinkets   [117650] =  80781 -- Shoots of Life
trinkets   [117651] =  80782 -- Misty Jade Idol
trinkets   [118611] =  81532 -- Silkspawn Carving
trinkets   [118613] =  81534 -- Carp Hunter Feather
trinkets   [118614] =  81535 -- Glade Pincher Feather
trinkets   [118615] =  81536 -- Jungle Huntress Idol
trinkets   [118750] =  81661 -- Faded Forest Medallion
trinkets   [118751] =  81662 -- Faded Forest Emblem
trinkets   [118752] =  81663 -- Faded Forest Medal
trinkets   [118753] =  81664 -- Faded Forest Insignia
trinkets   [118754] =  81665 -- Faded Forest Badge
trinkets   [118871] =  81834 -- Silkspawn Wing
trinkets   [118872] =  81835 -- Plainshawk Feather
trinkets   [118873] =  81836 -- Lucky "Rabbit's" Foot
trinkets   [118874] =  81837 -- Viseclaw Carapace
trinkets   [118875] =  81838 -- Tawnyhide Antler
trinkets   [120171] =  82574 -- Coin of Blessings
trinkets   [120172] =  82575 -- Coin of Serendipity
trinkets   [120173] =  82576 -- Coin of Luck
trinkets   [120174] =  82577 -- Coin of Good Fortune
trinkets   [120175] =  82578 -- Luckydo Coin
trinkets   [120176] =  82579 -- Lorewalker's Mark
trinkets   [120177] =  82580 -- Lorewalker's Emblem
trinkets   [120178] =  82581 -- Lorewalker's Sigil
trinkets   [120179] =  82582 -- Lorewalker's Medallion
trinkets   [120180] =  82583 -- Lorewalker's Insignia
trinkets   [120254] =  82696 -- Mountainscaler Mark
trinkets   [120255] =  82697 -- Mountainscaler Medal
trinkets   [120256] =  82698 -- Mountainscaler Emblem
trinkets   [120257] =  82699 -- Mountainscaler Insignia
trinkets   [120258] =  82700 -- Mountainscaler Badge
trinkets   [121717] =  82984 -- Socks <= Jade Raccoon
trinkets   [122266] =  83245 -- Wasteland Relic
trinkets   [122267] =  83246 -- Wasteland Sigil
trinkets   [122268] =  83247 -- Wasteland Emblem
trinkets   [122269] =  83248 -- Wasteland Insignia
trinkets   [122270] =  83249 -- Wasteland Badge
trinkets   [122309] =  83731 -- Mark of the Catacombs
trinkets   [122310] =  83732 -- Sigil of the Catacombs
trinkets   [122311] =  83733 -- Emblem of the Catacombs
trinkets   [122312] =  83734 -- Medallion of the Catacombs
trinkets   [122313] =  83735 -- Symbol of the Catacombs
trinkets   [122314] =  83736 -- Sigil of Compassion
trinkets   [122315] =  83737 -- Sigil of Fidelity
trinkets   [122316] =  83738 -- Sigil of Grace
trinkets   [122317] =  83739 -- Sigil of Patience
trinkets   [122318] =  83740 -- Sigil of Devotion
trinkets   [122687] =  84071 -- Charm of Ten Songs
trinkets   [122688] =  84072 -- Braid of Ten Songs
trinkets   [122689] =  84073 -- Knot of Ten Songs
trinkets   [122691] =  84075 -- Relic of Kypari Zar
trinkets   [122692] =  84076 -- Sigil of Kypari Zar
trinkets   [122693] =  84077 -- Emblem of Kypari Zar
trinkets   [122694] =  84078 -- Insignia of Kypari Zar
trinkets   [122695] =  84079 -- Badge of Kypari Zar
consumables[125167] =  85973 -- Ancient Pandaren Fishing Charm
consumables[125686] =  86432 -- Banana Infused Rum
consumables[125879] =  86508 -- Fresh Bread
consumables[126144] =  87264 -- Four Senses Brew
trinkets   [126236] = { -- Slippery
     81243, -- Iron Protector Talisman
     85181, -- Iron Protector Talisman
    100999, -- Heart-Lesion Defender Idol
    101089, -- Mistdancer Defender Idol
    101160, -- Sunsoul Defender Idol
    101303, -- Oathsworn Defender Idol
    117042, -- Heart-Lesion Defender Idol
    117132, -- Mistdancer Defender Idol
    117203, -- Sunsoul Defender Idol
    117346, -- Oathsworn Defender Idol
}
trinkets   [126260] =  81181 -- Heart of Fire
trinkets   [126266] = { -- Enlightenment
     81133, -- Empty Fruit Barrel
    101041, -- Springrain Stone of Wisdom
    101107, -- Mistdancer Stone of Wisdom
    101138, -- Sunsoul Stone of Wisdom
    101183, -- Communal Stone of Wisdom
    101250, -- Streamtalker Stone of Wisdom
    113022, -- 6.0 QRP Template PH Int Trinket #1
    114888, -- Excavated Highmaul Thingamabob
    114961, -- Thornmother Eye
    116077, -- Pulsating Brain of No'losh
    116823, -- Katealystic Konverter
    117084, -- Springrain Stone of Wisdom
    117150, -- Mistdancer Stone of Wisdom
    117181, -- Sunsoul Stone of Wisdom
    117226, -- Communal Stone of Wisdom
    117293, -- Streamtalker Stone of Wisdom
    118202, -- Fungus-Infected Hydra Lung
}
trinkets   [126270] = { -- Vial of Ichorous Blood
     81264, -- Vial of Ichorous Blood
    100963, -- Vial of Ichorous Blood
}
consumables[126294] =  86607 -- Goblin Dragon Gun, Mark II
consumables[126318] =  86565 -- Horn Blast <= Battle Horn
consumables[126389] = 109076 -- Goblin Glider <= Goblin Glider Kit
trinkets   [126467] = { -- Energize Mana
     81266, -- Price of Progress
     88360, -- Price of Progress
    101038, -- Springrain Idol of Wisdom
    101102, -- Mistdancer Idol of Wisdom
    101135, -- Sunsoul Idol of Wisdom
    101179, -- Communal Idol of Wisdom
    101247, -- Streamtalker Idol of Wisdom
    117081, -- Springrain Idol of Wisdom
    117145, -- Mistdancer Idol of Wisdom
    117178, -- Sunsoul Idol of Wisdom
    117222, -- Communal Idol of Wisdom
    117290, -- Streamtalker Idol of Wisdom
}
trinkets   [126476] =  81192 -- Predation <= Vision of the Predator
trinkets   [126478] = { -- Flashfreeze
     81263, -- Flashfrozen Resin Globule
    100951, -- Flashfrozen Resin Globule
}
trinkets   [126483] = { -- Windswept Pages
     81125, -- Windswept Pages
    112887, -- Goc's Trophy
    113162, -- Kral'za's Resolve
    118020, -- Goc's Trophy
}
trinkets   [126484] = { -- Flashing Steel
     81265, -- Flashing Steel Talisman
     88294, -- Flashing Steel Talisman
}
trinkets   [126489] = { -- Relentlessness
     81267, -- Searing Words
     88355, -- Searing Words
    112886, -- Ferocity of Kor'gall
    113163, -- Kliaa's Venomclaws
    118017, -- Blistered Ancient Bark
}
consumables[126492] =  87226 -- Banquet of the Grill
consumables[126494] =  87228 -- Great Banquet of the Grill
consumables[126495] =  87230 -- Banquet of the Wok
consumables[126496] =  87232 -- Great Banquet of the Wok
consumables[126497] =  87234 -- Banquet of the Pot
consumables[126498] =  87236 -- Great Banquet of the Pot
consumables[126499] =  87238 -- Banquet of the Steamer
consumables[126500] =  87240 -- Great Banquet of the Steamer
consumables[126501] =  87242 -- Banquet of the Oven
consumables[126502] =  87244 -- Great Banquet of the Oven
consumables[126503] =  87246 -- Banquet of the Brew
consumables[126504] =  87248 -- Great Banquet of the Brew
trinkets   [126513] = { -- Poised to Strike
     81138, -- Carbonic Carbuncle
    112884, -- Might of Kor'gall
    113159, -- Probiscus of the Swampfly Queen
    118016, -- Smoldering Ancient's Bark
}
trinkets   [126519] = { -- Lessons of the Darkmaster
     81268, -- Lessons of the Darkmaster
     88358, -- Lessons of the Darkmaster
}
trinkets   [126533] = { -- Elusive
     86131, -- Vial of Dragon's Blood
     86790, -- Vial of Dragon's Blood
     87063, -- Vial of Dragon's Blood
    116127, -- Bright Coin
}
consumables[126547] =  87253 -- Perpetual Leftovers
trinkets   [126554] = { -- Agile
     86132, -- Bottle of Infinite Stars
     86791, -- Bottle of Infinite Stars
     87057, -- Bottle of Infinite Stars
    101009, -- Springrain Idol of Rage
    101054, -- Trailseeker Idol of Rage
    101113, -- Mistdancer Idol of Rage
    101200, -- Lightdrinker Idol of Rage
    101217, -- Streamtalker Idol of Rage
    108878, -- Warlords Intro Zone PH Agi Trinket #1
    111530, -- Giantstalker's Guile
    111546, -- Grondo's Eyepatch
    113020, -- 6.0 QRP Template PH Agi Trinket #1
    114887, -- Excavated Highmaul Knicknack
    114959, -- Prickly Shadeback Thorn
    116824, -- Rabid Talbuk Horn
    117052, -- Springrain Idol of Rage
    117097, -- Trailseeker Idol of Rage
    117156, -- Mistdancer Idol of Rage
    117243, -- Lightdrinker Idol of Rage
    117260, -- Streamtalker Idol of Rage
    117537, -- Springrain Idol of Durability
}
trinkets   [126555] =  86567 -- Yaungol Wind Chime
trinkets   [126577] = { -- Inner Brilliance
     86133, -- Light of the Cosmos
     86792, -- Light of the Cosmos
     87065, -- Light of the Cosmos
}
trinkets   [126582] = { -- Unwavering Might
     86144, -- Lei Shen's Final Orders
     86802, -- Lei Shen's Final Orders
     87072, -- Lei Shen's Final Orders
    100991, -- Heart-Lesion Idol of Battle
    101152, -- Sunsoul Idol of Battle
    101295, -- Oathsworn Idol of Battle
    108877, -- Warlords Intro Zone PH Str Trinket #2
    112885, -- Commander Gar's Iron Insignia
    113019, -- 6.0 QRP Template PH Str Trinket #2
    113158, -- Dol'mak's Lucky Charm
    113253, -- Karg's Hunting Horn
    114890, -- Excavated Highmaul Doohickey
    117034, -- Heart-Lesion Idol of Battle
    117195, -- Sunsoul Idol of Battle
    117338, -- Oathsworn Idol of Battle
    118019, -- Might of the Magnaron
}
trinkets   [126588] = { -- Arcane Secrets
     86147, -- Qin-xi's Polarizing Seal
     86805, -- Qin-xi's Polarizing Seal
     87075, -- Qin-xi's Polarizing Seal
}
trinkets   [126597] = { -- Jade Warlord Figurine
     86046, -- Jade Warlord Figurine
     86775, -- Jade Warlord Figurine
     89079, -- Lao-Chin's Liquid Courage
}
trinkets   [126599] = { -- Velocity
     86042, -- Jade Charioteer Figurine
     86043, -- Jade Bandit Figurine
     86771, -- Jade Charioteer Figurine
     86772, -- Jade Bandit Figurine
     89082, -- Hawkmaster's Talon
}
trinkets   [126605] = { -- Blossom
     86044, -- Jade Magistrate Figurine
     86773, -- Jade Magistrate Figurine
     89081, -- Blossom of Pure Snow
}
trinkets   [126606] = { -- Scroll of Revered Ancestors
     86045, -- Jade Courtesan Figurine
     86774, -- Jade Courtesan Figurine
     89080, -- Scroll of Revered Ancestors
}
trinkets   [126640] = { -- Radiance
     86327, -- Spirits of the Sun
     86885, -- Spirits of the Sun
     87163, -- Spirits of the Sun
}
trinkets   [126646] = { -- Untouchable
     86323, -- Stuff of Nightmares
     86881, -- Stuff of Nightmares
     87160, -- Stuff of Nightmares
}
trinkets   [126649] = { -- Unrelenting Attacks
     86332, -- Terror in the Mists
     86890, -- Terror in the Mists
     87167, -- Terror in the Mists
    111948, -- Gruuk's Evil Eye
}
trinkets   [126657] = { -- Alacrity
     86336, -- Darkmist Vortex
     86894, -- Darkmist Vortex
     87172, -- Darkmist Vortex
}
trinkets   [126659] = { -- Quickened Tongues
     86388, -- Essence of Terror
     86907, -- Essence of Terror
     87175, -- Essence of Terror
    101023, -- Springrain Idol of Destruction
    101069, -- Mountainsage Idol of Destruction
    101168, -- Communal Idol of Destruction
    101222, -- Streamtalker Idol of Destruction
    101263, -- Felsoul Idol of Destruction
    108880, -- Warlords Intro Zone PH Int Trinket #1
    117066, -- Springrain Idol of Destruction
    117112, -- Mountainsage Idol of Destruction
    117211, -- Communal Idol of Destruction
    117265, -- Streamtalker Idol of Destruction
    117306, -- Felsoul Idol of Destruction
}
trinkets   [126679] = { -- Call of Victory
     84490, -- Dreadful Gladiator's Badge of Victory
     84942, -- Malevolent Gladiator's Badge of Victory
     91410, -- Tyrannical Gladiator's Badge of Victory
     91763, -- Malevolent Gladiator's Badge of Victory
     94349, -- Tyrannical Gladiator's Badge of Victory
     99943, -- Tyrannical Gladiator's Badge of Victory
    100019, -- Tyrannical Gladiator's Badge of Victory
    100500, -- Grievous Gladiator's Badge of Victory
    100579, -- Grievous Gladiator's Badge of Victory
    102636, -- Prideful Gladiator's Badge of Victory
    102833, -- Grievous Gladiator's Badge of Victory
    103314, -- Grievous Gladiator's Badge of Victory
    103511, -- Prideful Gladiator's Badge of Victory
    111232, -- Primal Gladiator's Badge of Victory
    115159, -- Primal Combatant's Badge of Victory
    115759, -- Primal Gladiator's Badge of Victory
    117739, -- Tournament Gladiator's Badge of Victory
    117940, -- Tournament Gladiator's Badge of Victory
}
trinkets   [126683] = { -- Call of Dominance
     84488, -- Dreadful Gladiator's Badge of Dominance
     84940, -- Malevolent Gladiator's Badge of Dominance
     91400, -- Tyrannical Gladiator's Badge of Dominance
     91753, -- Malevolent Gladiator's Badge of Dominance
     94346, -- Tyrannical Gladiator's Badge of Dominance
     99937, -- Tyrannical Gladiator's Badge of Dominance
    100016, -- Tyrannical Gladiator's Badge of Dominance
    100490, -- Grievous Gladiator's Badge of Dominance
    100576, -- Grievous Gladiator's Badge of Dominance
    102633, -- Prideful Gladiator's Badge of Dominance
    102830, -- Grievous Gladiator's Badge of Dominance
    103308, -- Grievous Gladiator's Badge of Dominance
    103505, -- Prideful Gladiator's Badge of Dominance
    111227, -- Primal Gladiator's Badge of Dominance
    115154, -- Primal Combatant's Badge of Dominance
    115754, -- Primal Gladiator's Badge of Dominance
    117734, -- Tournament Gladiator's Badge of Dominance
    117935, -- Tournament Gladiator's Badge of Dominance
}
trinkets   [126690] = { -- Call of Conquest
     84344, -- Dreadful Gladiator's Badge of Conquest
     84934, -- Malevolent Gladiator's Badge of Conquest
     91099, -- Tyrannical Gladiator's Badge of Conquest
     91452, -- Malevolent Gladiator's Badge of Conquest
     94373, -- Tyrannical Gladiator's Badge of Conquest
     99772, -- Tyrannical Gladiator's Badge of Conquest
    100043, -- Tyrannical Gladiator's Badge of Conquest
    100195, -- Grievous Gladiator's Badge of Conquest
    100603, -- Grievous Gladiator's Badge of Conquest
    102659, -- Prideful Gladiator's Badge of Conquest
    102856, -- Grievous Gladiator's Badge of Conquest
    103145, -- Grievous Gladiator's Badge of Conquest
    103342, -- Prideful Gladiator's Badge of Conquest
    111222, -- Primal Gladiator's Badge of Conquest
    115149, -- Primal Combatant's Badge of Conquest
    115749, -- Primal Gladiator's Badge of Conquest
    117729, -- Tournament Gladiator's Badge of Conquest
    117930, -- Tournament Gladiator's Badge of Conquest
}
trinkets   [126697] = { -- Tremendous Fortitude
     84399, -- Dreadful Gladiator's Emblem of Cruelty
     84400, -- Dreadful Gladiator's Emblem of Tenacity
     84401, -- Dreadful Gladiator's Emblem of Meditation
     84936, -- Malevolent Gladiator's Emblem of Cruelty
     84938, -- Malevolent Gladiator's Emblem of Tenacity
     84939, -- Malevolent Gladiator's Emblem of Meditation
     91209, -- Tyrannical Gladiator's Emblem of Cruelty
     91210, -- Tyrannical Gladiator's Emblem of Tenacity
     91211, -- Tyrannical Gladiator's Emblem of Meditation
     91562, -- Malevolent Gladiator's Emblem of Cruelty
     91563, -- Malevolent Gladiator's Emblem of Tenacity
     91564, -- Malevolent Gladiator's Emblem of Meditation
     94329, -- Tyrannical Gladiator's Emblem of Meditation
     94396, -- Tyrannical Gladiator's Emblem of Cruelty
     94422, -- Tyrannical Gladiator's Emblem of Tenacity
     94516, -- Fortitude of the Zandalari
     95677, -- Fortitude of the Zandalari
     96049, -- Fortitude of the Zandalari
     96421, -- Fortitude of the Zandalari
     96793, -- Fortitude of the Zandalari
     99838, -- Tyrannical Gladiator's Emblem of Cruelty
     99839, -- Tyrannical Gladiator's Emblem of Tenacity
     99840, -- Tyrannical Gladiator's Emblem of Meditation
     99990, -- Tyrannical Gladiator's Emblem of Meditation
    100066, -- Tyrannical Gladiator's Emblem of Cruelty
    100092, -- Tyrannical Gladiator's Emblem of Tenacity
    100305, -- Grievous Gladiator's Emblem of Cruelty
    100306, -- Grievous Gladiator's Emblem of Tenacity
    100307, -- Grievous Gladiator's Emblem of Meditation
    100559, -- Grievous Gladiator's Emblem of Meditation
    100626, -- Grievous Gladiator's Emblem of Cruelty
    100652, -- Grievous Gladiator's Emblem of Tenacity
    102616, -- Prideful Gladiator's Emblem of Meditation
    102680, -- Prideful Gladiator's Emblem of Cruelty
    102706, -- Prideful Gladiator's Emblem of Tenacity
    102813, -- Grievous Gladiator's Emblem of Meditation
    102877, -- Grievous Gladiator's Emblem of Cruelty
    102903, -- Grievous Gladiator's Emblem of Tenacity
    103210, -- Grievous Gladiator's Emblem of Cruelty
    103211, -- Grievous Gladiator's Emblem of Tenacity
    103212, -- Grievous Gladiator's Emblem of Meditation
    103407, -- Prideful Gladiator's Emblem of Cruelty
    103408, -- Prideful Gladiator's Emblem of Tenacity
    103409, -- Prideful Gladiator's Emblem of Meditation
    111224, -- Primal Gladiator's Emblem of Cruelty
    111225, -- Primal Gladiator's Emblem of Tenacity
    111226, -- Primal Gladiator's Emblem of Meditation
    115151, -- Primal Combatant's Emblem of Cruelty
    115152, -- Primal Combatant's Emblem of Tenacity
    115153, -- Primal Combatant's Emblem of Meditation
    115751, -- Primal Gladiator's Emblem of Cruelty
    115752, -- Primal Gladiator's Emblem of Tenacity
    115753, -- Primal Gladiator's Emblem of Meditation
    117731, -- Tournament Gladiator's Emblem of Cruelty
    117732, -- Tournament Gladiator's Emblem of Tenacity
    117733, -- Tournament Gladiator's Emblem of Meditation
    117932, -- Tournament Gladiator's Emblem of Cruelty
    117933, -- Tournament Gladiator's Emblem of Tenacity
    117934, -- Tournament Gladiator's Emblem of Meditation
}
trinkets   [126700] = { -- Surge of Victory
     84495, -- Dreadful Gladiator's Insignia of Victory
     84937, -- Malevolent Gladiator's Insignia of Victory
     91415, -- Tyrannical Gladiator's Insignia of Victory
     91768, -- Malevolent Gladiator's Insignia of Victory
     94415, -- Tyrannical Gladiator's Insignia of Victory
     99948, -- Tyrannical Gladiator's Insignia of Victory
    100085, -- Tyrannical Gladiator's Insignia of Victory
    100505, -- Grievous Gladiator's Insignia of Victory
    100645, -- Grievous Gladiator's Insignia of Victory
    102699, -- Prideful Gladiator's Insignia of Victory
    102896, -- Grievous Gladiator's Insignia of Victory
    103319, -- Grievous Gladiator's Insignia of Victory
    103516, -- Prideful Gladiator's Insignia of Victory
    111233, -- Primal Gladiator's Insignia of Victory
    115160, -- Primal Combatant's Insignia of Victory
    115760, -- Primal Gladiator's Insignia of Victory
    117740, -- Tournament Gladiator's Insignia of Victory
    117941, -- Tournament Gladiator's Insignia of Victory
}
trinkets   [126705] = { -- Surge of Dominance
     84489, -- Dreadful Gladiator's Insignia of Dominance
     84941, -- Malevolent Gladiator's Insignia of Dominance
     91401, -- Tyrannical Gladiator's Insignia of Dominance
     91754, -- Malevolent Gladiator's Insignia of Dominance
     94482, -- Tyrannical Gladiator's Insignia of Dominance
     99938, -- Tyrannical Gladiator's Insignia of Dominance
    100152, -- Tyrannical Gladiator's Insignia of Dominance
    100491, -- Grievous Gladiator's Insignia of Dominance
    100712, -- Grievous Gladiator's Insignia of Dominance
    102766, -- Prideful Gladiator's Insignia of Dominance
    102963, -- Grievous Gladiator's Insignia of Dominance
    103309, -- Grievous Gladiator's Insignia of Dominance
    103506, -- Prideful Gladiator's Insignia of Dominance
    111228, -- Primal Gladiator's Insignia of Dominance
    115155, -- Primal Combatant's Insignia of Dominance
    115755, -- Primal Gladiator's Insignia of Dominance
    117735, -- Tournament Gladiator's Insignia of Dominance
    117936, -- Tournament Gladiator's Insignia of Dominance
}
trinkets   [126707] = { -- Surge of Conquest
     84349, -- Dreadful Gladiator's Insignia of Conquest
     84935, -- Malevolent Gladiator's Insignia of Conquest
     91104, -- Tyrannical Gladiator's Insignia of Conquest
     91457, -- Malevolent Gladiator's Insignia of Conquest
     94356, -- Tyrannical Gladiator's Insignia of Conquest
     99777, -- Tyrannical Gladiator's Insignia of Conquest
    100026, -- Tyrannical Gladiator's Insignia of Conquest
    100200, -- Grievous Gladiator's Insignia of Conquest
    100586, -- Grievous Gladiator's Insignia of Conquest
    102643, -- Prideful Gladiator's Insignia of Conquest
    102840, -- Grievous Gladiator's Insignia of Conquest
    103150, -- Grievous Gladiator's Insignia of Conquest
    103347, -- Prideful Gladiator's Insignia of Conquest
    111223, -- Primal Gladiator's Insignia of Conquest
    115150, -- Primal Combatant's Insignia of Conquest
    115750, -- Primal Gladiator's Insignia of Conquest
    117730, -- Tournament Gladiator's Insignia of Conquest
    117931, -- Tournament Gladiator's Insignia of Conquest
}
consumables[126956] =  87548 -- Lorewalker's Lodestone
consumables[126957] =  87549 -- Lorewalker's Map
consumables[127145] =  87528 -- Honorary Brewmaster Keg
consumables[127207] =  86568 -- Memory of Mr. Smite <= Mr. Smite's Brass Compass
consumables[127230] =  86569 -- Visions of Insanity <= Crystal of Insanity
trinkets   [127233] =  86570 -- Release Puppies <= Crate of Kidnapped Puppies
trinkets   [127247] =  86572 -- Summon Terracotta Warrior <= Terracotta Fragment
consumables[127249] =  86573 -- Flesh to Stone <= Shard of Archstone
consumables[127261] = { -- Stonebinding
     86571, -- Kang's Bindstone
    104262, -- Odd Polished Stone
}
trinkets   [127265] =  86576 -- Summon Whirlwind of Blades <= Dynasty of Steel
consumables[127266] =  86577 -- Amber Prison <= Rod of Ambershaping
consumables[127269] =  86578 -- Everlasting Frenzy <= Eternal Warrior's Sigil
trinkets   [127282] =  86579 -- Unleash Tornado <= Bottled Tornado
consumables[127284] =  86580 -- Symbiotic Growth <= Overgrown Lilypad
consumables[127285] =  86582 -- Shimmering Water <= Aqua Jewel
consumables[127292] =  86581 -- Watersight <= Farwater Conch
consumables[127318] =  86590 -- Gentle Breeze <= Essence of the Breeze
consumables[127320] =  86591 -- Magic Banana
consumables[127322] =  86592 -- Offering of Peace <= Hozen Peace Pipe
consumables[127323] =  86593 -- Beach Bum <= Hozen Beach Ball
consumables[127325] =  86594 -- Summon Helpful Wikky <= Helpful Wikky's Whistle
consumables[127326] =  89365 -- Summon Feverbite Hatchlings <= Feverbite Egg Sack
trinkets   [127464] =  87780 -- Summon Martar <= Martar's Magnifying Glass
trinkets   [127549] =  87500 -- Munificence <= Brooch of Munificent Deeds
consumables[127563] =  87872 -- Desecrated Oil
trinkets   [127569] =  87499 -- Gleaming <= Grakl's Gleaming Talisman
trinkets   [127570] =  87498 -- Whisper of Spirits <= Spiritwhisper Conch
trinkets   [127572] =  87497 -- Karma <= Core of Decency
trinkets   [127575] =  87495 -- Perfection <= Gerp's Perfect Arrow
trinkets   [127577] =  87496 -- Final Word <= Daelo's Final Words
trinkets   [127721] =  88371 -- Watermelon Bomb
consumables[127770] =  88382 -- Keenbean Kafa Boost <= Keenbean Kafa
consumables[127771] =  88381 -- Silversage Incense
consumables[127800] =  88375 -- Turnip Punching Bag
consumables[127803] =  88377 -- Turnip Paint Gun <= Turnip Paint "Gun"
trinkets   [127819] =  88376 -- Painted Turnip <= Orange Painted Turnip
consumables[127829] =  88370 -- Puntable Marmot
consumables[127843] =  88379 -- Grummlecake
trinkets   [127858] =  88577 -- Explosive Barrel
consumables[127874] =  88387 -- Shushen's Spittoon
consumables[127882] =  88388 -- Squirmy Delight
trinkets   [127915] = { -- Essence of Life
     87573, -- Thousand-Year Pickled Egg
    117359, -- Thousand-Year Pickled Egg
}
trinkets   [127923] = { -- Now is the time!
     87572, -- Mithril Wristwatch
    117358, -- Mithril Wristwatch
}
trinkets   [127928] = { -- Reflection of Torment
     87574, -- Coren's Cold Chromium Coaster
    117360, -- Coren's Cold Chromium Coaster
}
trinkets   [127967] = { -- Drunken Evasiveness
     87571, -- Brawler's Statue
    117357, -- Brawler's Statue
}
consumables[128018] =  88385 -- Searing Gaze of the Dook <= Hozen Idol
consumables[128081] =  88384 -- The Burlap Blessing <= Burlap Ritual Bag
consumables[128180] =  88584 -- Totem of Harmony
trinkets   [128191] =  88590 -- Nurong's Gun Blast <= Nurong's Gun
consumables[128225] =  88487 -- Throw Volatile Orb <= Volatile Orb
consumables[128227] = { -- Serpent's Heart Firework
     87764, -- Serpent's Heart Firework
    104146, -- Serpent's Heart Firework
}
consumables[128228] = { -- Grand Celebration Firework
     88491, -- Grand Celebration Firework
    104145, -- Grand Celebration Firework
    107664, -- Blizzcon Boss Basher's Bombastic Blasters
}
consumables[128229] = { -- Celestial Firework
     88493, -- Celestial Firework
    104144, -- Celestial Firework
}
consumables[128275] =  88589 -- Cremate <= Cremating Torch
consumables[128290] =  88492 -- Wicked Wikket
consumables[128295] =  88490 -- Triple-Distilled Brew
consumables[128307] =  88530 -- Bubbling Beverage
consumables[128308] =  88529 -- Sparkling Water
consumables[128320] =  88579 -- Jin Warmbrew's Keg <= Jin Warmkeg's Brew
consumables[128327] =  88587 -- Throw Iron Belly Spirits <= Iron Belly Spirits
consumables[128328] =  88580 -- Ken-Ken's Mask
consumables[128337] =  88578 -- Cup of Kafa
trinkets   [128365] =  88583 -- Ban's Bomb <= Ban's Bag of Bombs
consumables[128367] =  88586 -- Chao Cookies
trinkets   [128386] =  88585 -- Mantid Poison <= Dislodged Stinger
trinkets   [128519] =  88371 -- Watermelon Bomb
trinkets   [128521] =  88376 -- Painted Turnip <= Orange Painted Turnip
consumables[128797] =  88802 -- Summon Foxicopter <= Foxicopter Controller
trinkets   [128984] =  79328 -- Blessing of the Celestials <= Relic of Xuen
trinkets   [128985] =  79331 -- Blessing of the Celestials <= Relic of Yu'lon
trinkets   [128986] =  79327 -- Blessing of the Celestials <= Relic of Xuen
trinkets   [128987] =  79330 -- Blessing of the Celestials <= Relic of Chi-Ji
trinkets   [128988] =  79329 -- Protection of the Celestials <= Relic of Niuzao
consumables[129023] =  88566 -- Surgical Alterations <= Krastinov's Bag of Horrors
trinkets   [129115] =  88995 -- Shado-Pan Dragon Gun
consumables[129312] =  89222 -- Jump Through Hoop <= Cloud Ring
consumables[129336] =  89223 -- Summon Race Flag <= Racing Flag
consumables[129337] =  89225 -- Summon Race Finish Line <= Finish Line
consumables[129339] =  88801 -- Flip It <= Flippable Table
consumables[129435] =  89224 -- Summon Race Flag <= Floating Racing Flag
consumables[129436] =  89227 -- Summon Race Finish Line <= Floating Finish Line
consumables[129498] =  89230 -- Restorative Amber
trinkets   [129554] =  89232 -- Mogu Rune of Paralysis
consumables[129694] =  86588 -- Summon Firework Launcher <= Pandaren Firework Launcher
trinkets   [129743] =  86585 -- Golden Fleece Effect <= Golden Fleece
consumables[129787] =  86584 -- Hardened Shell
consumables[129803] =  86589 -- Skymirror Image <= Ai-Li's Skymirror
trinkets   [129812] =  89083 -- Hunger <= Iron Belly Wok
consumables[129836] =  86586 -- Panflute Melody <= Panflute of Pandaria
consumables[129861] =  86575 -- Ancient Ritual <= Chalice of Secrets
consumables[129864] =  86583 -- Salyin Distraction <= Salyin Battle Banner
consumables[129892] =  89301 -- Breakable Wooden Boards <= Stack of Wooden Boards
consumables[129893] =  89302 -- Breakable Bamboo Boards <= Stack of Bamboo
consumables[129894] =  89303 -- Stack of Breakable Blocks <= Stack of Stone Blocks
consumables[130100] =  82960 -- Ghostly Skeleton Key
consumables[130121] =  89373 -- Scotty's Lucky Coin
trinkets   [130146] =  86587 -- Summon Tranquil Sprout <= Seed of Tranquil Growth
trinkets   [130486] =  89611 -- Quilen Statuette
consumables[130505] =  89614 -- Anatomical Dummy
consumables[130649] =  89640 -- Life Spirit
consumables[130650] =  89641 -- Water Spirit
consumables[130678] =  89682 -- Unruly Behemoth <= Oddly-Shaped Horn
consumables[130730] =  89697 -- Kafa-Crazed Goat <= Bag of Kafa Beans
consumables[130895] =  89770 -- Rampaging Yak <= Tuft of Yak Fur
consumables[130918] =  87647 -- Origami Crane
consumables[130957] =  87648 -- Origami Frog
consumables[131200] = { -- Jade Blossom Firework
     89888, -- Jade Blossom Firework
    104143, -- Jade Blossom Firework
}
consumables[131210] = { -- Autumn Flower Firework
     89893, -- Autumn Flower Firework
    104142, -- Autumn Flower Firework
}
consumables[131317] = { -- Alliance Firework
     89911, -- Alliance Firework
     89999, -- Everlasting Alliance Firework
    104141, -- Alliance Firework
    116147, -- Alliance Firework
}
consumables[131318] = { -- Horde Firework
     89912, -- Horde Firework
     90000, -- Everlasting Horde Firework
    104140, -- Horde Firework
    116148, -- Horde Firework
}
trinkets   [131411] = { -- Pandaren Dragonling
     77530, -- Ghost Iron Dragonling
    107195, -- Firefury Spirit
}
consumables[131493] =  90067 -- B.F.F. <= B. F. F. Necklace
consumables[131510] = { -- Uncontrolled Banish
     90078, -- Cracked Talisman
    104320, -- Cursed Talisman
}
consumables[131585] =  90175 -- Slap n' Chop <= Gin-Ji Knife Set
consumables[132568] =  90899 -- Blow Darkmoon Whistle <= Darkmoon Whistle
consumables[133371] =  91904 -- Summon Stackable Stag <= Stackable Stag
trinkets   [133630] = { -- Exquisite Proficiency
    100990, -- Heart-Lesion Stone of Battle
    101002, -- Heart-Lesion Defender Stone
    101012, -- Springrain Stone of Rage
    101026, -- Springrain Stone of Destruction
    101057, -- Trailseeker Stone of Rage
    101072, -- Mountainsage Stone of Destruction
    101087, -- Mistdancer Defender Stone
    101117, -- Mistdancer Stone of Rage
    101151, -- Sunsoul Stone of Battle
    101163, -- Sunsoul Defender Stone
    101171, -- Communal Stone of Destruction
    101203, -- Lightdrinker Stone of Rage
    101220, -- Streamtalker Stone of Rage
    101225, -- Streamtalker Stone of Destruction
    101266, -- Felsoul Stone of Destruction
    101294, -- Oathsworn Stone of Battle
    101306, -- Oathsworn Defender Stone
    108876, -- Warlords Intro Zone PH Str Trinket #1
    108879, -- Warlords Intro Zone PH Agi Trinket #2
    108881, -- Warlords Intro Zone PH Int Trinket #2
    113017, -- 6.0 QRP Template PH Int Trinket #2
    113018, -- 6.0 QRP Template PH Str Trinket #1
    113021, -- 6.0 QRP Template PH Agi Trinket #2
    113254, -- Lokra's Fury
    113255, -- Asha's Fang
    113527, -- Legacy of Om'ra
    114886, -- Twisted Elemental Focus
    114889, -- Kuhlrath's Cursed Totem
    114891, -- Void-Touched Totem
    114956, -- unused
    114957, -- Overized Shadeback Talon
    114960, -- Spires  unused
    116075, -- Scales of Gennadian
    116799, -- Smoldering Heart of Hyperious
    117033, -- Heart-Lesion Stone of Battle
    117045, -- Heart-Lesion Defender Stone
    117055, -- Springrain Stone of Rage
    117069, -- Springrain Stone of Destruction
    117100, -- Trailseeker Stone of Rage
    117115, -- Mountainsage Stone of Destruction
    117130, -- Mistdancer Defender Stone
    117160, -- Mistdancer Stone of Rage
    117194, -- Sunsoul Stone of Battle
    117206, -- Sunsoul Defender Stone
    117214, -- Communal Stone of Destruction
    117246, -- Lightdrinker Stone of Rage
    117263, -- Streamtalker Stone of Rage
    117268, -- Streamtalker Stone of Destruction
    117309, -- Felsoul Stone of Destruction
    117337, -- Oathsworn Stone of Battle
    117349, -- Oathsworn Defender Stone
    117540, -- Springrain Stone of Durability
}
consumables[134870] =  22848 -- Empowerment <= Elixir of Empowerment
consumables[134873] =  58143 -- Prismatic Elixir
trinkets   [134944] =  92782 -- Footman's Resolve <= Steadfast Footman's Medallion
trinkets   [134945] =  92784 -- SI:7 Training <= SI:7 Operative's Manual
trinkets   [134946] =  92786 -- Supremacy of the Alliance <= Alliance Insignia of Conquering
trinkets   [134953] =  92783 -- Grunt's Tenacity <= Mark of the Hardened Grunt
trinkets   [134954] =  92785 -- Kor'kron Elite <= Kor'kron Book of Hurting
trinkets   [134956] =  92787 -- Supremacy of the Horde <= Horde Insignia of Conquering
consumables[134986] = { -- Potion of Brawler's Might
     92941, -- Potion of Brawler's Might
     98063, -- Bottomless Potion of Brawler's Might
}
consumables[134987] = { -- Potion of Brawler's Cunning
     92942, -- Potion of Brawler's Cunning
     98062, -- Bottomless Potion of Brawler's Cunning
}
consumables[134989] = { -- Potion of Brawler's Deftness
     92943, -- Potion of Brawler's Deftness
     98061, -- Bottomless Potion of Brawler's Deftness
}
consumables[134998] =  92954 -- Brawler's Healing Potion
consumables[135376] =  93158 -- Bottled <= Expired Blackout Brew
consumables[135445] =  93043 -- Throw Rotten Apple <= Rotten Apple
consumables[135446] =  93045 -- Throw Rotten Watermelon <= Rotten Watermelon
consumables[135447] =  93044 -- Throw Rotten Banana <= Rotten Banana
consumables[135855] =  93351 -- Potion of Luck
trinkets   [136082] = { -- Static Charge
     93254, -- Static-Caster's Medallion
     93259, -- Shock-Charger Medallion
}
trinkets   [136083] =  93255 -- Needle and Thread <= Cutstitcher Medallion
trinkets   [136084] = { -- Sense for Weakness
     93256, -- Skullrender Medallion
     93261, -- Helmbreaker Medallion
}
trinkets   [136085] = { -- Vapor Lock
     93257, -- Medallion of Mystifying Vapors
     93262, -- Vaporshield Medallion
}
trinkets   [136086] = { -- Archer's Grace
     93253, -- Woundripper Medallion
     93258, -- Arrowflight Medallion
}
trinkets   [136087] =  93260 -- Heartwarmer <= Heartwarmer Medallion
trinkets   [136088] = { -- Deadeye
     93341, -- Dominator's Deadeye Badge
     93346, -- Deadeye Badge of the Shieldwall
}
trinkets   [136089] = { -- Arcane Sight
     93342, -- Dominator's Arcane Badge
     93347, -- Arcane Badge of the Shieldwall
}
trinkets   [136090] = { -- Mender's Charm
     93343, -- Dominator's Mending Badge
     93348, -- Mending Badge of the Shieldwall
}
trinkets   [136091] = { -- Knightly Valor
     93344, -- Dominator's Knightly Badge
     93349, -- Knightly Badge of the Shieldwall
}
trinkets   [136092] = { -- Superior Durability
     93345, -- Dominator's Durable Badge
     93350, -- Durable Badge of the Shieldwall
}
consumables[136252] =  91866 -- Exodar Portal Shard
consumables[136253] =  91863 -- Silvermoon Portal Shard
consumables[136254] =  91865 -- Darnassus Portal Shard
consumables[136255] =  91864 -- Ironforge Portal Shard
consumables[136256] =  91862 -- Undercity Portal Shard
consumables[136257] =  91861 -- Thunder Bluff Portal Shard
consumables[136258] =  91860 -- Stormwind Portal Shard
consumables[136259] =  91850 -- Orgrimmar Portal Shard
consumables[136508] =  93672 -- Dark Portal
consumables[136583] =  93730 -- Darkmoon Top Hat
trinkets   [137211] =  93900 -- Tremendous Fortitude <= Inherited Mark of Tyranny
consumables[138110] =  94130 -- Incantation of Haqin
consumables[138487] =  94233 -- Incantation of Deng
trinkets   [138699] =  94511 -- Superluminal <= Vicious Talisman of the Shado-Pan Assault
trinkets   [138702] =  94508 -- Surge of Strength <= Brutal Talisman of the Shado-Pan Assault
trinkets   [138703] =  94510 -- Acceleration <= Volatile Talisman of the Shado-Pan Assault
trinkets   [138724] =  94509 -- Lifeblood <= Soothing Talisman of the Shado-Pan Assault
trinkets   [138728] =  94507 -- Change of Tactics <= Steadfast Talisman of the Shado-Pan Assault
trinkets   [138756] = { -- Blades of Renataki
     94512, -- Renataki's Soul Charm
     95625, -- Renataki's Soul Charm
     95997, -- Renataki's Soul Charm
     96369, -- Renataki's Soul Charm
     96741, -- Renataki's Soul Charm
}
trinkets   [138759] = { -- Feathers of Fury
     94515, -- Fabled Feather of Ji-Kun
     95726, -- Fabled Feather of Ji-Kun
     96098, -- Fabled Feather of Ji-Kun
     96470, -- Fabled Feather of Ji-Kun
     96842, -- Fabled Feather of Ji-Kun
}
trinkets   [138786] = { -- Wushoolay's Lightning
     94513, -- Wushoolay's Final Choice
     95669, -- Wushoolay's Final Choice
     96041, -- Wushoolay's Final Choice
     96413, -- Wushoolay's Final Choice
     96785, -- Wushoolay's Final Choice
}
trinkets   [138856] = { -- Cloudburst
     94514, -- Horridon's Last Gasp
     95641, -- Horridon's Last Gasp
     96013, -- Horridon's Last Gasp
     96385, -- Horridon's Last Gasp
     96757, -- Horridon's Last Gasp
}
trinkets   [138864] = { -- Blood of Power
     94518, -- Delicate Vial of the Sanguinaire
     95779, -- Delicate Vial of the Sanguinaire
     96151, -- Delicate Vial of the Sanguinaire
     96523, -- Delicate Vial of the Sanguinaire
     96895, -- Delicate Vial of the Sanguinaire
}
trinkets   [138870] = { -- Rampage
     94519, -- Primordius' Talisman of Rage
     95757, -- Primordius' Talisman of Rage
     96129, -- Primordius' Talisman of Rage
     96501, -- Primordius' Talisman of Rage
     96873, -- Primordius' Talisman of Rage
}
trinkets   [138895] = { -- Frenzy
     94522, -- Talisman of Bloodlust
     95748, -- Talisman of Bloodlust
     96120, -- Talisman of Bloodlust
     96492, -- Talisman of Bloodlust
     96864, -- Talisman of Bloodlust
}
trinkets   [138898] = { -- Breath of Many Minds
     94521, -- Breath of the Hydra
     95711, -- Breath of the Hydra
     96083, -- Breath of the Hydra
     96455, -- Breath of the Hydra
     96827, -- Breath of the Hydra
}
trinkets   [138925] = { -- Zandalari Warding
     94525, -- Stolen Relic of Zuldazar
     95763, -- Stolen Relic of Zuldazar
     96135, -- Stolen Relic of Zuldazar
     96507, -- Stolen Relic of Zuldazar
     96879, -- Stolen Relic of Zuldazar
}
trinkets   [138938] = { -- Juju Madness
     94523, -- Bad Juju
     95665, -- Bad Juju
     96037, -- Bad Juju
     96409, -- Bad Juju
     96781, -- Bad Juju
}
trinkets   [138963] = { -- Perfect Aim
     94524, -- Unerring Vision of Lei Shen
     95814, -- Unerring Vision of Lei Shen
     96186, -- Unerring Vision of Lei Shen
     96558, -- Unerring Vision of Lei Shen
     96930, -- Unerring Vision of Lei Shen
}
trinkets   [138967] = { -- Blessing of Zuldazar
     94525, -- Stolen Relic of Zuldazar
     95763, -- Stolen Relic of Zuldazar
     96135, -- Stolen Relic of Zuldazar
     96507, -- Stolen Relic of Zuldazar
     96879, -- Stolen Relic of Zuldazar
}
trinkets   [138973] = { -- The Risen Wind
     94527, -- Ji-Kun's Rising Winds
     95727, -- Ji-Kun's Rising Winds
     96099, -- Ji-Kun's Rising Winds
     96471, -- Ji-Kun's Rising Winds
     96843, -- Ji-Kun's Rising Winds
}
trinkets   [138979] = { -- Soul Barrier
     94528, -- Soul Barrier
     95811, -- Soul Barrier
     96183, -- Soul Barrier
     96555, -- Soul Barrier
     96927, -- Soul Barrier
}
trinkets   [139133] = { -- Mastermind
     94531, -- Cha-Ye's Essence of Brilliance
     95772, -- Cha-Ye's Essence of Brilliance
     96144, -- Cha-Ye's Essence of Brilliance
     96516, -- Cha-Ye's Essence of Brilliance
     96888, -- Cha-Ye's Essence of Brilliance
    111548, -- Grondo's To-Do List
    112888, -- Anger of Kor'gall
    113161, -- Throbbing Swampfly Venom Sac
    118018, -- Charred Ancient's Ember
}
trinkets   [139170] = { -- Eye of Brutality
     94529, -- Gaze of the Twins
     95799, -- Gaze of the Twins
     96171, -- Gaze of the Twins
     96543, -- Gaze of the Twins
     96915, -- Gaze of the Twins
}
consumables[139489] = { -- Unlocking Ancient Gate
     95056, -- Polymorphic Key
     97155, -- Polymorphic Key
}
consumables[139490] = { -- Frost Rune Trap
     95055, -- Frost Rune Trap
     97156, -- Frost Rune Trap
}
consumables[139492] = { -- Potion of Light Steps
     95054, -- Potion of Light Steps
     97157, -- Potion of Light Steps
}
consumables[139493] =  93742 -- Healing Potion
consumables[139657] =  95350 -- Incantation of Vu
consumables[140271] =  95566 -- Sacrifice <= Ra'sha's Sacrificial Dagger
consumables[140295] =  95567 -- Kirin Tor Beacon
consumables[140300] =  95568 -- Sunreaver Beacon
trinkets   [140380] = { -- Shield of Hydra Sputum
     94520, -- Inscribed Bag of Hydra-Spawn
     95712, -- Inscribed Bag of Hydra-Spawn
     96084, -- Inscribed Bag of Hydra-Spawn
     96456, -- Inscribed Bag of Hydra-Spawn
     96828, -- Inscribed Bag of Hydra-Spawn
}
consumables[142325] =  98132 -- Shado-Pan Geyser Gun
consumables[142372] =  98136 -- Control Jerry <= Gastropod Shell
trinkets   [144073] =  31615 -- Arcane Energy <= Ancient Draenei Arcane Relic
trinkets   [144074] =  31617 -- Ferocity <= Ancient Draenei War Talisman
trinkets   [144108] =  38073 -- Arcane Energy <= Will of the Red Dragonflight
trinkets   [144129] = { -- Tremendous Fortitude
     41587, -- Battlemaster's Celerity
     41588, -- Battlemaster's Aggression
     41589, -- Battlemaster's Resolve
     41590, -- Battlemaster's Courage
}
trinkets   [144130] =  39821 -- Spell Power <= Spiritist's Focus
trinkets   [144201] =  55266 -- Herald of Doom <= Grace of the Herald
trinkets   [144203] =  55237 -- Hardened Shell <= Porcelain Crab
trinkets   [144205] =  55251 -- Typhoon <= Might of the Ocean
consumables[144959] = 101617 -- Deluxe Noodle Soup
consumables[144960] = 101618 -- Pandaren Treasure Noodle Soup
consumables[145166] = 101630 -- Noodle Cart <= Noodle Cart Kit
consumables[145169] = 101661 -- Deluxe Noodle Cart <= Deluxe Noodle Cart Kit
consumables[145196] = 101662 -- Pandaren Treasure Noodle Cart <= Pandaren Treasure Noodle Cart Kit
trinkets   [145430] = 103678 -- Call of the Mists <= Time-Lost Artifact
trinkets   [146046] = { -- Expanded Mind
    102293, -- Purified Bindings of Immerseus
    104426, -- Purified Bindings of Immerseus
    104675, -- Purified Bindings of Immerseus
    104924, -- Purified Bindings of Immerseus
    105173, -- Purified Bindings of Immerseus
    105422, -- Purified Bindings of Immerseus
    112426, -- Purified Bindings of Immerseus
    112889, -- Genesaur's Greatness
    113160, -- Moonstone Luck Token
    118021, -- Goc's Eye
}
trinkets   [146184] = { -- Wrath of the Darkspear
    102310, -- Black Blood of Y'Shaarj
    104652, -- Black Blood of Y'Shaarj
    104901, -- Black Blood of Y'Shaarj
    105150, -- Black Blood of Y'Shaarj
    105399, -- Black Blood of Y'Shaarj
    105648, -- Black Blood of Y'Shaarj
    112938, -- Black Blood of Y'Shaarj
}
trinkets   [146218] = { -- Yu'lon's Bite
    103687, -- Yu'lon's Bite
    103987, -- Yu'lon's Bite
}
trinkets   [146245] = { -- Outrage
    102298, -- Evil Eye of Galakras
    104495, -- Evil Eye of Galakras
    104744, -- Evil Eye of Galakras
    104993, -- Evil Eye of Galakras
    105242, -- Evil Eye of Galakras
    105491, -- Evil Eye of Galakras
    112703, -- Evil Eye of Galakras
}
trinkets   [146250] = { -- Determination
    102305, -- Thok's Tail Tip
    104613, -- Thok's Tail Tip
    104862, -- Thok's Tail Tip
    105111, -- Thok's Tail Tip
    105360, -- Thok's Tail Tip
    105609, -- Thok's Tail Tip
    112850, -- Thok's Tail Tip
    113408, -- Greka's Dentures
}
trinkets   [146285] = { -- Cruelty
    102308, -- Skeer's Bloodsoaked Talisman
    104636, -- Skeer's Bloodsoaked Talisman
    104885, -- Skeer's Bloodsoaked Talisman
    105134, -- Skeer's Bloodsoaked Talisman
    105383, -- Skeer's Bloodsoaked Talisman
    105632, -- Skeer's Bloodsoaked Talisman
    112913, -- Skeer's Bloodsoaked Talisman
}
trinkets   [146296] = { -- Celestial Celerity
    103689, -- Alacrity of Xuen
    103989, -- Alacrity of Xuen
}
trinkets   [146308] = { -- Dextrous
    102292, -- Assurance of Consequence
    104476, -- Assurance of Consequence
    104725, -- Assurance of Consequence
    104974, -- Assurance of Consequence
    105223, -- Assurance of Consequence
    105472, -- Assurance of Consequence
    112947, -- Assurance of Consequence
    113024, -- "Reliable" Threat Assessor
}
trinkets   [146310] = { -- Restless Agility
    102311, -- Ticking Ebon Detonator
    104616, -- Ticking Ebon Detonator
    104865, -- Ticking Ebon Detonator
    105114, -- Ticking Ebon Detonator
    105363, -- Ticking Ebon Detonator
    105612, -- Ticking Ebon Detonator
    112879, -- Ticking Ebon Detonator
}
trinkets   [146312] = { -- Celestial Master
    103686, -- Discipline of Xuen
    103986, -- Discipline of Xuen
}
trinkets   [146314] = { -- Titanic Restoration
    102299, -- Prismatic Prison of Pride
    104478, -- Prismatic Prison of Pride
    104727, -- Prismatic Prison of Pride
    104976, -- Prismatic Prison of Pride
    105225, -- Prismatic Prison of Pride
    105474, -- Prismatic Prison of Pride
    112948, -- Prismatic Prison of Pride
}
trinkets   [146317] = { -- Restless Spirit
    102309, -- Dysmorphic Samophlange of Discontinuity
    104619, -- Dysmorphic Samophlange of Discontinuity
    104868, -- Dysmorphic Samophlange of Discontinuity
    105117, -- Dysmorphic Samophlange of Discontinuity
    105366, -- Dysmorphic Samophlange of Discontinuity
    105615, -- Dysmorphic Samophlange of Discontinuity
    112877, -- Dysmorphic Samophlange of Discontinuity
}
trinkets   [146323] = { -- Inward Contemplation
    103688, -- Contemplation of Chi-Ji
    103988, -- Contemplation of Chi-Ji
}
trinkets   [146343] = { -- Avoidance
    102296, -- Rook's Unlucky Talisman
    104442, -- Rook's Unlucky Talisman
    104691, -- Rook's Unlucky Talisman
    104940, -- Rook's Unlucky Talisman
    105189, -- Rook's Unlucky Talisman
    105438, -- Rook's Unlucky Talisman
    112476, -- Rook's Unlucky Talisman
}
trinkets   [146344] = { -- Defensive Maneuvers
    103690, -- Resolve of Niuzao
    103990, -- Resolve of Niuzao
}
trinkets   [146395] = { -- Tactician
    102307, -- Curse of Hubris
    104649, -- Curse of Hubris
    104898, -- Curse of Hubris
    105147, -- Curse of Hubris
    105396, -- Curse of Hubris
    105645, -- Curse of Hubris
    112924, -- Curse of Hubris
}
consumables[146555] = 102351 -- Drums of Rage
consumables[146939] = 103557 -- Enduring Elixir of Wisdom
consumables[147055] = 103641 -- Singing Crystal
consumables[147226] = 103642 -- Book of the Ages
consumables[147412] = 104111 -- Elixir of Wandering Spirits
consumables[147476] = 103643 -- Dew of Eternal Morning
consumables[147643] = 104038 -- Cursed Swabby Helmet
consumables[148238] = 104196 -- Consume Ogre Queasine <= Delectable Ogre Queasine
consumables[148361] = 103683 -- Mask of Anger
consumables[148365] = 103681 -- Mask of Doubt
consumables[148366] = 103679 -- Mask of Fear
consumables[148367] = 103680 -- Mask of Hatred
consumables[148368] = 103682 -- Mask of Violence
consumables[148385] = 102467 -- Censer of Eternal Agony
trinkets   [148388] = 103639 -- White Ash <= Pouch of White Ash
consumables[148429] = 102463 -- Fire-Watcher's Oath
trinkets   [148447] = 103678 -- Winds of Time <= Time-Lost Artifact
consumables[148528] = 104293 -- Scuttler's Shell
consumables[148529] = 104294 -- Rime of the Time-Lost Mariner
trinkets   [148534] = 104298 -- Ordon Death Chime
consumables[148537] = 104299 -- Falling Flame
consumables[148538] = 104302 -- Blackflame Daggers
consumables[148547] = 104303 -- Rain Stone
consumables[148548] = 104304 -- Blizzard Stone
consumables[148549] = 104305 -- Ashen Stone
consumables[148550] = 104306 -- Sunset Stone
consumables[148553] = 104309 -- Eternal Kiln
trinkets   [148557] = 104313 -- Golden Moss Effect <= Golden Moss
consumables[148565] = 104316 -- Spectral Grog
consumables[148577] = 104318 -- Using Flyer Controller <= Crashin' Thrashin' Flyer Controller
trinkets   [148597] = 104321 -- Summon Crew of the Barnacle <= Captain Zvezdan's Lost Leg
consumables[148623] = 104328 -- Cauterizing Core
consumables[148626] = 104329 -- Furious Ashhide Mushan <= Ash-Covered Horn
consumables[148627] = { -- Warning Sign
    104330, -- Warped Warning Sign
    104331, -- Warning Sign
}
consumables[148732] = 104335 -- Summon Spectral Brewmaster <= Thick Pi'jiu Brew
consumables[148733] = 104336 -- Summon Spectral Windwalker <= Bubbling Pi'jiu Brew
consumables[148734] = 104334 -- Summon Spectral Mistweaver <= Misty Pi'jiu Brew
consumables[148773] = 104346 -- Golden Glider
trinkets   [148896] = { -- Ferocity
    102302, -- Sigil of Rampage
    104584, -- Sigil of Rampage
    104833, -- Sigil of Rampage
    105082, -- Sigil of Rampage
    105331, -- Sigil of Rampage
    105580, -- Sigil of Rampage
    112825, -- Sigil of Rampage
}
trinkets   [148897] = { -- Extravagant Visions
    102303, -- Frenzied Crystal of Rage
    104576, -- Frenzied Crystal of Rage
    104825, -- Frenzied Crystal of Rage
    105074, -- Frenzied Crystal of Rage
    105323, -- Frenzied Crystal of Rage
    105572, -- Frenzied Crystal of Rage
    112815, -- Frenzied Crystal of Rage
}
trinkets   [148899] = { -- Tenacious
    102295, -- Fusion-Fire Core
    104463, -- Fusion-Fire Core
    104712, -- Fusion-Fire Core
    104961, -- Fusion-Fire Core
    105210, -- Fusion-Fire Core
    105459, -- Fusion-Fire Core
    111547, -- Grondo's Spare Eye
    112503, -- Fusion-Fire Core
    113025, -- External Combustion Engine
}
trinkets   [148903] = { -- Vicious
    102301, -- Haromm's Talisman
    104531, -- Haromm's Talisman
    104780, -- Haromm's Talisman
    105029, -- Haromm's Talisman
    105278, -- Haromm's Talisman
    105527, -- Haromm's Talisman
    112754, -- Haromm's Talisman
}
trinkets   [148906] = { -- Toxic Power
    102300, -- Kardris' Toxic Totem
    104544, -- Kardris' Toxic Totem
    104793, -- Kardris' Toxic Totem
    105042, -- Kardris' Toxic Totem
    105291, -- Kardris' Toxic Totem
    105540, -- Kardris' Toxic Totem
    112768, -- Kardris' Toxic Totem
    113023, -- Foolproof Targeting Mechanism
    118230, -- Smoldering Cerulean Stone
}
trinkets   [148908] = { -- Mark of Salvation
    102294, -- Nazgrim's Burnished Insignia
    104553, -- Nazgrim's Burnished Insignia
    104802, -- Nazgrim's Burnished Insignia
    105051, -- Nazgrim's Burnished Insignia
    105300, -- Nazgrim's Burnished Insignia
    105549, -- Nazgrim's Burnished Insignia
    112778, -- Nazgrim's Burnished Insignia
}
trinkets   [148911] = { -- Soothing Power
    102304, -- Thok's Acid-Grooved Tooth
    104611, -- Thok's Acid-Grooved Tooth
    104860, -- Thok's Acid-Grooved Tooth
    105109, -- Thok's Acid-Grooved Tooth
    105358, -- Thok's Acid-Grooved Tooth
    105607, -- Thok's Acid-Grooved Tooth
    112849, -- Thok's Acid-Grooved Tooth
}
consumables[149023] = 104314 -- Dragon P.I.E.
consumables[149026] = 101616 -- Test 2 <= Noodle Soup
consumables[149228] = 103685 -- Celestial Defender <= Celestial Defender's Medallion
consumables[149511] = 104039 -- Blackrock Blasting Powder
consumables[151085] = { -- Binding Talismans
    107272, -- Frostwolf First-Fang
    107273, -- Snow Hare's Foot
}
consumables[154111] = 108422 -- Blackrock Crucible
consumables[154694] = 108631 -- Inferno Tonk Controller
consumables[154696] = 108635 -- Driller Tonk Controller
consumables[154697] = 108633 -- Doomshredder Tonk Controller
consumables[154698] = 108634 -- Exterminator Tonk Controller
consumables[154699] = 108632 -- Painbringer Tonk Controller
consumables[154919] = 108683 -- Summon Mini Dark Portal <= Miniature Dark Portal
consumables[155042] = 108735 -- Arena Master's War Horn
trinkets   [155447] = 108902 -- Armored Elekk Tusk
consumables[156064] = 109153 -- Greater Draenic Agility Flask
consumables[156070] = 109147 -- Draenic Intellect Flask
consumables[156071] = 109148 -- Draenic Strength Flask
consumables[156073] = 109145 -- Draenic Agility Flask
consumables[156074] = 109151 -- Draenor Armor Flask
consumables[156079] = 109155 -- Greater Draenic Intellect Flask
consumables[156080] = 109156 -- Greater Draenic Strength Flask
consumables[156084] = 109160 -- Greater Draenic Stamina Flask
consumables[156136] = 109184 -- Stealth Field <= Stealthman 54
consumables[156423] = 109217 -- Draenic Agility Potion
consumables[156426] = 109218 -- Draenic Intellect Potion
consumables[156428] = 109219 -- Draenic Strength Potion
consumables[156430] = 109220 -- Draenic Armor Potion
consumables[156432] = { -- Draenic Channeled Mana Potion
    109221, -- Draenic Channeled Mana Potion
    118262, -- Brilliant Dreampetal
}
consumables[156436] = 109222 -- Draenic Mana Potion
consumables[156438] = 117415 -- Healing Tonic <= Smuggled Tonic
consumables[156445] = 109226 -- Draenic Rejuvenation Potion
consumables[156779] = 109599 -- Neural Silencer
consumables[158031] = 110274 -- Jawless Skulker Bait
consumables[158034] = 110289 -- Fat Sleeper Bait
consumables[158035] = 110290 -- Blind Lake Sturgeon Bait
consumables[158036] = 110291 -- Fire Ammonite Bait
consumables[158037] = 110292 -- Sea Scorpion Bait
consumables[158038] = 110293 -- Abyssal Gulper Eel Bait
consumables[158039] = 110294 -- Blackwater Whiptail Bait
consumables[158474] = 110424 -- Savage Safari Hat
consumables[158484] = 110426 -- Goblin Hot Potato
consumables[160093] = 110586 -- Mysterious Flowers <= Mysterious Flower
consumables[160178] = 111357 -- Summon Dwarven Mortar Team <= Mortarer's Whistle
consumables[160434] = 111403 -- Alchemist's Cauldron
consumables[160688] = 108743 -- Smoldering Boots <= Deceptia's Smoldering Boots
consumables[160748] = 111522 -- Exceptional Alcohol <= Tikari & K.A.Y.T.
trinkets   [160818] = { -- Rapid Corrosion
    111533, -- Corrosive Tongue of Reeg'ak
    118229, -- Resonant Hidecrystal of the Gorger
}
consumables[161255] = 111603 -- First Aid <= Antiseptic Bandage
consumables[161495] = 111842 -- Star Root Tuber
consumables[162367] = { -- Convert to Garrison Resources
    101436, -- Icemother Milk
    113388, -- Shadowmoon Astrologer's Almanac
}
consumables[162402] = 108739 -- Shiny Pearl <= Pretty Draenor Pearl
consumables[162796] = 112269 -- Alchemist's Cauldron Test
trinkets   [162913] = 112317 -- Visions of the Future <= Winged Hourglass
trinkets   [162915] = 112318 -- Spirit of the Warlords <= Skull of War
trinkets   [162917] = 112319 -- Strength of Steel <= Knight's Badge
trinkets   [162919] = 112320 -- Nightmare Fire <= Sandman's Pouch
consumables[163199] = 112338 -- Fortitude <= Runescroll of Fortitude IV
trinkets   [163766] = 111554 -- Rimefrost Guardian <= Rimefrost Fetish
consumables[165185] = 113096 -- Bloodclaw Charm <= Bloodmane Charm
trinkets   [165485] = { -- Mastery
    109997, -- Kihra's Adrenaline Injector
    114369, -- Tormented Fang of Gore
}
trinkets   [165531] = { -- Haste
    110002, -- Fleshrender's Meathook
    114366, -- Tormented Tooth of Ferocity
}
trinkets   [165532] = { -- Critical Strike
    110007, -- Voidmender's Shadowgem
    110012, -- Bonemaw's Big Toe
}
trinkets   [165534] = { -- Versatility
    110017, -- Enforcer's Stun Grenade
    114368, -- Tormented Insignia of Dreams
}
trinkets   [165535] = { -- Mastery
    110008, -- Tharbek's Lucky Pebble
    110018, -- Kyrak's Vileblood Serum
}
trinkets   [165540] = 114367 -- Critical Strike <= Tormented Emblem of Flame
trinkets   [165542] = 109998 -- Multi-Strike <= Gor'ashan's Lodestone Spike
trinkets   [165543] = { -- Versatility
    110003, -- Ragewing's Firefang
    110013, -- Emberscale Talisman
    114370, -- Tormented Seal of Fortitude
}
trinkets   [165822] = { -- Haste
    109999, -- Witherbark's Branch
    110014, -- Spores of Alacrity
    114430, -- Munificent Bonds of Fury
    118779, -- Bladespike Charm
}
trinkets   [165824] = { -- Mastery
    110019, -- Xeri'tac's Unhatched Egg Sac
    113663, -- Petrified Flesh-Eating Spore
    114429, -- Munificent Censer of Tranquility
    118776, -- Talisman of the Invader
    118778, -- Ironmender's Totem
    118780, -- Bloodburn Protector
}
trinkets   [165825] = { -- Item - Attacks Proc Mastery
    110019, -- Xeri'tac's Unhatched Egg Sac
    113663, -- Petrified Flesh-Eating Spore
    114429, -- Munificent Censer of Tranquility
    118776, -- Talisman of the Invader
    118778, -- Ironmender's Totem
    118780, -- Bloodburn Protector
}
trinkets   [165830] = { -- Critical Strike
    114427, -- Munificent Emblem of Terror
    118777, -- Bloodcaster's Charm
}
trinkets   [165832] = 110004 -- Multistrike <= Coagulated Genesaur Blood
trinkets   [165833] = { -- Versatility
    110009, -- Leaf of the Ancient Protectors
    114428, -- Munificent Orb of Ice
    114431, -- Munificent Soul of Compassion
}
consumables[166592] = 113375 -- Vindicator's Armor Polish Kit
consumables[167262] = 112087 -- Obsidian Frostwolf Petroglyph
consumables[167268] = 113540 -- Ba'ruun's Bountiful Bloom
consumables[167273] = 113542 -- Whispers of Rai'Vosh
trinkets   [167362] = 108903 -- Tiny Iron Star
consumables[167724] = 113991 -- Iron Trap
consumables[167839] = 113631 -- Hypnotize Critter <= Hypnosis Goggles
consumables[167865] = 113670 -- Moan of Murmur <= Mournful Moan of Murmur
consumables[168154] = 114128 -- Increase Level <= Balanced Weapon Enhancement
consumables[168155] = 114129 -- Increase Level <= Striking Weapon Enhancement
consumables[168157] = 114131 -- Increase Level <= Power Overrun Weapon Enhancement
consumables[168223] = 114124 -- Invisibility <= Phantom Potion
consumables[168224] = 114125 -- Preserved Discombobulator Ray
consumables[168232] = { -- Summon Disposable Pocket Flying Machine
    114126, -- Disposable Pocket Flying Machine
    118109, -- Disposable Pocket Flying Machine
}
consumables[168339] = 114225 -- Craft Trinket <= Forgotten Apexis Trinket
consumables[168459] = 114629 -- Summon <= Proximity Alarm-o-Bot 2000
consumables[168657] = 114227 -- Bubble Wand
consumables[168697] = 114835 -- Rooby Reat
consumables[169291] = 111476 -- Stolen Breath
consumables[169356] = 114982 -- Pure Songflower Serenade <= Song Flower
consumables[169454] = 115009 -- Improved Iron Trap
consumables[169464] = 116122 -- Burning Legion Missive
consumables[169692] = 115291 -- Whole Pot-Roasted Elekk
consumables[169697] = 115300 -- Marinated Elekk Steak
consumables[169701] = 115302 -- Seasoned Elekk Ribeye
consumables[170221] = 115466 -- Elemental Fragment
consumables[170293] = 115468 -- Frosty <= Permanent Frost Essence
trinkets   [170397] = { -- Rapid Adaptation
    115495, -- Primal Gladiator's Badge of Adaptation
    115496, -- Primal Gladiator's Badge of Adaptation
    115521, -- Primal Combatant's Badge of Adaptation
    117773, -- Tournament Gladiator's Badge of Adaptation
    117774, -- Tournament Gladiator's Badge of Adaptation
}
consumables[170398] = 115501 -- Kowalski's Music Box
consumables[170403] = 115498 -- Ashran Health Potion <= Ashran Healing Tonic
consumables[170406] = 115499 -- Personal Rocket Courier
consumables[170407] = { -- Summon Disposable Pocket Flying Machine
    115500, -- Disposable Pocket Flying Machine
    118110, -- Disposable Pocket Flying Machine
}
consumables[170425] = 115506 -- Treessassin's Guise
consumables[170453] = 116396 -- LeBlanc's Recorder
consumables[170526] = 115530 -- Paint Target <= N.U.K.U.L.A.R. Target Painter
consumables[170530] = 115531 -- Swirling Ashran Potion
consumables[170591] = 115795 -- S.O.S. Flare <= S.O.S. Relief Flare
consumables[170593] = 115793 -- S.O.S. Flare <= S.O.S. Relief Flare
trinkets   [170612] = 116154 -- Summon Peons/Lumberjacks Master <= Barov Lumberjack Caller
consumables[170788] = 116067 -- Ring of Broken Promises
consumables[170833] = 116113 -- Breath of Talador
consumables[170839] = 116114 -- Magma Crawler Illusion <= Prestige Card: The Turn
consumables[170869] = 116115 -- Blazing Wings
consumables[170895] = 116119 -- Ango'rosh Sorcerer Stone
consumables[170908] = 116120 -- Tasty Talador Lunch
consumables[170937] = 119157 -- Saberon Cat-Sip
consumables[170950] = 116139 -- Haunted <= Haunting Memento
consumables[170978] = 116138 -- Draw <= Last Deck of Nemelex Xobeh
consumables[171164] = 116163 -- Massage Table
consumables[171234] = 116456 -- Scroll of Storytelling
consumables[171245] = 116412 -- Scroll of Invisibility <= Scroll of Mass Invisibility
consumables[171247] = 116413 -- Scroll of Town Portal
consumables[171249] = 116411 -- Scroll of Protection
consumables[171250] = 116410 -- Scroll of Speed
consumables[171253] = 110560 -- Garrison Hearthstone
consumables[171352] = 115503 -- Molten Path <= Blazing Diamond Pendant
consumables[171366] = 117016 -- Arcane Prison <= Wand of Arcane Imprisonment
consumables[171513] = 116414 -- 6.0 Pet Battles - Pet Supplies <= Pet Supplies
consumables[171549] = 116435 -- Midsummer Bonfire <= Cozy Bonfire
consumables[171554] = 116440 -- Burning Defender <= Burning Defender's Medallion
consumables[171567] = 116442 -- Spirit of Vengeance <= Vengeful Spiritshard
consumables[171571] = 116452 -- Spring-loaded Spike Trap
consumables[171573] = 116444 -- Spirit of Sorrow <= Forlorn Spiritshard
consumables[171574] = 116443 -- Spirit of Peace <= Peaceful Spiritshard
consumables[171575] = 116445 -- Spirit of Anxiety <= Anxious Spiritshard
consumables[171607] = { -- Love Ray
    116648, -- Manufactured Love Prism
    116651, -- True Love Prism
}
consumables[171722] = 117014 -- Wand of Neutralization
consumables[171723] = 117015 -- Wand of Mana Stealing
consumables[171725] = 117013 -- Wand of Lightning Shield
consumables[171760] = 116757 -- Steamworks Sausage Grill
consumables[171761] = 116758 -- Brewfest Banner
consumables[171772] = 118190 -- Blixthraz Cannon <= Blixthraz's Frightening Grudgesolver
consumables[171775] = 116689 -- Pineapple Lounge Cushion
consumables[171776] = 116692 -- Fuzzy Green Lounge Cushion
consumables[171779] = 116691 -- Zhevra Lounge Cushion
consumables[171780] = 116690 -- Safari Lounge Cushion
consumables[171782] = 116763 -- Crashin' Thrashin' Shredder Controller
consumables[171958] = 116828 -- Exquisite Lich King Costume <= Exquisite Costume Set: "The Lich King"
consumables[172027] = 116856 -- Blooming Rose <= "Blooming Rose" Contender's Costume
consumables[172047] = 116889 -- Purple Phantom <= "Purple Phantom" Contender's Costume
consumables[172049] = 116890 -- Santo's Sun <= "Santo's Sun" Contender's Costume
consumables[172052] = 116888 -- Night Demon <= "Night Demon" Contender's Costume
consumables[172053] = 116891 -- Snowy Owl <= "Snowy Owl" Contender's Costume
consumables[172160] = 116925 -- Free Action <= Vintage Free Action Potion
consumables[172368] = 116979 -- Blackwater Anti-Venom
consumables[172376] = 116981 -- Fire Ammonite Oil
consumables[172413] = 116986 -- Pitch Tent <= Fine Blue and Gold Tent
consumables[172445] = 116984 -- Frost Wyrm Egg
consumables[172501] = 116987 -- Pitch Tent <= Fine Blue and Purple Tent
consumables[172502] = 116988 -- Pitch Tent <= Fine Blue and Green Tent
consumables[172503] = 116989 -- Pitch Tent <= Ironskin Tent
consumables[172504] = 116990 -- Pitch Tent <= Outcast's Tent
consumables[172505] = 116991 -- Pitch Tent <= Enchanter's Tent
consumables[172507] = 116992 -- Pitch Tent <= Savage Leather Tent
consumables[172508] = 116993 -- Pitch Tent <= Archmage's Tent
consumables[172510] = 116995 -- Pitch Tent <= Sturdy Tent
consumables[172511] = 116996 -- Pitch Tent <= Crusader's Tent
consumables[172512] = 116997 -- Pitch Tent <= Blood Elven Tent
consumables[172513] = 116998 -- Pitch Tent <= High Elven Tent
consumables[172514] = 117000 -- Pitch Tent <= Deathweaver's Hovel
consumables[172515] = 117001 -- Pitch Tent <= Patchwork Hut
consumables[172516] = 117002 -- Pitch Tent <= Elune's Retreat
consumables[172517] = 117003 -- Pitch Tent <= Orgrimmar's Reach
consumables[172518] = 117004 -- Pitch Tent <= Simple Tent
consumables[172519] = 117005 -- Pitch Tent <= Distressingly Furry Tent
consumables[172520] = 117006 -- Pitch Tent <= Ornate Alliance Tent
consumables[172521] = 117007 -- Pitch Tent <= Ornate Horde Tent
consumables[172522] = 117008 -- Pitch Tent <= Voodoo Doctor's Hovel
consumables[172523] = 117009 -- Pitch Tent <= Nomad's Spiked Tent
consumables[172548] = 116999 -- Scroll of Replenishment
consumables[172641] = 117381 -- Wand of Death
consumables[172644] = 117389 -- Draenor Archaeologist's Lodestone
consumables[172645] = 117390 -- Draenor Archaeologist's Map
trinkets   [172691] = 117402 -- Shadow Reflector <= Ultra-Electrified Reflector
trinkets   [172693] = 117403 -- Frostfire Reflector <= Gyro-Radiant Reflector
consumables[172694] = 117401 -- Reading <= Nat's Draenic Fishing Journal
trinkets   [172775] = 117438 -- Net Launcher <= Gnomish Net Launcher
consumables[172809] = 117573 -- Ignite Bonfire <= Wayfarer's Bonfire
consumables[173102] = 117550 -- Bees! BEES! BEEEEEEEEEEES! <= Angry Beehive
consumables[173125] = 117569 -- AUGH <= Giant Deathweb Egg
consumables[173260] = 118006 -- Shieldtronic Shield
trinkets   [173519] = 114958 -- Lingering Spirit <= Watch Commander Branson's Lapel
trinkets   [173793] = 118199 -- Poison Cask
trinkets   [173834] = 118211 -- ROLKOR SMASH <= Rolkor's Rage
consumables[173893] = 118221 -- Petrify Critter <= Petrification Stone
consumables[173895] = 118222 -- Spirit of Bashiok
consumables[173910] = 118224 -- Ogre Brewing Kit
consumables[173930] = 118236 -- Throw Coin <= Counterfeit Coin
consumables[173956] = 118244 -- Iron Horde Pirate Costume <= Iron Buccaneer's Hat
trinkets   [173983] = 118246 -- Nagrand Wolf Guardian <= Call of the Wolfmother
consumables[174004] = 113543 -- Spirit of Shinri
consumables[174018] = 118278 -- Pale Vision Potion
consumables[174062] = 118275 -- Well Fed <= Perfect Nagrand Cherry
consumables[174077] = 118274 -- Well Fed <= Perfect Fuzzy Pear
consumables[174078] = 118277 -- Well Fed <= Perfect Ironpeel Plantain
consumables[174079] = 118273 -- Well Fed <= Perfect O'ruk Orange
consumables[174080] = 118276 -- Well Fed <= Perfect Greenskin Apple
consumables[174551] = 118416 -- Fish Roe
consumables[174650] = 118425 -- Nesingwary's Lost Horn
consumables[174662] = 118426 -- Scroll of Invoke Yu'lon, the Jade Serpent
consumables[174707] = 118428 -- Legion Chili
consumables[174862] = 118512 -- Cooked Ashran Piranha Fish <= Savory Savage Delight
consumables[175021] = 118544 -- Test Flask
consumables[175215] = 118576 -- Savage Feast
consumables[175513] = 118427 -- Autographed Hearthstone Card
consumables[175604] = 118662 -- Ascend to Bladespire <= Bladespire Relic
trinkets   [175725] = 118677 -- Frostwolf <= Howl of the Frostwolf
trinkets   [175733] = 118680 -- Paladin Protector <= Tranquility of the Exarchs
trinkets   [175735] = 118682 -- Saberon Bodyguard <= Saberon Protector
trinkets   [175737] = 118683 -- The Thumper <= Portable Goon Squad
trinkets   [175739] = 118684 -- Laughing Skull Berserker <= Maniacal Grimace
trinkets   [175741] = 118685 -- Sha'tari Golem <= Sha'tari Protector
trinkets   [175753] = 118690 -- Mr. Pinchies <= Empty Crawdad Trap
consumables[175767] = 118697 -- 6.0 Pet Battles - Pet Supplies (Bulging) <= Big Bag of Pet Supplies
consumables[175771] = 118698 -- Wings of the Outcasts
consumables[175790] = 116266 -- Draenic Swiftness Potion
consumables[175817] = 116276 -- Draenic Living Action Potion
consumables[175821] = 118704 -- Pure Rage <= Pure Rage Potion
consumables[175833] = 116268 -- Invisibility <= Draenic Invisibility Potion
consumables[175841] = 118711 -- Draenic Water Walking <= Draenic Water Walking Elixir
consumables[175887] = 118727 -- Acquire Treasure Map: Frostfire <= Frostfire Treasure Map
consumables[175894] = 118728 -- Acquire Treasure Map: Shadowmoon Valley <= Shadowmoon Valley Treasure Map
consumables[175895] = 118729 -- Acquire Treasure Map: Gorgrond <= Gorgrond Treasure Map
consumables[175896] = 118730 -- Acquire Treasure Map: Talador <= Talador Treasure Map
consumables[175897] = 118731 -- Acquire Treasure Map: Spires of Arak <= Spires of Arak Treasure Map
consumables[175898] = 118732 -- Acquire Treasure Map: Nagrand <= Nagrand Treasure Map
consumables[175914] = 118736 -- Captain's Whistle
consumables[176049] = 118897 -- Miner's Coffee
consumables[176057] = 118900 -- Grob's Fancy Brew <= Hol'bruk's Brutal Brew
consumables[176059] = 118904 -- Unleashed Mania
consumables[176061] = 118903 -- Preserved Mining Pick
consumables[176107] = { -- Brawler's Draenic Agility Potion
    118910, -- Brawler's Draenic Agility Potion
    118913, -- Brawler's Bottomless Draenic Agility Potion
}
consumables[176108] = { -- Brawler's Draenic Intellect Potion
    118911, -- Brawler's Draenic Intellect Potion
    118914, -- Brawler's Bottomless Draenic Intellect Potion
}
consumables[176109] = { -- Brawler's Draenic Strength Potion
    118912, -- Brawler's Draenic Strength Potion
    118915, -- Brawler's Bottomless Draenic Strength Potion
}
consumables[176114] = { -- Brawler's Healing Tonic
    118916, -- Brawler's Healing Tonic
    118917, -- Brawler's Bottomless Healing Tonic
}
consumables[176151] = 118922 -- Whispers of Insanity <= Oralius' Whispering Crystal
consumables[176160] = 118935 -- Bloom <= Ever-Blooming Frond
trinkets   [176166] = 118936 -- Summon Voidcaller <= Manual of Void-Calling
consumables[176179] = 118937 -- Gamon's Heroic Spirit <= Gamon's Braid
consumables[176180] = 118938 -- Duplicate Millhouse <= Manastorm's Duplicator
consumables[176212] = 119001 -- Mystery Keg
consumables[176274] = 119003 -- Void Totem
consumables[176282] = 119093 -- Aviana's Feather
consumables[176310] = 119039 -- Lilian's Warning Sign
consumables[176438] = 119092 -- Moroes' Famous Polish
consumables[176457] = 119083 -- Throw Apple <= Fruit Basket
trinkets   [176460] = 118884 -- Kyb's Foolish Perseverance
consumables[176594] = 119144 -- Touch of the Naaru
consumables[176595] = 119145 -- Firefury Totem
consumables[176602] = 119151 -- Soulgrinder
consumables[176665] = 119159 -- Happy Fun Skull
consumables[176681] = 119163 -- Soul Inhale <= Soul Inhaler
consumables[176706] = 119156 -- Summon Shattrath Defense Crystal <= Portable Shattrath Defense Crystal
consumables[176750] = 119178 -- Black Whirlwind
consumables[176759] = 119180 -- Goren "Log" Roller
consumables[176762] = 119179 -- Iron Star Roller
consumables[176766] = 119183 -- Risky Recall <= Scroll of Risky Recall
consumables[176785] = 119182 -- Soulsaver <= Soul Evacuation Crystal
trinkets   [176873] = 113905 -- Turnbuckle Terror <= Tablet of Turnbuckle Teamwork
trinkets   [176874] = 113969 -- Convulsive Shadows <= Vial of Convulsive Shadows
trinkets   [176875] = 113835 -- Void Shards <= Shards of Nothing
trinkets   [176876] = 113834 -- Vision of the Cyclops <= Pol's Blinded Eye
trinkets   [176878] = 113931 -- Lub-Dub <= Beating Heart of the Mountain
trinkets   [176879] = 113842 -- Caustic Healing <= Emblem of Caustic Healing
trinkets   [176881] = 114491 -- Turbulent Emblem
trinkets   [176882] = 114489 -- Turbulent Focusing Crystal
trinkets   [176883] = 114488 -- Turbulent Vial of Toxin
trinkets   [176884] = 114490 -- Turbulent Relic of Mendacity
trinkets   [176885] = 114492 -- Turbulent Seal of Defiance
trinkets   [176903] = 118877 -- Fizzlebang's Folly
trinkets   [176914] = 118879 -- Everblooming Thorny Hibiscus
trinkets   [176917] = 118875 -- Pajeet-Nov's Perpetual Puzzle
trinkets   [176928] = 118883 -- Bronzed Elekk Statue
trinkets   [176935] = 114613 -- Formidable Fang
trinkets   [176937] = 114614 -- Formidable Relic of Blood
trinkets   [176939] = 114610 -- Formidable Jar of Doom
trinkets   [176941] = 114611 -- Formidable Orb of Putrescence
trinkets   [176943] = 114612 -- Formidable Censer of Faith
trinkets   [177035] = 118114 -- Meaty Dragonspine Trophy
trinkets   [177038] = 113612 -- Balanced Fate <= Scales of Doom
trinkets   [177040] = 113645 -- Tectus' Heartbeat <= Tectus' Beating Heart
trinkets   [177042] = 119193 -- Screaming Spirits <= Horn of Screaming Spirits
trinkets   [177046] = 119194 -- Howling Soul <= Goren Soul Repository
trinkets   [177051] = 113948 -- Instability <= Darmac's Unstable Talisman
trinkets   [177053] = 113861 -- Gazing Eye <= Evergaze Arcane Eidolon
trinkets   [177056] = 113893 -- Blast Furnace <= Blast Furnace Door
trinkets   [177060] = 119192 -- Squeak Squeak <= Ironspike Chew Toy
trinkets   [177063] = 113889 -- Elemental Shield <= Elementalist's Shielding Talisman
trinkets   [177067] = 113985 -- Detonation <= Humming Blackiron Trigger
trinkets   [177081] = 113984 -- Molten Metal <= Blackiron Micro Crucible
trinkets   [177086] = 113986 -- Sanitizing <= Auto-Repairing Autoclave
trinkets   [177096] = 113983 -- Forgemaster's Vigor <= Forgemaster's Insignia
trinkets   [177102] = 113987 -- Battering <= Battering Talisman
trinkets   [177189] = 118882 -- Sword Technique <= Scabbard of Kyanos
trinkets   [177592] = 118880 -- Whisper of Spirits <= Everburning Candle
trinkets   [177594] = 118878 -- Sudden Clarity <= Copeland's Clarity
trinkets   [177597] = 118876 -- "Lucky" Flip <= Lucky Double-Sided Coin
consumables[177938] = 109739 -- Star Chart
consumables[178408] = 115505 -- LeBlanc's Recorder
trinkets   [178422] = 117391 -- Summon the Brewmaiden <= Bubbliest Brightbrew Charm

LibStub('LibItemBuffs-1.0'):__UpgradeDatabase(version, trinkets, consumables, enchantments)
