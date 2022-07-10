
local QBCore = exports['qb-core']:GetCoreObject()
local data = {}

local ShopItems = {}
ShopItems.label = "White Widow"
ShopItems.items = Config["GrowShopItems"]
ShopItems.slots = #Config["GrowShopItems"]
    

--Name: 3 | 2022-02-19T14:21:43Z
local entrance = BoxZone:Create(vector3(201.06, -239.58, 54.07), 3, 1, {
    name="entrance",
    heading=25,
    debugPoly=true,
    minZ=53.07,
    maxZ=55.87
})

entrance:onPlayerInOut(function(isPointInside)
    if isPointInside then
        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        TriggerServerEvent("jay-whitewidow:server:entrance")        
    end
end)

--[[

BoxZone:Create(vector3(169.6, -239.43, 50.06), 0.5, 0.5, {
  name="0.5",
  heading=340,
  --debugPoly=true,
  minZ=49.26,
  maxZ=50.86
})

]]

RegisterNetEvent("QBCore:Server:OnPlayerUnload", function()
    for k,v in pairs(data) do 
        print(k,v)
        exports['qb-target']:RemoveZone(k)
    end
end)

local DEBUG = false

RegisterNetEvent("jay-whitewidow:client:removeZone", function(zone)
    exports['qb-target']:RemoveZone(zone)
end)

