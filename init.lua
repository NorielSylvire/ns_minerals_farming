--[[
Minerals Farming Module by Noriel_Sylvire.
This module implements and registers callbacks for automatically
registering hoes and scythes for the farming mod.

Copyright (c) 2020-2023 Noriel_Sylvire.

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

Contact Noriel_Sylvire via private message on the Minetest Forum:
https://forum.minetest.net/memberlist.php?mode=viewprofile&u=24116
or any of my social media attached to my Minetest Forum profile,
such as GitHub: https://github.com/NorielSylvire
or Twitter: https://twitter.com/Noriel_Sylvire
--]]

nsmc.farming_version = 1.2

local default_path = minetest.get_modpath("ns_minerals_farming")

dofile(default_path.."/tools.lua")

function nsmc.register_farming(modname, mineral)
	
	mineral.hoe = mineral.hoe or {}
	mineral.hoe.colorize = mineral.hoe.colorize or nslib.tern(mineral.hoe.texture ~= nil, false, true)
	mineral.hoe.texture_handle = mineral.hoe.texture_handle or "hoe_handle"
	mineral.hoe.texture_head = mineral.hoe.texture_head or mineral.texture_brightness.."_hoe_head"
	mineral.hoe.uses = mineral.hoe.uses or 200
	
	mineral.scythe = mineral.scythe or {}
	mineral.scythe.colorize = mineral.scythe.colorize or nslib.tern(mineral.scythe.texture ~= nil, false, true)
	mineral.scythe.texture_handle = mineral.scythe.texture_handle or "scythe_handle"
	mineral.scythe.texture_head = mineral.scythe.texture_head or mineral.texture_brightness.."_scythe_head"
	mineral.scythe.uses = mineral.scythe.uses or 250
	
	nsmc.register_hoe(modname, mineral)
	nsmc.register_scythe(modname, mineral)
end

nsmc.register_callback(nsmc.register_farming, "register_farming")
