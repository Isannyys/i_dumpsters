local ESX = exports['es_extended']:getSharedObject()
alreadysearched = {}

CreateThread(function()
    local p = PlayerPedId()
    while true do
        local wait = 1000
        for i=1, #Config.Props, 1 do
            local prophash = GetClosestObjectOfType(GetEntityCoords(p), 1.0, GetHashKey(Config.Props[i]), false)
            if prophash ~= 0 then
                wait = 0
                Draw3DText(GetEntityCoords(prophash), Config.SearchText, 0.35)
                if IsControlJustReleased(0, Config.StartButton) then
                    if not alreadysearched[prophash] then
                        local safehash = prophash
                        search(prophash)
                    else
                        ESX.ShowNotification(Config.AlreadySearched)
                    end
                end
            end
        end
        Wait(wait)
    end
end)

function search(prophash)
    alreadysearched[prophash] = true

    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_SHOPPING_CART", 0, true)

    local startTime = GetGameTimer()
    while GetGameTimer() - startTime < Config.SearchTime do
        if IsControlJustReleased(0, Config.StopButton) then
            ClearPedTasks(PlayerPedId())
            ESX.ShowNotification(Config.StopSearching)
            return
        end
        Wait(0)
    end

    local foundItem = false
    local itemCount = 0
    local itemLabel = ""

    ESX.TriggerServerCallback(GetCurrentResourceName(), function(found, object, quantity, safehash, prophash)
        if found then
            foundItem = true
            itemCount = quantity
            itemLabel = object
        end
    end, prophash)

    Wait(100)
    ClearPedTasks(PlayerPedId())

    if foundItem then
        ESX.ShowNotification(Config.FoundSomething .. itemCount .. 'x ' .. itemLabel)
    else
        ESX.ShowNotification(Config.NotFound)
    end
end


function Draw3DText(coords, text, scale)
    local onScreen, x, y = World3dToScreen2d(coords.x, coords.y, coords.z+1.0)
    SetTextScale(0.38, 0.38)
    SetTextOutline()
    SetTextDropShadow()
    SetTextDropshadow(2, 0, 0, 0, 255)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry('STRING')
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(x, y)
    local factor = (string.len(text)) / 400
    DrawRect(x,y+0.0125, 0.008+ factor, 0.03, 61, 11, 41, 68)
end
