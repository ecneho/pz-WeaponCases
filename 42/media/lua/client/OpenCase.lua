Rifles  = {}
Pistols = {}

local function contains(tbl, val)
    for _, v in ipairs(tbl) do
        if v == val then
            return true
        end
    end
    return false
end

function GetWeaponDataOnInitWorld()
    Rifles  = {}
    Pistols = {}

    local items = ScriptManager.instance:getAllItems()

    for i = 0, items:size() - 1 do
        --- @type Item
        local item = items:get(i)
        local name = item:getFullName();

        if not contains(ModPoolBlacklist, item:getModID()) then
            --- Weapons with weight exceeding 3kg are considered rifles.
            if item:isRanged() or contains(ItemPoolWhitelist, name) then
                if not contains(ItemPoolBlacklist, name) then
                    if (item:getActualWeight() > 3) then
                        table.insert(Rifles, name)
                    else
                        table.insert(Pistols, name)
                    end
                end
            end
        end
    end
end

Events.OnInitWorld.Add(GetWeaponDataOnInitWorld)

--- @return HandWeapon | nil
function RollWeapon(fromTable)
    local result = nil
    if (#fromTable > 0) then
        result = instanceItem(fromTable[ZombRand(#fromTable)+1])
    end
    return result
end

function FillWeaponCase(container, fromTable)
    local weapon = RollWeapon(fromTable)
    if weapon ~= nil and weapon ~= "" then
        local mag = weapon:getMagazineType()
        if mag ~= nil and mag ~= "" then
            local amount = ZombRand(3) + 1
            for _ = 1, amount do
                container:AddItem(mag)
            end
        end
        container:AddItem(weapon)
    end
end

function UnlockPistolCase_OnCreate(recipeData, _)
    local result = recipeData:getAllCreatedItems():get(0);
    local container = result:getInventory()
    FillWeaponCase(container, Pistols)
end

function UnlockRifleCase_OnCreate(recipeData, _)
    local result = recipeData:getAllCreatedItems():get(0);
    local container = result:getInventory()
    FillWeaponCase(container, Rifles)
end