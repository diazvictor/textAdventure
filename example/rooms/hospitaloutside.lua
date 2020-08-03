--[[
 @package   textAdventure/example
 @filename  hospitaloutside.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      24.06.2020 13:17:13 -04
]]--

hospitaloutside = room:new('hospitaloutside', {
	description = 'Una gran <b>edificación</b> se eleva desde el <b>suelo</b>. Se trata del\nedificio principal de lo que parece el hospital del lugar.\nEl local principal parece estar cerrado, aunque al <b>sur</b> se\npuede acceder a una pequeña zona que permanece abierta.\nVarios <b>matojos</b> y <b>arbustos</b> pueblan la zona.',
	exits = {
		norte = 'oldtown',
        sur = {
			locked = true,
			excuse = 'Las puertas están cerradas con llave, no puedo abrirlas.',
			target = 'hospitalcorridor'
		},
        este = 'streetold'
	},
	objects = {nota = nota},
	look = {
		['descampado'] = 'Un árido <b>descampado</b> que parece pertenecer a las inmediaciones\ndel <b>hospital</b>. La vegetación crece por estas zonas e incluso\nse adhiere a la <b>pared</b> del <b>hospital</b>.',
		['edificacion'] = 'El <b>edificio</b> es alto y parece antiguo. No obstante, y como otras\npartes del pueblo, parece no coincidir con la época.',
		['suelo'] = {
			object = 'nota',
			message = 'El <b>suelo</b> está lleno de <b>arbustos</b> y <b>matojos</b>.',
			excuse = 'El <b>suelo</b> está lleno de <b>arbustos</b> y <b>matojos</b>. Aquí hay una pequeña <b>nota</b>.'
		},
		['matojos'] = 'Grandes extensiones de <b>hierbas</b>, probablemente de crecimiento\nacelerado debido a las lluvias.',
		['hierba'] = 'No... No es de ese tipo...',
		['ventana'] = 'Varias ventanas y balcones, idénticas entre sí, se apilan una\nconsecutiva a la otra...',
		['pared'] = 'La <b>pared</b> tiene una <b>hoja</b> pegada. Es una noticia sobre un accidente.',
		['hoja'] = {
			on_look = function ()
				player.score = player.score + 5
			end,
			message = 'Accidente en el bosque de <b>Innocent Hill</b> y unas imagenes. Falta el resto de la noticia, sólo veo el titular y poco más...'
		}
	}
})

return hospitaloutside
