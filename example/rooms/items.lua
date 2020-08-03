--[[--
@package   textAdventure/example
@filename  items.lua
@version   1.0
@author    Díaz Urbaneja Víctor Eduardo Diex
@date      09.07.2020 15:34:52 -04
--]]

llave = object:new("llave", {
	description = "Una pequeña <b>llave</b> roja.",
	on_pickup = function ()
		room.all.hospitaloutside.exits.sur.locked = false
	end,
	on_putdown = function ()
		room.all.hospitaloutside.exits.sur.locked = true
	end
})

nota = object:new("nota", {
	description = "Una pequeña nota. Parece un pedazo recortado de la prensa.",
	on_pickup = function ()
		player.score = player.score + 5
	end
})
