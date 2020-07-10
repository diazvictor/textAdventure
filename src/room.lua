--[[--
 @package	textAdventure
 @filename  room.lua
 @version   1.0
 @autor     Díaz Urbaneja Víctor Eduardo Diex
 @date      23.06.2020 15:15:15 -04
]]

local function newobject(class, name, table)
	local t = table or {}
	local name = name or #class.all
	setmetatable(t, {__index = class})
	class.all[name] = t
	t.name = name
	return t
end

room = {all = {}, description = '', current = nil}
function room:new(name, t)
	newobject(self, name, t)
	t.exits = t.exits or {}
	t.objects = t.objects or {}
	t.look_in = t.look_in or {}
	return t
end

function room.info()
	text.parser(room.current.description)
end

object = {all = {}}
function object:new(name, t)
	newobject(self, name, t)
	-- t.action = t.action or {}
	return t
end

return room