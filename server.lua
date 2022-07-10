local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("jay-whitewidow:server:entrance", function()
    local players = QBCore.Functions.GetQBPlayers()
    for k,v in pairs(players) do
        if v.PlayerData.job.name == 'unemployed' then
            TriggerClientEvent('QBCore:Notify', v.PlayerData.source, "You may have a customer at white widow")
        end
    end
end)

RegisterServerEvent("jay-whitewidow:server:billplayer", function(playerId, amount)
    local src = source
    local biller = QBCore.Functions.GetPlayer(src)
    local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
    local amount = tonumber(amount)
    if biller.PlayerData.job.name == 'unemployed' then -- CHANGE LATER
        if billed ~= nil then
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                if amount and amount > 0 then
                    MySQL.Async.insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (@citizenid, @amount, @society, @sender)', {
                        ['@citizenid'] = billed.PlayerData.citizenid,
                        ['@amount'] = amount,
                        ['@society'] = biller.PlayerData.job.name,
                        ['@sender'] = biller.PlayerData.charinfo.firstname
                    })
                    TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                    TriggerClientEvent('QBCore:Notify', src, 'Invoice Successfully Sent', 'success')
                    TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                else
                    TriggerClientEvent('QBCore:Notify', src, 'Must Be A Valid Amount Above 0', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', src, 'You Cannot Bill Yourself', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'Player Not Online', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'No Access', 'error')
    end
end)

local data = {
    ["bud1"] = {name = "bud1", time = 0, coords = vector3(169.6, -239.43, 50.06), heading = 340},
    ["bud2"] = {name = "bud2", time = 0, coords = vector3(170.38, -239.73, 50.06), heading = 340},
    ["bud3"] = {name = "bud3", time = 0, coords = vector3(171.13, -240.0, 50.06), heading = 340},
    ["bud4"] = {name = "bud4", time = 0, coords = vector3(171.869, -240.24, 50.06), heading = 340},
    ["bud5"] = {name = "bud5", time = 0, coords = vector3(172.616, -240.50, 50.06), heading = 340},
    ["bud6"] = {name = "bud6", time = 0, coords = vector3(168.94, -241.27, 50.06), heading = 340},
    ["bud7"] = {name = "bud7", time = 0, coords = vector3(169.68, -241.54, 50.06), heading = 340},
    ["bud8"] = {name = "bud8", time = 0, coords = vector3(170.42, -241.81, 50.06), heading = 340},
    ["bud9"] = {name = "bud9", time = 0, coords = vector3(171.20, -242.09, 50.06), heading = 340},
    ["bud10"] = {name = "bud10", time = 0, coords = vector3(171.94, -242.36, 50.06), heading = 340},
    ["bud11"] = {name = "bud11", time = 0, coords = vector3(165.55, -240.06, 50.06), heading = 340},
    ["bud12"] = {name = "bud12", time = 0, coords = vector3(164.85, -239.81, 50.06), heading = 340},
    ["bud13"] = {name = "bud13", time = 0, coords = vector3(164.18, -239.56, 50.06), heading = 340},
    ["bud14"] = {name = "bud14", time = 0, coords = vector3(163.45, -239.30, 50.06), heading = 340},
    ["bud15"] = {name = "bud15", time = 0, coords = vector3(162.783, -239.06, 50.06), heading = 340},
    ["bud16"] = {name = "bud16", time = 0, coords = vector3(163.54, -237.20, 50.06), heading = 340},
    ["bud17"] = {name = "bud17", time = 0, coords = vector3(164.18, -237.43, 50.06), heading = 340},
    ["bud18"] = {name = "bud18", time = 0, coords = vector3(164.90, -237.69, 50.06), heading = 340},
    ["bud19"] = {name = "bud19", time = 0, coords = vector3(165.52, -237.92, 50.06), heading = 340},
    ["bud20"] = {name = "bud20", time = 0, coords = vector3(166.25, -238.18, 50.06), heading = 340},
    ---

    ["bud21"] = {name = "bud21", time = 0, coords = vector3(167.60, -244.07, 50.06), heading = 340},
    ["bud22"] = {name = "bud22", time = 0, coords = vector3(167.16, -245.28, 50.06), heading = 340},
    ["bud23"] = {name = "bud23", time = 0, coords = vector3(166.67, -246.610, 50.06), heading = 340},
    ["bud24"] = {name = "bud24", time = 0, coords = vector3(166.27, -247.73, 50.06), heading = 340},
    ["bud25"] = {name = "bud25", time = 0, coords = vector3(165.85, -248.88, 50.06), heading = 340},
    ["bud26"] = {name = "bud26", time = 0, coords = vector3(168.32, -249.75, 50.06), heading = 340},
    ["bud27"] = {name = "bud27", time = 0, coords = vector3(168.72, -248.67, 50.06), heading = 340},
    ["bud28"] = {name = "bud28", time = 0, coords = vector3(169.16, -247.45, 50.06), heading = 340},
    ["bud29"] = {name = "bud29", time = 0, coords = vector3(169.63, -246.17, 50.06), heading = 340},
    ["bud30"] = {name = "bud30", time = 0, coords = vector3(170.07, -244.97, 50.06), heading = 340},
    --
    ["bud31"] = {name = "bud31", time = 0, coords = vector3(164.95, -243.11, 50.06), heading = 340},
    ["bud32"] = {name = "bud32", time = 0, coords = vector3(164.51, -244.32, 50.06), heading = 340},
    ["bud33"] = {name = "bud33", time = 0, coords = vector3(164.06, -245.55, 50.06), heading = 340},
    ["bud34"] = {name = "bud34", time = 0, coords = vector3(163.63, -246.74, 50.06), heading = 340},
    ["bud35"] = {name = "bud35", time = 0, coords = vector3(163.21, -247.88, 50.06), heading = 340},
    --
    ["bud36"] = {name = "bud36", time = 0, coords = vector3(160.67, -246.97, 50.06), heading = 340},
    ["bud37"] = {name = "bud37", time = 0, coords = vector3(161.08, -245.84, 50.06), heading = 340},
    ["bud38"] = {name = "bud38", time = 0, coords = vector3(161.5311, -244.61, 50.06), heading = 340},
    ["bud39"] = {name = "bud39", time = 0, coords = vector3(161.95, -243.43, 50.06), heading = 340},
    ["bud40"] = {name = "bud40", time = 0, coords = vector3(162.40, -242.21, 50.06), heading = 340},
}

