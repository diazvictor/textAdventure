--[[--
 @package	textAdventure
 @module	text.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      12.06.2020 01:14:02 -04
]]

text = {}
local colors = {
    black = '\27[30m',
    red = '\27[31m',
    green = '\27[32m',
    yellow = '\27[33m',
    blue = '\27[34m',
    magenta = '\27[35m',
    cyan = '\27[36m',
    white = '\27[37m'
}
--- Imprime en pantalla (message) parseado para la consola
-- @tparam string message cadena de texto que desee parsear
-- @usage --[[
--   etiquetas disponibles:
--   b - negrita
--   i - cursiva
--   u - subrayado
--   s - tachado
--   blink - parpadeante
--   span - si se coloca el atributo bg='red' el color de fondo del texto será rojo
-- ]]--
-- text.parser('<b>texto en negritas</b>')
function text.parser(message)
	local str = message
	if str:match('<b>(.-)</b>') then
		message = message:gsub('<b>','\27[1m'):gsub('</b>', '\27[0m')
	end
	if str:match('<i>(.-)</i>') then
		message = message:gsub('<i>','\27[3m'):gsub('</i>', '\27[0m')
	end
	if str:match('<u>(.-)</u>') then
		message = message:gsub('<u>','\27[4m'):gsub('</u>', '\27[0m')
	end
	if str:match('<s>(.-)</s>') then
		message = message:gsub('<s>','\27[9m'):gsub('</s>', '\27[0m')
	end
	if str:match('<blink>(.-)</blink>') then
		message = message:gsub('<blink>','\27[5m'):gsub('</blink>', '\27[0m')
	end
	if str:match('<span bg="(.-)">(.-)</span>') then
		local color, content = str:match('<span bg="(.-)">(.-)</span>')
		if (color ~= '') then
			for k, ascii_color in pairs(colors) do
				if (color == k) then
					message = message:gsub('<span bg="'.. color ..'">', ascii_color):gsub('</span>', '\27[0m')
				end
			end
		else
			message = message:gsub('<span bg="'.. color ..'">', ''):gsub('</span>', '\27[0m')
		end
	end
	print(message)
end

return text
