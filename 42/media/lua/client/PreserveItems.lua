---@param item InventoryItem
---@param target string
local function ChangeItem(item, target)
  local items = item:getItemContainer():getItems()
  local inventory = item:getContainer()

  local case = instanceItem(target)
  case:getItemContainer():setItems(items)
  case:setName(item:getName())

  inventory:AddItem(case)
  inventory:Remove(item)
end

---@param playerNum integer
---@param context ISContextMenu
---@param items table<integer, ContextMenuItemStack>|table<integer, InventoryItem>
local function OnFillInventoryObjectContextMenu(playerNum, context, items)
  local items = ISInventoryPane.getActualItems(items)
  local player = getSpecificPlayer(playerNum)
  
    for _, item in ipairs(items) do
      if player:getInventory() == item:getContainer() then
        if item:getFullType() == 'caseItems.riflecaseClosed' then
          context:addOption(getText('IGUI_OpenCasePrompt'), player, function () ChangeItem(item, 'caseItems.riflecaseOpen') end)
        end
        if item:getFullType() == 'caseItems.riflecaseOpen' then
          context:addOption(getText('IGUI_CloseCasePrompt'), player, function () ChangeItem(item, 'caseItems.riflecaseClosed') end)
        end
        if item:getFullType() == 'caseItems.pistolcaseOpen' then
          context:addOption(getText('IGUI_CloseCasePrompt'), player, function () ChangeItem(item, 'caseItems.pistolcaseClosed') end)
        end
        if item:getFullType() == 'caseItems.pistolcaseClosed' then
          context:addOption(getText('IGUI_OpenCasePrompt'), player, function () ChangeItem(item, 'caseItems.pistolcaseOpen') end)
        end
      end
    end
end

Events.OnFillInventoryObjectContextMenu.Add(OnFillInventoryObjectContextMenu)