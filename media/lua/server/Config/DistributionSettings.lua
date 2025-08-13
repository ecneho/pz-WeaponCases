-- This config supports VS Code annotations! Variables display hints when hovered over.

---@class SpawnConfig
---@field rolls number                   # Amount of passes over the item list.
---@field maxItems number                # Max possible amount of spawned items.
---@field items SpawnItem[]              # List of items with spawn rules.

---@class SpawnItem                      # Entry for the spawnable item. To disable certain spawns simply remove or comment them in the SpawnConfig.
---@field Name string                    # **Required**. Full item ID. Modded modules require prefix (e.g. "ModdedModule.ItemName").<br> "Base.*" is optional for vanilla items as long as there are no duplicates.
---@field Chance number                  # **Required**. Spawn chance as a float from range [0, 1].<br> (0 = 0%, 0.5 = 50%, 1 = 100%).
---@field RoomType string|string[]?      # *Optional*. Internal room name(s). Uses a single string or an array object.<br> For reference check <a href="https://pzwiki.net/wiki/Room_definitions_and_item_spawns">room definitions and item spawns</a>.
---@field ContainerType string|string[]? # *Optional*. Internal container name(s). Uses a single string or an array object.<br> For reference check <a href="https://pzwiki.net/wiki/Room_definitions_and_item_spawns">room definitions and item spawns</a>.

--- Example of some variants of configuration entries.
--- SpawnConfig = {
---     rolls = 5,
---     maxItems = 3,
---     items = {
---         {
---             Name = "Base.item_1",
---             Chance = 0.1,
---             RoomType = {"kitchen", "livingroom"},
---             ContainerType = {"fridge", "cabinet"}
---         },
---         {
---             Name = "ModdedModule.item_2",
---             Chance = 0.25,
---             RoomType = "bedroom",
---             ContainerType = "dresser"
---         },
---         {
---             Name = "item_3",
---             Chance = 0.05
---         }
---     }
--- }

local chance = 0.01                                         --- General spawn chance value to minimize excess code.
local rooms = {                                             --- General array for rooms to minimize excess code.
    "gunstorestorage", "gunstore", "armysurplus", "armytent",
    "SurvivorCache1", "SurvivorCache2", "SurvivorCacheBigBuilding",
    "SafehouseLoot", "SafehouseLoot_Late", "SafehouseLoot_Mid",
    "hunting", "pawnshopstorage", "prisonstorage"
}
local containers = nil                                      --- Container types are unused, but can be added if needed.<br> e.g. {"container1", "container2", "container3"}

--- Distribution configuration.
---@type SpawnConfig
SpawnConfig = {
    rolls = 3,
    maxItems = 1,
    items = {
        { Name = "caseItems.riflecaseClosed",             Chance = chance, RoomType = rooms, ContainerType = containers },
        { Name = "caseItems.pistolcaseClosed",            Chance = chance, RoomType = rooms, ContainerType = containers },
        { Name = "caseItems.grenadecase",                 Chance = chance, RoomType = rooms, ContainerType = containers },
        { Name = "caseItems.ammocrate",                   Chance = chance, RoomType = rooms, ContainerType = containers },
        { Name = "caseItems.ammobox",                     Chance = chance, RoomType = rooms, ContainerType = containers },
        { Name = "caseItems.junkbox",                     Chance = chance, RoomType = rooms, ContainerType = containers },
        { Name = "caseItems.weaponcrate",                 Chance = chance, RoomType = rooms, ContainerType = containers },
        { Name = "caseItems.signaliscase",                Chance = chance, RoomType = rooms, ContainerType = containers },
        { Name = "caseItems.riflecaseLocked",             Chance = chance, RoomType = rooms, ContainerType = containers },
        { Name = "caseItems.pistolcaseLocked",            Chance = chance, RoomType = rooms, ContainerType = containers }
    }
}