--[[
 @package   textAdventure
 @filename  excuses.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      24.06.2020 00:13:12 -04
]]--

math.randomseed(os.time())
excuses = {}

excuses.LOOK_EXCUSES = {
	"¿Qué mire el qué?",
	"No veo nada aquí, ni en mi inventario, parecido a eso.",
	"No sé a qué te refieres exactamente...",
	"¿Qué mire QUÉ?",
	"Erhm... ¿Qué dices que quieres que mire?",
	"No se exactamente a que te refieres..."
}

excuses.TAKE_EXCUSES = {
	"¿Que coja el qué? No veo como me podría ayudar eso.",
	"Mejor no.",
	"Olvídalo.",
	"No sé a qué cosa te refieres...",
	"No veo eso que dices.",
	"¿Qué? No me llevaré eso a ninguna parte."
}

excuses.GOTO_EXCUSES = {
	"No puedo ir en esa dirección.",
	"No hay ninguna salida hacia allá.",
	"No hay salida en esa dirección.",
	"Por ahí no hay salida.",
	"No hay salida hacia allá.",
	"No puedo. Para ver las direcciones posibles, escribe: salidas."
}

excuses.NONICK_EXCUSES = {
	"Siento como si no fuera nadie...",
	"Algo me impide hablar.",
	"Creo que primero debería averiguar quien soy...",
	"Escribe: nickname [nombre] para comenzar a jugar",
	"¿Y si elijo un nombre para representarme?"
}

local function construct(t)
    endv = game.getendvalue(t)
	if not endv then return end
	local random = math.random(1, endv)
	for i,v in pairs(t) do
		if random == i then
			print(v)
		end
	end
end

function excuses.take_excuses()
	construct(excuses.TAKE_EXCUSES)
end

function excuses.look_excuses()
	construct(excuses.LOOK_EXCUSES)
end

function excuses.goto_excuses()
	construct(excuses.GOTO_EXCUSES)
end

function excuses.nonick_excuses()
	construct(excuses.NONICK_EXCUSES)
end

return excuses