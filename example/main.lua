--[[
 @package	textAdventure/example
 @filename  main.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      10.06.2020 14:07:45 -04
]]--

package.path = package.path .. ';../?.lua;rooms/?.lua'
require 'textAdventure'
require 'conf'

require 'items'
streetold = require 'streetold'
tavern = require 'tavern'
hospitaloutside = require 'hospitaloutside'
hospitalcorridor = require 'hospitalcorridor'
prisonext = require 'prisonext'
oldtown = require 'oldtown'

room.current = streetold

game.run()
