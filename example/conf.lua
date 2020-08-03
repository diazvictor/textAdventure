--[[
 @package   textAdventure/example
 @filename  conf.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      10.07.2020 03:44:55 -04
]]--

game.name = 'Innocent Hill\n'

game.description = [[
Lorem ipsum dolor sit amet, consectetur adipisicing elit,
sed doeiusmod tempor incididunt ut labore et dolore
magna aliqua. Ut enimad minim veniam, quis nostrud
exercitation ullamco laboris nisi utaliquip ex ea commodo
consequat. Duis aute irure dolor inreprehenderit in voluptate
velit esse cillum dolore eu fugiat nullapariatur.
]]

game.verbs = {
	drop_syn = {
		'soltar la (.+)','dejar la (.+)',
		'soltar el (.+)','dejar el (.+)',
		'soltar (.+)','dejar (.+)'
	},
	goto_syn = {
		"ir al (.+)","andar al (.+)",
		"caminar al (.+)","ir (.+)","ir hasta el (.+)",
		"andar hasta el (.+)","caminar hasta el (.+)",
		"andar (.+)","caminar (.+)"
	},
	help_syn = {
		'ayuda','ayudame','?'
	},
	look_syn = {
		'mirar la (.+)','mirar las (.+)','mirar los (.+)',
		'mirar el (.+)','mirar (.+)',
		'examinar la (.+)','examinar las (.+)','examinar los (.+)',
		'examinar el (.+)','examinar (.+)',
		'mirar','examinar'
	},
	take_syn = {
		'tomar la (.+)','tomar las (.+)',
		'coger la (.+)','coger las (.+)',
		'tomar el (.+)','coger el (.+)',
		'tomar un (.+)','coger un (.+)',
		'tomar una (.+)','coger una (.+)',
		'tomar (.+)','coger (.+)'
	},
	use_syn = {
		'usar (.+)','usar la (.+)',
		'usar el (.+)', 'usar las (.+)'
	},
	inventory_syn = {
		'inventario','inv'
	},
	quit_syn = {
		'salir'
	},
	exits_syn = {
		'salidas'
	}
}

function game.actions.use_syn(param)
	print('Mejor no uso ' .. param)
end
