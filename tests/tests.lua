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

package.path = package.path .. ";./wowmock/?.lua"
local LuaUnit = require('luaunit')
local mockagne = require('mockagne')
local wowmock = require('wowmock')

local lib, G

local function setup()
	G = mockagne:getMock()
	G.LibStub = false
	lib = wowmock("../LibItemBuffs-1.0.lua", G)
end

local function dataprovider(self, name, ...)
	local method = self[name]
	self[name] = nil
	for i = 1, select('#', ...) do
		local args = select(i, ...)
		self[name.."_"..i] = function()
			return method(self, unpack(args))
		end
	end
end

testUpgradeDatabase = { setup = setup, dataprovider = dataprovider }

function testUpgradeDatabase:test_update()
	lib:__UpgradeDatabase(10, {}, {}, {})
	assertEquals(lib:GetDatabaseVersion(), 10)
end

function testUpgradeDatabase:test_no_update()
	lib:__UpgradeDatabase(10, {}, {}, {})
	lib:__UpgradeDatabase(5, {}, {}, {})
	assertEquals(lib:GetDatabaseVersion(), 10)
end

testIsItemBuff = { setup = setup, dataprovider = dataprovider }

function testIsItemBuff:test_trinkets()
	lib:__UpgradeDatabase(10, {[20] = 10}, {}, {})
	assertEquals(lib:IsItemBuff(20), true)
end

function testIsItemBuff:test_consumables()
	lib:__UpgradeDatabase(10, {}, {[20] = 10}, {})
	assertEquals(lib:IsItemBuff(20), true)
end

function testIsItemBuff:test_enchantments()
	lib:__UpgradeDatabase(10, {}, {}, {[20] = 10})
	assertEquals(lib:IsItemBuff(20), true)
end

function testIsItemBuff:test_unknown()
	lib:__UpgradeDatabase(10, {}, {}, {})
	assertEquals(lib:IsItemBuff(20), false)
end

os.exit(LuaUnit:Run())
