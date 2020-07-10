--[[
 @package   textAdventure
 @filename  excuses.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      24.06.2020 00:13:12 -04
]]--

math.randomseed(os.time())
excuses = {}

function excuses:take_excuses()
	local random = math.random(1,6)
	if random == 1 then
		print('¿Que coja el qué? No veo como me podría ayudar eso.')
	elseif random == 2 then
		print('Mejor no.')
	elseif random == 3 then
		print('Olvídalo.')
	elseif random == 4 then
		print('No sé a qué cosa te refieres...')
	elseif random == 5 then
		print('No veo eso que dices.')
	elseif random == 6 then
		print('¿Qué? No me llevaré eso a ninguna parte.')
	end
end

function excuses:look_excuses()
	local random = math.random(1,6)
	if random == 1 then
		print('Qué mire el qué?')
	elseif random == 2 then
		print('No veo nada aquí, ni en mi inventario, parecido a eso.')
	elseif random == 3 then
		print('No sé a qué te refieres exactamente...')
	elseif random == 4 then
		print('Qué mire QUÉ?')
	elseif random == 5 then
		print('Erhm... ¿Qué dices que quieres que mire?')
	elseif random == 6 then
		print('No se exactamente a que te refieres...')
	end
end

function excuses:goto_excuses()
	local random = math.random(1,6)
	if random == 1 then
		print('No puedo ir en esa dirección.')
	elseif random == 2 then
		print('No hay ninguna salida hacia allá.')
	elseif random == 3 then
		print('No hay salida en esa dirección.')
	elseif random == 4 then
		print('Por ahí no hay salida.')
	elseif random == 5 then
		print('No hay salida hacia allá.')
	elseif random == 6 then
		print('No puedo. Para ver las direcciones posibles, escribe: salidas.')
	end
end

function excuses:nonick_excuses()
	local random = math.random(1,5)
	if random == 1 then
		print('Siento como si no fuera nadie...')
	elseif random == 2 then
		print('Algo me impide hablar.')
	elseif random == 3 then
		print('Creo que primero debería averiguar quien soy...')
	elseif random == 4 then
		print('Escribe: nickname [nombre] para comenzar a jugar')
	elseif random == 5 then
		print('¿Y si elijo un nombre para representarme?')
	end
end

return excuses