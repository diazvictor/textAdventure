--[[--
 @package   textAdventure
 @filename  game.lua
 @version   1.6
 @autor     Díaz Urbaneja Víctor Eduardo Diex
 @date      23.06.2020 15:20:00 -04
]]

game = {}
game.running = true
game.state = "intro"

game.actions = {}
game.verbs = {
	drop_syn = {
		'drop (.+)'
	},
	goto_syn = {
		"go (.+)"
	},
	help_syn = {
		'help'
	},
	look_syn = {
		'look (.+)'
	},
	take_syn = {
		'take (.+)'
	},
	inventory_syn = {
		'inventory'
	},
	exit_syn = {
		'exit'
	},
	exits_syn = {
		'exits'
	}
}

function game.doaction(action, param)
	game.actions[action](param)
end

function parse(text)
	local text = text:lower()
	for action,valids in pairs(game.verbs) do
		for i,valid in ipairs(valids) do
			local result = string.match(text, valid)
			if result then
				game.doaction(action, result)
				return
			end
		end
	end
end

return game
