--[[
 @package   textAdventure/example
 @filename  prisonext.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      24.06.2020 13:24:37 -04
]]--

prisonext = room:new('prisonext', {
	description = 'Estás en la parte trasera de un gran <b>castillo</b>.\nVarias <b>puertas</b> gigantes y reforzadas impiden la entrada al recinto.\nLos <b>muros</b>, también muy sólidos se mantienen firmes ante\ntu presencia. Algunos <b>escombros</b> de <b>muros</b> independientes al\n<b>castillo</b> están derruidos por un lado.',
	exits = {
        oeste = 'streetold'
	},
	objects = {},
	look = {
		['parte trasera'] = 'Algunos fragmentos de un <b>muro</b> independiente al <b>castillo</b>\ndescansan a lo <b>lejos</b>.',
		['suelo'] = 'Hay una zona, pegada al <b>muro</b> en la que la tierra parece blanda.',
		['puerta'] = 'Las <b>puertas</b> son grandes y sólidas. Imposibles de abrir o derribar sin sus llaves.',
		['muro'] = 'Los <b>muros</b> caídos se extienden a lo <b>lejos</b> en un montón de <b>escombros</b>.\nDe poca importancia tuvo que ser el <b>muro</b>, ya que no parece del\nmismo material que el <b>castillo</b>.',
		['escombro'] = 'Los <b>escombros</b> formados de bloque y <b>restos</b> de piedra.',
		['castillo'] = 'El <b>castillo</b> impresiona, aunque quizás desde otro lugar se pueda\nver mejor y entrar a él.',
		['tierra'] = 'La <b>tierra</b> parece bastante blanda. Si le echo algo de <b>agua</b> será más manipulable...',
		['restos'] = 'Trozos de piedra inservible. Una buena limpieza\nharía falta por aquí... Lástima que no me traje la <b>escoba</b>...',
		['escoba'] = 'He dicho que no me traje la <b>escoba</b>... ¡A qué te pongo a barrer a ti!'
	}
})

return prisonext
