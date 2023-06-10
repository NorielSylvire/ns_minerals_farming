# Noriel_Sylvire's Minerals Farming Module [![Made With Love](https://img.shields.io/badge/Made%20With-Love-orange.svg)](https://github.com/chetanraj/awesome-github-badges)
Version: 1.0

Copyright (c) 2020 Noriel_Sylvire (Flaviu E. Hongu)
Copyright (c) 2016 TenPlus1 (for the scythe registration code)

Licenses:
Code: LGPL 2.1
Textures: CC-BY-SA, CC-BY

Read license.txt for more information.

---

This is the farming module of the nsmc modpack. It contains the necessary code to automatically register hoes and, depending on the `farming` mod version, scythes.
This mod depends on the `ns_minerals_core` mod. Make sure you have it installed before proceeding.

---
## Changelog

* 1.2.1 - Changed the way the register_farming callback is registered for better debugging. Also callbacks before this change weren't registering properly. Now they work.
* 1.2 - Made the mod into a modpack. Since the code in this mod existed when the modpack was a mod, this mod carries the changelog of when it was a mod and not a modpack. Similarly, despite this version being the first where this is a mod inside a modpack, the version number is 1.2 so that it's clear this is more recent than 1.1.
* 1.1 - Improved API documentation and corrected spelling mistakes. Added compatibility with farming mod. Added working hoes and scythes. Added the ability to choose the `texture_brightness` while using custom textures for the tools that do not have custom textures. Changed `is_metal` from `crafting.lua` to `mineral.mineral_type == "metal"`. It was a legacy variable name from back in 2020, when this API was part of nsam mod. The incorrect name caused metal type minerals to not register recipes.
* 1.0 - Initial release: Automatic registration of tools, nodes, ores, craftitems and crafting recipes. Automatic generation of colorized textures for ALL the items from premade grayscale textures shipped with the API.

---
## API Documentation

In order to use the API, you must create a mod that depends on `ns_minerals_core`, and also have this mod installed.
Do not make a mod that depends on `ns_minerals_farming`!

Depending on `ns_minerals_farming` is only done within the nsmc modpack, if you want to create an addon that expands on this mod's functionality.

If you, instead, want to use the nsmc modpack for your mod, you only need to make your mod depend on the `ns_minerals_core` mod. By doing that, you access the functionality of all the mods in the nsmc modpack!

---
### Methods

All of the methods implemented by this API are contained within a table named `nsmc` so that you don't have to type in the full name of the mod, which is `ns_minerals_core` every time you want to call a method.

Example of how to call a method:
```lua
nsmc.register_minerals("mymod", {{}})
```
The above code is functional and will result in one mineral named `"mymod1mineral"` added to the game, complete with tools, nodes, ore generation and textures. The textures will all be white.
All the methods contained in this mod, when given a blank mineral with no values, will default everything to the same values as `farming` mod iron hoes and scythes.

---
### nsmc.register_farming_tools(modname, mineral)
Parameters:
* modname: a `string` value. This must be the name of your mod.
* mineral: a `mineral` table. This must be a `mineral` table containing everything needed to register your mineral. See MINERAL TABLE for more information.

This method defaults blank values and registers the crafting recipes for hoes and scythes.

---
### nsmc.register_hoe(modname, mineral)
Parameters:
* modname: a `string` value. This must be the name of your mod.
* mineral: a `mineral` table. This must be a `mineral` table containing everything needed to register your mineral. See MINERAL TABLE for more information.

This method registers your mineral's hoe.

---
### nsmc.register_scythe(modname, mineral)
Parameters:
* modname: a `string` value. This must be the name of your mod.
* mineral: a `mineral` table. This must be a `mineral` table containing everything needed to register your mineral. See MINERAL TABLE for more information.

This method registers your mineral's scythe.

---
### Tables and Data Structures

---
### toolname, tool table
Default: Same values as all the default iron tools

`toolname` can be one of:
* `hoe`
* `scythe`

This table can contain a `colorize`, `texture_handle`, `texture_head`, `uses` sub-members. If one or more of these is left out, they will take the default values (same values as the iron tools).

---
### colorize, bool
Default: `true`

Whether or not the head/blade texture of the tool will be colorized. I sugest you don't touch this unless you give your own, already colorized texture.

---
### texture_handle, string
Default: `texture_brightness` + `"_"` + tool type + `"handle"`

This is the texture used as the tool's handle.

---
### texture_handle, string
Default: `texture_brightness` + `"_"` + tool type + `"head"`/`"blade"`

This texture will be overlayed on top of the handle. It normally is just the head or blade of the tool.

---
### uses, int
Default: Same as the equivalent iron tool

Number of uses the tool has.
Remember that a tool loses exponentially less uses the greater the difference between the tool's `maxlevel` and the node's tier is. See [my Guide on how to understand tool and node parameters and how to add new tiers of ore](https://forum.minetest.net/viewtopic.php?t=27811) for a more detailed explanation.

