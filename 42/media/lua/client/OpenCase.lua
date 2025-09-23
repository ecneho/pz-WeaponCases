local function insertPool(from, to, condition)
    if condition then
        for _, item in ipairs(from) do
            table.insert(to, item)
        end
    end
end

--- @param container ItemContainer
function FillPistolCase(container)
    local combinedPool = {}

    insertPool(PistolCasePoolVanilla, combinedPool, SandboxVars.WeaponCases.PoolVanillaEnabled or false)
    insertPool(PistolCasePool93, combinedPool, SandboxVars.WeaponCases.Pool93Enabled           or false)
    insertPool(PistolCasePoolBrita, combinedPool, SandboxVars.WeaponCases.PoolBritaEnabled     or false)
    insertPool(PistolCaseVFE, combinedPool, SandboxVars.WeaponCases.PoolVFEEnabled             or false)
    insertPool(PistolCaseRainsFirearms, combinedPool, SandboxVars.WeaponCases.PoolRainsFirearmsEnabled or false)
    insertPool(PistolCaseRainsBlades, combinedPool, SandboxVars.WeaponCases.PoolRainsBladesEnabled     or false)
    insertPool(PistolCaseEFK, combinedPool, SandboxVars.WeaponCases.PoolEFKEnabled                     or false)
    insertPool(PistolCaseFirearmsHyzo, combinedPool, SandboxVars.WeaponCases.PoolFirearmsHyzoEnabled   or false)
    insertPool(PistolCaseAdvancedWarfare, combinedPool, SandboxVars.WeaponCases.PoolAdvancedWarfareEnabled   or false)

    --- @type HandWeapon
    local weapon = instanceItem(combinedPool[ZombRand(#combinedPool)+1])
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

--- @param container ItemContainer
function FillRifleCase(container)
    local combinedPool = {}

    insertPool(RifleCasePoolVanilla, combinedPool, SandboxVars.WeaponCases.PoolVanillaEnabled or false)
    insertPool(RifleCasePool93, combinedPool, SandboxVars.WeaponCases.Pool93Enabled           or false)
    insertPool(RifleCasePoolBrita, combinedPool, SandboxVars.WeaponCases.PoolBritaEnabled     or false)
    insertPool(RifleCaseVFE, combinedPool, SandboxVars.WeaponCases.PoolVFEEnabled             or false)
    insertPool(RifleCaseRainsFirearms, combinedPool, SandboxVars.WeaponCases.PoolRainsFirearmsEnabled   or false)
    insertPool(RifleCaseRainsBlades, combinedPool, SandboxVars.WeaponCases.PoolRainsBladesEnabled       or false)
    insertPool(RifleCaseEFK, combinedPool, SandboxVars.WeaponCases.PoolEFKEnabled                       or false)
    insertPool(RifleCaseFirearmsHyzo, combinedPool, SandboxVars.WeaponCases.PoolFirearmsHyzoEnabled     or false)
    insertPool(RifleCaseAdvancedWarfare, combinedPool, SandboxVars.WeaponCases.PoolAdvancedWarfareEnabled   or false)
    
    --- @type HandWeapon
    local weapon = instanceItem(combinedPool[ZombRand(#combinedPool)+1])
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
    FillPistolCase(container)
end

function UnlockRifleCase_OnCreate(recipeData, _)
    local result = recipeData:getAllCreatedItems():get(0);
    local container = result:getInventory()
    FillRifleCase(container)
end