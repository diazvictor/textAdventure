--[[--
 @package   textAdventure
 @module	game.lua
 @version   1.6
 @autor     Díaz Urbaneja Víctor Eduardo Diex
 @date      23.06.2020 15:20:00 -04
]]

game = {}
game.running = true
game.state = "intro"

--- dialogo de confirmación
-- @tparam string title titulo del dialogo
-- @tparam table question tabla con las respuestas esperadas
-- @treturn boolean true si la primera respuesta es confirmada
-- @treturn[1] boolean false si la segunda respuesta es confirmada
-- @usage ok = game.confirm(
--     'Seguro que deseas salir ? [si/no]',
--     {'si','no'}
-- )
-- if ok == true then
--     game.running = false
--     print('Gracias por jugar!')
-- else
--     print('Entiendo. Sal del juego solo cuando estes seguro, no me hagas perder el tiempo!')
-- end
function game.confirm(title, question)
	text.parser(title)
	question = question or {}
	while true do
		input = io.read()
		if input == question[1] then
			return true
		elseif input == question[2] then
			return false
		end
	end
end

game.actions = {}
game.verbs = {
	drop_syn = {
		'soltar (.+)'
	},
	goto_syn = {
		"ir (.+)"
	},
	help_syn = {
		'ayuda'
	},
	look_syn = {
		'mirar (.+)'
	},
	take_syn = {
		'tomar (.+)'
	},
	inventory_syn = {
		'inventario'
	},
	quit_syn = {
		'salir'
	},
	exits_syn = {
		'salidas'
	}
}

function game.actions.help_syn(param)
	print('Simplemente, escribe lo que quieras hacer')
end

function game.actions.goto_syn(param)
	excuses:goto_excuses()
end

function game.actions.look_syn(param)
	excuses:look_excuses()
end

function game.actions.take_syn(param)
	excuses:take_excuses()
end

function game.actions.drop_syn(param)
	print('No puedo dejar algo que no tengo')
end

function game.actions.inventory_syn()
	print('No llevo nada encima.')
end

function game.actions.quit_syn()
	print('Gracias por jugar!')
	game.running = false
end

function game.actions.exits_syn()
	print('No hay ninguna salida disponible en este momento.')
end

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

function game.run()
	while (game.running == true) do
		if not room.current then room.current = select(2, next(room.all)) end
		if not room.current then print("No se han cargado localidades/habitaciones. Saliendo...") return end
		if game.state == 'intro' then
			if game.name then text.parser(game.name) end
			if game.description then text.parser(game.description) end
			text.parser('Presione la tecla [ENTER] para continuar.')
			io.read()
			room.info()
			game.state = 'play'
		elseif game.state == 'play' then
			print()
			input = io.read()
			print()
			res = parse(input)
		end
	end
end

return game