--[[


--Name: fucked if i know | 2022-02-19T13:05:23Z
BoxZone:Create(vector3(165.45, -235.72, 50.06), 3, 1, {
  name="fucked if i know",
  heading=250,
  --debugPoly=true,
  minZ=49.86,
  maxZ=50.06
})


]]
CreateThread(function()
    exports['qb-target']:AddBoxZone("dryweed", vector3(165.45, -235.72, 50.06), 3, 1, {
        name = "dryweed",
        heading=250,
        debugPoly=DEBUG,
        minZ=49.86,
        maxZ=50.06
    }, {
        options = {
            {
                action = function()
                    QBCore.Functions.Notify("Weed is dry")
                end,
                icon = "fa-solid fa-scissors",
                label = "Dry Buds",
                job = "unemployed"
            },
            {
                action = function()
                    TriggerEvent("inventory:client:SetCurrentStash", "whitewidows")
                    TriggerServerEvent("inventory:server:OpenInventory", "stash", "whitewidows", {
                        maxweight = 4000000,
                        slots = 500,
                    })
                end,
                icon = "fa-solid fa-scissors",
                label = "Bud Stash",
                job = "unemployed"
            }
        },          
        distance = 2.5
    })

    --Name: 2s | 2022-02-19T13:19:29Z
-- BoxZone:Create(vector3(188.98, -241.14, 54.07), 0.3, 0.5, {
--     name="2s",
--     heading=70,
--     --debugPoly=true,
--     minZ=54.12,
--     maxZ=54.32
--   })
    exports['qb-target']:AddBoxZone("register1", vector3(188.98, -241.14, 54.07), 0.3, 0.5, {
        name = "register1",
        heading=70,
        debugPoly=DEBUG,
        minZ=54.12,
        maxZ=54.32
    }, {
        options = {
            {
                action = function()
                    local bill = exports["qb-input"]:ShowInput({
                        header = "Create Receipt",
                        submitText = "Bill",
                        inputs = {
                            {
                                text = "Server ID",
                                name = "serverid",
                                type = "number",
                                isRequired = true ,
                            },
                            {
                                text = "Amount",
                                name = "amount",
                                type = "number",
                                isRequired = true,
                            }
                        }
                    })
                    if bill ~= nil then
                        TriggerServerEvent("jay-whitewidow:server:billplayer", bill.serverid, bill.amount) 
                    end
                end,
                icon = "fa-solid fa-scissors",
                label = "Bill",
                job = "unemployed"
            }
        },          
        distance = 2.5
    })

    -- BoxZone:Create(vector3(188.11, -243.54, 54.07), 0.3, 0.5, {
    --     name="as",
    --     heading=70,
    --     --debugPoly=true,
    --     minZ=53.92,
    --     maxZ=54.32
    --   })
      
    exports['qb-target']:AddBoxZone("register2", vector3(188.11, -243.54, 54.07), 0.3, 0.5, {
        name = "register2",
        heading=70,
        debugPoly=DEBUG,
        minZ=54.12,
        maxZ=54.32
    }, {
        options = {
            {
                action = function()
                    local bill = exports["qb-input"]:ShowInput({
                        header = "Create Receipt",
                        submitText = "Bill",
                        inputs = {
                            {
                                text = "Server ID",
                                name = "serverid",
                                type = "number",
                                isRequired = true ,
                            },
                            {
                                text = "Amount",
                                name = "amount",
                                type = "number",
                                isRequired = true,
                            }
                        }
                    })
                    if bill ~= nil then
                        TriggerServerEvent("jay-whitewidow:server:billplayer", bill.serverid, bill.amount) 
                    end
                end,
                icon = "fa-solid fa-scissors",
                label = "Bill",
                job = "unemployed"
            }
        },          
        distance = 2.5
    })

    --Name: aww/ | 2022-02-19T13:31:58Z
-- BoxZone:Create(vector3(188.57, -239.77, 54.07), 1.0, 0.5, {
--     name="aww/",
--     heading=70,
--     --debugPoly=true,
--     minZ=54.07,
--     maxZ=54.27
--   })
--[[

 TriggerEvent("inventory:client:SetCurrentStash", "mechanicstash")
                                TriggerServerEvent("inventory:server:OpenInventory", "stash", "mechanicstash", {
                                    maxweight = 4000000,
                                    slots = 500,
                                })
]]

    exports['qb-target']:AddBoxZone("stash", vector3(188.57, -239.77, 54.07), 1.0, 0.5, {
        name = "stash",
        heading=70,
        debugPoly=DEBUG,
        minZ=54.07,
        maxZ=54.27
    }, {
        options = {
            {
                action = function()
                    TriggerEvent("inventory:client:SetCurrentStash", "whitewidowtray")
                    TriggerServerEvent("inventory:server:OpenInventory", "stash", "whitewidowtray", {
                        maxweight = 4000000,
                        slots = 500,
                    })
                end,
                icon = "fa-solid fa-scissors",
                label = "Stash",
            }
        },          
        distance = 2.5
    })
    --[[

    BoxZone:Create(vector3(188.68, -237.24, 54.07), 2.5, 0.4, {
  name=".4",
  heading=70,
  --debugPoly=true,
  minZ=53.67,
  maxZ=55.87
})

    ]]
    exports['qb-target']:AddBoxZone("growown", vector3(188.68, -237.24, 54.07), 2.5, 0.4, {
        name = "growown",
        heading=70,
        debugPoly=DEBUG,
        minZ=53.67,
        maxZ=55.87
    }, {
        options = {
            {
                action = function()
                    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Whitewidow", ShopItems)
                end,
                icon = "fa-solid fa-scissors",
                label = "Shop",
            }
        },          
        distance = 2.5
    })
end)

RegisterNetEvent("jay-whitewidow:client:createZone", function(zone, coords, heading)
    print(coords, zone, heading)
    data[zone] = zone
    exports['qb-target']:AddBoxZone(zone, coords, 0.5, 0.5, {
        name = zone,
        heading=heading,
        debugPoly=DEBUG,
        minZ=49.16,
        maxZ=50.86
    }, {
        options = {
            {
                action = function()
                    TriggerServerEvent("jay-whitewidow:server:removeZone", zone)
                    QBCore.Functions.Notify("test")
                end,
                icon = "fa-solid fa-scissors",
                label = "Cut Buds",
                job = "unemployed"
            }
        },          
        distance = 2.5
    })
end)