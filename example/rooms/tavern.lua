--[[--
@package    textAdventure/example
@filename  tavern.lua
@version   1.0
@author    Díaz Urbaneja Víctor Eduardo Diex
@date      23.06.2020 16:41:45 -04
--]]

tavern = room:new('tavern', {
	description = 'Estás en el interior de la <b>taberna</b> <i>La mansión de Caloire</i>.\nLa <b>madera</b> predomina en el lugar. El ambiente es muy cálido.\nSin embargo, está completamente vacío. Las <b>sillas</b> se mantienen\nordenadas en sus respectivos sitios, sin embargo, el lugar no\nparece hacer justicia a su entorno. Varias estanterías repletas\nde <b>bebidas</b> a lo largo de la <b>barra</b>.',
	exits = {
		norte = "streetold"
	},
	objects = {llave = llave},
	look = {
		['taberna'] = 'Lo cierto es que es un lugar agradable.\nPor primera vez me siento más descansado\nen este <b>pueblo</b>.',
		['suelo'] = 'El piso está hecho de tablones de <b>madera</b>.',
		['madera'] = 'Materia prima de este lugar.',
		['sillas'] = 'Varias <b>sillas</b> acompañan a cada <b>mesa</b> que existe\nrepartida por la <b>taberna</b>.',
		['mesa'] = 'Las <b>mesas</b> están completamente despejadas. La <b>madera</b> brilla.',
		['barra'] = {
			object = 'llave',
			message = 'La <b>barra</b> permanece limpia de objetos.\nSolo algunos ceniceros descansan por ciertos\nextremos.',
			excuse = 'La <b>barra</b> permanece limpia de objetos.\nSolo algunos ceniceros descansan por ciertos\nextremos. Aquí hay una <b>llave</b>.'
		},
		['estanterías'] = 'Hay varias <b>bebidas</b> en la estantería...\nAl parecer la que más se consume es el <b>grog</b>.',
		['bebidas'] = 'Vino, Whiskey y Grog.',
		['lamparas'] = 'Emiten la suficiente luz para iluminar la <b>taberna</b>.',
		['tablones'] = 'Tablones de <b>madera</b>. En buen estado.',
		['ceniceros'] = 'Limpios, sin una colilla... Junto a uno de ellos\nhay un <b>panfleto</b>.',
		['grog'] = {
			on_look = function ()
				player.score = player.score + 5
			end,
			message = 'Jou Jou Jou... Y una botella de <b>Grog</b>...'
		},
		['caja'] = 'Hay un billete... Pero es del <i>Monopoly</i>...',
		['panfleto'] = 'El panfleto dice: <i>Reena Laux</i>, periodista.',
		['caja'] = 'Hay un billete... Pero es del <i>Monopoly</i>...',
	}
})

return tavern
