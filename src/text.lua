--[[--
 @package	textAdventure
 @module	text.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      12.06.2020 01:14:02 -04
]]

text = {}

--- Imprime en pantalla (message) parseado para la consola
-- @tparam string message cadena de texto que desee parsear
-- @return Imprime en pantalla el texto parseado
-- @usage --[[
--   etiquetas disponibles:
--   b - negrita
--   i - cursiva
--   u - subrayado
--   s - tachado
--   blink - parpadeante
-- ]]--
-- text.parser('<b>texto en negritas</b>')
function text.parser(message)
	if message:match('<b>(.-)</b>') then
		message = message:gsub('<b>','\27[1m'):gsub('</b>', '\27[0m')
	end
	if message:match('<i>(.-)</i>') then
		message = message:gsub('<i>','\27[3m'):gsub('</i>', '\27[0m')
	end
	if message:match('<u>(.-)</u>') then
		message = message:gsub('<u>','\27[4m'):gsub('</u>', '\27[0m')
	end
	if message:match('<s>(.-)</s>') then
		message = message:gsub('<s>','\27[9m'):gsub('</s>', '\27[0m')
	end
	if message:match('<blink>(.-)</blink>') then
		message = message:gsub('<blink>','\27[5m'):gsub('</blink>', '\27[0m')
	end
	print(message)
end

return text
