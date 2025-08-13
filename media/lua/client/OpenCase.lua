local function insertPool(from, to, condition)
    if condition then
        for _, item in ipairs(from) do
            table.insert(to, item)
        end
    end
end

function FillPistolCase(container)
    local combinedPool = {}

    insertPool(PistolCasePoolVanilla, combinedPool, SandboxVars.WeaponCases.PoolVanillaEnabled or true)
    insertPool(PistolCasePool93, combinedPool, SandboxVars.WeaponCases.Pool93Enabled           or false)
    insertPool(PistolCasePoolBrita, combinedPool, SandboxVars.WeaponCases.PoolBritaEnabled     or false)
    insertPool(PistolCaseVFE, combinedPool, SandboxVars.WeaponCases.PoolVFEEnabled             or false)
    
    local weapon = InventoryItemFactory.CreateItem(combinedPool[ZombRand(#combinedPool)+1])
    if weapon ~= nil then
        local mag = weapon:getMagazineType()
        if mag ~= nil then
            local amount = ZombRand(3) + 1
            for _ = 1, amount do
                container:AddItem(mag)
            end
        end
        container:AddItem(weapon)
    end
end

function FillRifleCase(container)
    local combinedPool = {}

    insertPool(RifleCasePoolVanilla, combinedPool, SandboxVars.WeaponCases.PoolVanillaEnabled or true)
    insertPool(RifleCasePool93, combinedPool, SandboxVars.WeaponCases.Pool93Enabled           or false)
    insertPool(RifleCasePoolBrita, combinedPool, SandboxVars.WeaponCases.PoolBritaEnabled     or false)
    insertPool(RifleCaseVFE, combinedPool, SandboxVars.WeaponCases.PoolVFEEnabled             or false)

    local weapon = InventoryItemFactory.CreateItem(combinedPool[ZombRand(#combinedPool)+1])
    if weapon ~= nil then
        local mag = weapon:getMagazineType()
        if mag ~= nil then
            local amount = ZombRand(3) + 1
            for _ = 1, amount do
                container:AddItem(mag)
            end
        end
        container:AddItem(weapon)
    end
end

function UnlockPistolCase_OnCreate(_, result, _)
    local container = result:getInventory()
    FillPistolCase(container)
end

function UnlockRifleCase_OnCreate(_, result, _)
    local container = result:getInventory()
    FillRifleCase(container)
end