--[[

    TriggerClientEvent("jay-whitewidow:client:createZone", -1, "bud1", vector3(169.6, -239.43, 50.06), 340)
    TriggerClientEvent("jay-whitewidow:client:createZone", -1, "bud2", vector3(170.38, -239.73, 50.06), 340)
    TriggerClientEvent("jay-whitewidow:client:createZone", -1, "bud3", vector3(171.13, -240.0, 50.06), 340)
    TriggerClientEvent("jay-whitewidow:client:createZone", -1, "bud4", vector3(171.869, -240.24, 50.06), 340)
    TriggerClientEvent("jay-whitewidow:client:createZone", -1, "bud5", vector3(172.616, -240.50, 50.06), 340)
]]

function Cooldown(zone, time)
    print(data[zone].time)
    data[zone].time = time
    CreateThread(function()
        while data[zone].time > 0 do
            Wait(1000)
            data[zone].time = data[zone].time - 1
            if data[zone].time == 0 then
                TriggerClientEvent("jay-whitewidow:client:createZone", -1, data[zone].name, data[zone].coords, data[zone].heading)
            end
        end
    end)
end

RegisterNetEvent("QBCore:Server:OnPlayerLoaded", function()
    local src = source
    for k,v in pairs(data) do
        if v.time == 0 then
            TriggerClientEvent("jay-whitewidow:client:createZone", src, v.name, v.coords, v.heading)
        end
    end
end)

-- AddEventHandler('onResourceStarting', function(resourceName)
--     if resourceName == 'jay-whitewidow' then
--         for k,v in pairs(data) do
--             print(v.time)
--             if v.time >= 0 then
--                 print("test")
--                 TriggerClientEvent("jay-whitewidow:client:createZone", -1, v.name, v.coords, v.heading)
--             end
--         end
--     end
--   end)
  

-- AddEventHandler('onResourceStart', function(resourceName)
--     if (GetCurrentResourceName() ~= resourceName) then
--       return
--     end
--     print('The resource ' .. resourceName .. ' has been started.')
--     for k,v in pairs(data) do
--         print(v.time)
--         if v.time >= 0 then
--             print("test")
--             TriggerClientEvent("jay-whitewidow:client:createZone", -1, v.name, v.coords, v.heading)
--         end
--     end
-- end)


RegisterCommand("test", function(source)
    local src = source
    for k,v in pairs(data) do
        if v.time == 0 then
            TriggerClientEvent("jay-whitewidow:client:createZone", src, v.name, v.coords, v.heading)
        end
    end
end)

RegisterNetEvent("jay-whitewidow:server:removeZone", function(zone)
    local src = source
    Cooldown(zone, Config["GrowTime"])
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["weed_ak47"], "add")
    Player.Functions.AddItem("weed_ak47", 1)
    TriggerClientEvent("jay-whitewidow:client:removeZone", -1, zone)
end)

