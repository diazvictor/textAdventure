--[[--
 @package   textAdventure
 @module    game.lua
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

--- verifico si un item existe en la habitación actual
-- @tparam string param nombre del item a verificar
-- @treturn table item existente en la habitación
-- @usage local item = game.getobj(param)
-- if item then
--     if item.pickup and item.pickup() then
--         return
--     end
--     if item.name and item.description then
--         player.addItem(item)
--         room.current.objects[param] = nil
--         text.parser('Has cogido ' .. (item.description:lower() or param))
--     else
--         excuses:take_excuses()
--     end
-- else
--     excuses:take_excuses()
-- end
function game.getobj(param)
	local item = (room.current.objects[param] or room.current.look_in[param])
	if item then
		return item
	end
end

--- verifico si un item existe en el inventario
-- @tparam string param nombre del item a verificar
-- @treturn table item existente en el inventario
-- @treturn number indíce del item
-- @usage local item = game.getinvobj(param)
-- if item then
--     if item.putdown and item.putdown() then
--         return
--     end
--     player.removeItem(item.name)
--     room.current.objects[param] = item
--     print('He dejado ese objeto aquí.')
-- else
--     print('No puedo soltar algo que no tengo.')
-- end
function game.getinvobj(param)
	for i, item in pairs(player.inventory) do
		if item.name == param then
			return item, i
		end
	end
end

--- retorna el ultimo valor de una tabla
local function getendvalue(t)
	t = t or {}
	for k,v in pairs(t) do
		endk = k
		endv = v
	end
	return endk, endv
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

function game.actions.help_syn()
	print('Simplemente, escribe lo que quieras hacer')
end

function game.actions.goto_syn(param)
	local newroomdir = room.current.exits[param]
	if not newroomdir then
		for _,v in pairs(room.current.exits) do
			if v == param or v.target then
				newroomdir = v
				break
			end
		end
	end
	if newroomdir then
		local newroom = room.all[newroomdir] or room.all[newroomdir.target]
		if newroomdir.locked then
			if newroomdir.excuse then
				text.parser(newroomdir.excuse)
			else
				print("No puedes ir por ahí.")
			end
			return
		elseif newroom:enter() then
			return
		end
		room.current = newroom
		room.info()
	else
		excuses:goto_excuses()
	end
end

function game.actions.look_syn(param)
	local item = game.getobj(param)
	local invitem = game.getinvobj(param)

	if item then
		if item.look and item.look() then --veto if pickup() returns true
			return
		end
		if item.object then
			text.parser(item.excuse)
			return
		else
			text.parser(item.message or item.description or item)
		end
	elseif invitem then
		text.parser(invitem.description or invitem)
	else
		excuses:look_excuses()
	end
end

function game.actions.take_syn(param)
	local item = game.getobj(param)
	if item then
		if item.pickup and item.pickup() then --veto if pickup() returns true
			return
		end
		if item.take_again then
			player.addItem(item)
			room.current.objects[param] = nil
			print('Listo. Ya lo tengo de nuevo en mi poder.')
			return
		end
		if item.name and item.description then
			player.addItem(item)
			room.current.objects[param] = nil
			for k,v in pairs(room.current.look_in) do
				if type(v) == 'table' then
					v.object = nil
				end
			end
			text.parser('Has cogido ' .. (item.description:lower() or param))
		else
			excuses:take_excuses()
		end
	else
		excuses:take_excuses()
	end
end

function game.actions.drop_syn(param)
	local item = game.getinvobj(param)
	if item then
		if item.putdown and item.putdown() then --veto if pickup() returns true
			return
		end
		player.removeItem(item.name)
		room.current.objects[param] = item
		room.current.objects[param]['take_again'] = true
		print('He dejado ese objeto aquí.')
	else
		print('No puedo soltar algo que no tengo.')
	end
end

function game.actions.inventory_syn()
	player.getItems()
end

function game.actions.quit_syn()
	ok = game.confirm(
		'Seguro que deseas salir ? [si/no]',
		{'si','no'}
	)
	if ok == true then
		game.running = false
		print('Goodbye!')
	else
		print('Entiendo.')
	end
end

function game.actions.exits_syn()
	local t = {}
    for k,_ in pairs(room.current.exits) do
        table.insert(t, k) -- inserto los valores de la tabla "room.current.exits" en la tabla "t"
    end
    local endKey,endValue = getendvalue(t) -- recojo el ultimo valor de la tabla "t"
    local msg
    if #t > 1 then
        msg = 'Las salidas posibles son '
    else
        msg = 'Sólo hay una salida posible: '
    end
    print(msg .. table.concat(t,', '):gsub(', %w+$',' y ' .. endValue))
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
