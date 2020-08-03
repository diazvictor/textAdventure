--[[
 @package   textAdventure/example
 @filename  hospitalcorridor.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      10.07.2020 03:48:55 -04
]]--

hospitalcorridor = room:new('hospitalcorridor', {
	description = '',
	on_enter = function ()
		if player.score >= 10 then
			print('¡Has terminado la aventura!')
			print('BUEN FINAL')
			print('Felicidades, has finalizado este juego de ejemplo!')
			print(('Puntuación: %s'):format(player.score))
		else
			print('MAL FINAL')
			print('Oh, has finalizado este juego de ejemplo!')
			print(('Puntuación: %s'):format(player.score))
		end
		game.running = false
	end
})

return hospitalcorridor
