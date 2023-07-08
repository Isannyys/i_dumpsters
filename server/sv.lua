
local ESX = exports['es_extended']:getSharedObject()

ESX.RegisterServerCallback(GetCurrentResourceName(), function(source, cb)
    if safehash == prophash then
        local player = ESX.GetPlayerFromId(source)
        local chance = math.random(1, 100)

        if player then
            for _, item in ipairs(Config.DumpsterLoot) do
                if chance <= item.Chance then
                    local randomItem = item.name
                    local quantity = math.random(1, item.MaxAmount)
                    local itemLabel = ESX.GetItemLabel(randomItem)

                    if player.canCarryItem(randomItem, quantity) then
                        player.addInventoryItem(randomItem, quantity)
                        cb(true, itemLabel, quantity)
                    else
                        cb(false)
                    end
                    break 
                end
            end
        end
    end
end)
