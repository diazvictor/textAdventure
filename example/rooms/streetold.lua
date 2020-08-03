--[[--
 @package	textAdventure/example
 @filename  streetold.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex
 @date      23.06.2020 15:12:49 -04
--]]

streetold = room:new('streetold', {
	description = 'Esta parece la zona más vieja del <b>pueblo</b>.\nVarias <b>casas</b> antiguas aparecen a lo largo de la calle, y\nsus <b>puertas</b>, cerradas. Algunas grandes <b>macetas</b> adornan la estancia.\nUn <b>poste</b> de madera sujeta un <b>cartel</b>.',
	exits = {
		sur = 'tavern',
        oeste = 'hospitaloutside',
        este = 'prisonext'
	},
	objects = {},
	look = {
		['casas'] = 'El aspecto de las <b>casas</b> es muy anticuado. La mayoría de las\n<b>puertas</b> están cerradas a cal y canto.',
		['suelo'] = 'El <b>suelo</b> deteriorado y lleno de baches, le da a la calle\nun aspecto ideal para atraer turistas... Lástima que esté tan deshabitado...',
		['cartel'] = 'Dice: <i>La mansión de Caloire</i>',
		['casas antiguas'] = 'Las <b>casas</b> parecen abandonadas o cerradas por alguna extraña razón... Es sobrecogedor...',
		['pared'] = 'Las paredes de las <b>casas</b> tienen surcos y parecen estar inacabadas.',
		['puertas'] = 'Las puertas de las <b>casas</b> están cerradas.',
		['macetas'] = 'Algunos <b>arbustos</b> y plantas en las diferentes <b>macetas</b>.',
		['poste'] = 'Un alto <b>poste</b> de madera que sujeta un <b>cartel</b> frente\na lo que parece una taberna.',
		['arbustos'] = 'Plantas que adornan la fachada de los distintos lugares de la calle.',
		['banco'] = 'Un <b>banco</b> de <b>madera</b>, tiene una <b>pintada</b>...',
		['pintada'] = {
			on_look = function ()
				player.score = player.score + 5
			end,
			message = 'Tiene un graffiti que pone: <i>Croatoan</i>',
		},
		['ventanas'] = '<b>Ventanas</b> cerradas. Como cuando en el oeste llega el temible\nforajido y todos es esconden... No veo a nadie...'
	}
})

return streetold
