--[[--
 @package	textAdventure
 @module	room.lua
 @version   1.0
 @autor     Díaz Urbaneja Víctor Eduardo Diex
 @date      23.06.2020 15:15:15 -04
]]

local function newobject(class, name, table)
	local t = table or {}
	local name = name or #class.all
	setmetatable(t, {__index = class})
	class.all[name] = t
	t.name = name
	return t
end

room = {all = {}, enter = function () end , description = '', current = nil}

--- Crea una localicación/habitación
-- @tparam string name nombre de la localicación
-- @tparam table t valores de la localicación
-- @treturn table tabla con todos los valores de t
-- @usage hospitaloutside = room:new('hospitaloutside', {
--     description = 'Una gran <b>edificación</b> se eleva desde el <b>suelo</b>. Se trata del\nedificio principal de lo que parece el hospital del lugar.\nEl local principal parece estar cerrado, aunque al <b>sur</b> se\npuede acceder a una pequeña zona que permanece abierta.\nVarios <b>matojos</b> y <b>arbustos</b> pueblan la zona.',
--     exits = {
--         norte = 'oldtown',
--         sur = {
--             locked = true,
--             excuse = 'Las puertas están cerradas con llave, no puedo abrirlas.',
--             target = 'oldtown'
--         },
--         este = 'streetold'
--     },
--     objects = {llave = llave},
--     look_in = {
--         ['descampado'] = 'Un árido <b>descampado</b> que parece pertenecer a las inmediaciones\ndel <b>hospital</b>. La vegetación crece por estas zonas e incluso\nse adhiere a la <b>pared</b> del <b>hospital</b>.',
--         ['edificacion'] = 'El <b>edificio</b> es alto y parece antiguo. No obstante, y como otras\npartes del pueblo, parece no coincidir con la época.',
--         ['suelo'] = 'El <b>suelo</b> está lleno de <b>arbustos</b> y <b>matojos</b>. Aquí hay una pequeña <b>nota</b>.',
--         ['matojos'] = 'Grandes extensiones de <b>hierbas</b>, probablemente de crecimiento\nacelerado debido a las lluvias.',
--         ['hierba'] = 'No... No es de ese tipo...',
--         ['ventana'] = 'Varias ventanas y balcones, idénticas entre sí, se apilan una\nconsecutiva a la otra...',
--         ['pared'] = 'La <b>pared</b> tiene una <b>hoja</b> pegada. Es una noticia sobre un accidente.',
--         ['hoja'] = 'Accidente en el bosque de <b>Innocent Hill</b> y unas imagenes. Falta el resto de la noticia, sólo veo el titular y poco más...'
--     }
-- })
function room:new(name, t)
	newobject(self, name, t)
	t.exits = t.exits or {}
	t.objects = t.objects or {}
	t.look_in = t.look_in or {}
	return t
end

--- Imprime en pantalla la description de la localidad actual
function room.info()
	text.parser(room.current.description)
end

object = {all = {}}
--- Crea un objeto/item
-- @tparam string name nombre del objeto
-- @tparam table t valores del objeto
-- @treturn table tabla con todos los valores de t
-- @usage llave = object:new("llave", {
--     description = "Una pequeña <b>llave</b> roja.",
--     pickup = function ()
--         room.all.hospitaloutside.exits.sur.locked = false
--     end,
--     putdown = function ()
--         room.all.hospitaloutside.exits.sur.locked = true
--     end
-- })
function object:new(name, t)
	newobject(self, name, t)
	-- t.action = t.action or {}
	return t
end

return room