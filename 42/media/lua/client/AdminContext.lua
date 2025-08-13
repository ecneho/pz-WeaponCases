local original_inventory = ISInventoryPage.onBackpackRightMouseDown

function ISInventoryPage:onBackpackRightMouseDown(x, y)
	local page = self.parent
    local container = self.inventory
	
    if (container:getType() == "none") then
        if SandboxVars.WeaponCases.UseAdminContext then
            if not isClient() or isAdmin() then
                local context = ISContextMenu.get(page.player, getMouseX(), getMouseY())
                local buildMWOption = context:addOption("Weapon Cases", container);
                local subMenuMW = ISContextMenu:getNew(context);
                context:addSubMenu(buildMWOption, subMenuMW);
            
            
                local containerOption = subMenuMW:addOption("Add Item", container);
                local subMenuContainer = subMenuMW:getNew(subMenuMW);
                context:addSubMenu(containerOption, subMenuContainer);
            
                subMenuContainer:addOption("Marked Rifle Case", container, function() container:AddItem("caseItems.riflecaseLocked") end)
                subMenuContainer:addOption("Marked Pistol Case", container, function() container:AddItem("caseItems.pistolcaseLocked") end)
            
            
                local wallOption = subMenuMW:addOption("Fill Loot", container);
                local subMenuWall = subMenuMW:getNew(subMenuMW);
                context:addSubMenu(wallOption, subMenuWall);
            
                subMenuWall:addOption("Marked Pistol Pool", container, function() FillPistolCase(container) end)
                subMenuWall:addOption("Marked Rifle Pool",  container, function() FillRifleCase(container) end)
            else
                original_inventory(self, x, y)
            end
        else
            original_inventory(self, x, y)
        end
    else
        original_inventory(self, x, y)
    end
end

---@param context ISContextMenu
local function OnFillInventoryObjectContextMenu(player, context, items)
    local container = ISInventoryPane.getActualItems(items)[1] ---@type InventoryContainer

    if instanceof(container, "InventoryContainer") then
        if SandboxVars.WeaponCases.UseAdminContext then
            if not isClient() or isAdmin() then
                local inventory = container:getInventory()
                local buildMWOption = context:addOption("Weapon Cases");
                local subMenuMW = ISContextMenu:getNew(context);
                context:addSubMenu(buildMWOption, subMenuMW);
            
            
                local containerOption = subMenuMW:addOption("Add Item", container);
                local subMenuContainer = subMenuMW:getNew(subMenuMW);
                context:addSubMenu(containerOption, subMenuContainer);
            
                subMenuContainer:addOption("Marked Rifle Case", container, function() inventory:AddItem("caseItems.riflecaseLocked") end)
                subMenuContainer:addOption("Marked Pistol Case", container, function() inventory:AddItem("caseItems.pistolcaseLocked") end)
            
            
                local wallOption = subMenuMW:addOption("Fill Loot", container);
                local subMenuWall = subMenuMW:getNew(subMenuMW);
                context:addSubMenu(wallOption, subMenuWall);
            
                subMenuWall:addOption("Marked Pistol Pool", container, function() FillPistolCase(inventory) end)
                subMenuWall:addOption("Marked Rifle Pool",  container, function() FillRifleCase(inventory) end)
            end
        end
    end
end

Events.OnFillInventoryObjectContextMenu.Add(OnFillInventoryObjectContextMenu)