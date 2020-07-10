--[[--
 @package	textAdventure
 @module  	player.lua
 @version   1.6
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      10.06.2020 14:07:45 -04
]]

player = {}
player.name = ''
player.hp = 100
player.score = 0
player.dead = false

player.inventory = {}

--- Imprime en pantalla los items del inventario
-- @treturn string imprime en pantalla un mensaje con los items del inventario
-- @treturn[1] string imprime en pantalla un mensaje sin los items
function player.getItems()
	if #player.inventory ~= 0 then
		print('Tengo los siguientes objetos en mi inventario:')
		for _, item in pairs(player.inventory) do
			print('* ' .. item.description)
		end
	else
		print('No llevo nada encima.')
	end
end

--- Añade un item al inventario
-- @tparam table item una tabla con los valores del item
-- @treturn number el número de items que contiene el inventario
-- @usage player.addItem({
--     name = 'llave',
--     description = 'Una llave roja',
--     pickup = function ()
--         print('Cogida.')
--     end,
--     putdown = function ()
--         print('Soltada.')
--     end
-- })
function player.addItem(item)
	item = item or {}
	table.insert(player.inventory, item)
	return #player.inventory
end

--- Verifica si un item existe en el inventario
-- @tparam string name nombre del item a verificar
-- @treturn bool true si el item existe
-- @treturn[1] bool false si el item no existe
-- @usage local ok = player.hasItem('llave')
-- if ok then
--     print('Tienes la llave en tu inventario')
-- else
--     print('No tienes la llave en tu inventario')
-- end
function player.hasItem(name)
	for _, item in pairs(player.inventory) do
		if name == item.name then
			return true
		end
	end
	return false
end

--- Remueve un item del inventario
-- @tparam string name nombre del item a remover
-- @treturn string si el item fue removido
-- @usage player.removeItem('llave')
function player.removeItem(name)
	for i, item in pairs(player.inventory) do
		if item.name == name then
			table.remove(player.inventory, i)
			return name
		end
	end
end

return player
