--[[
 @package   textAdventure/example
 @filename  oldtown.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      24.06.2020 17:02:46 -04
]]--

oldtown = room:new('oldtown',{
	description = 'Estás en un <b>descampado</b>. Reina la tranquilidad y un ambiente\nlúgubre y desolado. El frio acecha en los rincones del lugar,\nmostrando un panorama inquietante.',
	exits = {
		sur = 'hospitaloutside',
		oeste = {
			locked = true,
			excuse = 'Me pierdo con facilidad en los bosques, mejor no adentrarme hasta saber a donde ir...',
			target = 'bosque'
		}
	},
	objects = {},
	look = {
		['descampado'] = 'Un lugar ampliamente deshabitado. A lo <b>lejos</b> puedes ver\nvarios <b>coches</b> y alguna <b>casa</b> con las <b>luces</b> encendidas,\nsin embargo, por esta zona, la <b>actividad</b> es nula.',
		['casa'] = 'Construcciones normales... Nada demasiado destacable.\nParecen estar en un punto medio entre la construcción de\nciudad tradicional y las <b>casas</b> de pueblo.',
		['coches'] = 'Veo varios vehículos aparcados a lo <b>lejos</b>, cerca de las <b>casas</b>.\nSupongo que serán de sus habitantes. No veo a nadie dentro.',
		['lejos'] = '¿Tan lejos? No alcanzo a ver...',
		['luz'] = 'Pocas, pero alguna casa tiene luz encendida.',
		['actividad'] = 'Pues eso, nula.',
		['ruedas'] = 'Marca <b>ACME</b>... Tengo buena vista, ¿verdad?'
	}
})

return oldtown
