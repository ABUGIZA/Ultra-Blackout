
local QBCore = exports['qb-core']:GetCoreObject()
local blackout = false
local CD = exports["keep-cooldown"]:CD()
local cd_id
local coords = vector3(513.77, -998.91, 27.64)
local PlayerData = QBCore.Functions.GetPlayerData()
local ped = PlayerPedId()
local pos = GetEntityCoords(ped)
local function Cooldown()
  cd_id = CD.add({
    id = "keep_blackmarket_payphone" .. PlayerPedId(),
    cooldownLength = 3600,
    cType = "temporary" -- or persistent
  }
  )

end

RegisterNetEvent("qb:count1", function(re)
  local state, remaining = CD.isOnCooldown(cd_id)
  if state then
     QBCore.Functions.Notify("لا يمكنك الان حاول مرة اخرى" .. remaining .. "دقايق")
     return
  end

    if QBCore.Functions.HasItem("advancedlockpick") then
      if QBCore.Functions.HasItem("thermite") then
  QBCore.Functions.Progressbar("search_register", "جاري تعطيل الكهرباء..", 6000, false, true, {
     disableMovement = true,
     disableCarMovement = true,
     disableMouse = false,
     disableCombat = true,
  }, {
  animDict = "mp_arresting",
  anim = "a_uncuff",
  flags = 16,
  }, {}, {}, function() -- Done
  StopAnimTask(ped, "mp_arresting", "a_uncuff", 1.0)
  exports['ps-ui']:Scrambler(function(success)
  if success then
  exports['ps-ui']:VarHack(function(success)
      if success then
  if not state then
     CD.setOnCooldown(cd_id)
  end
  ClearPedTasks(ped)
  QBCore.Functions.Notify("نجحت في تعطيل الكهرباء","success",5000)
  TriggerServerEvent("QBCore:Server:RemoveItem", "advancedlockpick", 1)
  TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["advancedlockpick"], "remove")
  TriggerServerEvent("QBCore:Server:RemoveItem", "thermite", 1)
  TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["thermite"], "remove")
  local DispatchData = {
     jobs = { ["police"] = true, ["ems"] = true }, --enables every grade within job - ["police"] = {1,2,3} - would only allow grades 1, 2 and 3 to see the alert.
     code = "10-77",
     callname = "Backup Request", -- The title of the alert.
     coords = pos, -- Coords are needed to get the location which sets the blip location and gets the road name for the alert.
     info = { {
        icon = "fas fa-passport", -- Sets the alert icon for the third row of text in the alert (the alert info). You the icons here: https://fontawesome.com/icons
        label = PlayerData.metadata["callsign"] ..
        " | " .. PlayerData.charinfo.firstname .. " " .. PlayerData.charinfo.lastname .. " is requesting backup" -- Sets the text for the alert info.
     } },
     blip = { -- All the blip settings.
        label = "10-77", -- Blip label.
        sprite = 42, -- Blip sprties and colours can by found here: https://docs.fivem.net/docs/game-references/blips/
        colour = 0,
        scale = 0.8,
        flash = false,
        fadeTime = 250, -- about of time for the blip to fade away.
        leaveMiniMap = true -- sets if the blips stay on the mini map or not even if not close to the blip location.
     },
     sound = sound,
  }
  exports['mw-dispatch']:NewAlert(DispatchData)
  QBCore.Functions.StartParticleAtCoord("scr_ornate_heist", "scr_heist_ornate_thermal_burn", true, vector4(513.20, -999.6, 28.20, 390.16), vector4(512.47, -998.9, 27.63, 300.16), 1.0, false, false, 10000)
  RequestModel("prop_elecbox_05a")
  local oo = CreateObject("prop_elecbox_05a", 512.90, -993.08, 27.40, true, true, true)
  local aa = CreateObject("prop_elecbox_05a", 512.98, -986.1, 28.13, true, true, true)
  SetEntityHeading(oo, 90.0)
  FreezeEntityPosition(oo, true)
  Wait(300)
  AddExplosion(512.90, -993.08, 27.40, 34, 40.0, true, false, 100, true)
  AddExplosion(512.98, -986.1, 28.13, 34, 40.0, true, false, 100, true)
  DeleteObject(oo)
  DeleteObject(aa)
  TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 90.0, 'y2mate.com-New-York-Blackout-Animation_v144P_Trim', 1.4)
  Wait(500)
  TriggerServerEvent("qb-weathersync:server:toggleBlackout")
  Wait(100)
  TriggerServerEvent("qb-weathersync:server:toggleBlackout")
  Wait(100)
  TriggerServerEvent("qb-weathersync:server:toggleBlackout")
  Wait(100)
  TriggerServerEvent("qb-weathersync:server:toggleBlackout")
  Wait(100)
  TriggerServerEvent("qb-weathersync:server:toggleBlackout")
  Wait(100)
  TriggerServerEvent("qb-weathersync:server:toggleBlackout")
  Wait(100)
  TriggerServerEvent("qb-weathersync:server:toggleBlackout")
  Wait(100)
  TriggerServerEvent("qb-weathersync:server:toggleBlackout")
  Wait(100)
  TriggerServerEvent("qb-weathersync:server:toggleBlackout")
  Wait(100)
  TriggerServerEvent("qb-weathersync:server:toggleBlackout")
  Wait(50)
  TriggerServerEvent("qb-weathersync:server:toggleBlackout")
  blackout = true
  local blip = AddBlipForRadius(coords, 50.0) -- need to have .0
  SetBlipColour(blip, 1)
  SetBlipAlpha(blip, 128)
  Wait(600000)
  RemoveBlip(blip)
  else
  TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'videopack_Trim', 1.8)
  QBCore.Functions.Notify("فشلت في تعطيل الكهرباء",'error', 5000)
  TriggerServerEvent("QBCore:Server:RemoveItem", "advancedlockpick", 1)
  TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["advancedlockpick"], "remove")
  TriggerServerEvent("QBCore:Server:RemoveItem", "thermite", 1)
  TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["thermite"], "remove")
  ClearPedTasks(ped)
  end
end, 5,5)
else
  QBCore.Functions.Notify("فشلت في تعطيل الكهرباء",'error', 5000)
  TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'videopack_Trim', 1.8)
  TriggerServerEvent("QBCore:Server:RemoveItem", "advancedlockpick", 1)
  TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["advancedlockpick"], "remove")
  TriggerServerEvent("QBCore:Server:RemoveItem", "thermite", 1)
  TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["thermite"], "remove")
  ClearPedTasks(ped)
end
end, "numeric", 30,0)
  end)
  else
  QBCore.Functions.Notify("ليس لديك المعدات المطلوبه",'error', 5000)
  end
  else
     QBCore.Functions.Notify("ليس لديك المعدات المطلوبه",'error', 5000)
  end
end)


CreateThread(Cooldown)
    RegisterNetEvent('qb-blackout:client:fixlights')
    AddEventHandler('qb-blackout:client:fixlights', function()
      if QBCore.Functions.HasItem("bombdefuse") then
      if QBCore.Functions.HasItem("screwdriverset") then
        QBCore.Functions.Notify("جاري تشغيل الكهرباء", 5000)
      exports['ps-ui']:VarHack(function(success)
        if success then 
          QBCore.Functions.Notify("نجحت في تشغيل الكهرباء",'success', 5000)
      QBCore.Functions.Progressbar("search_register", "جاري تشغيل الكهرباء..", 6000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
      }, {
        animDict = "mp_arresting",
        anim = "a_uncuff",
        flags = 16,
      }, {}, {}, function()
      TriggerServerEvent("QBCore:Server:RemoveItem", "bombdefuse", 1)
      TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bombdefuse"], "remove")
      TriggerServerEvent("QBCore:Server:RemoveItem", "screwdriverset", 1)
      TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["screwdriverset"], "remove")
      TriggerServerEvent("qb-weathersync:server:toggleBlackout")
      TriggerServerEvent('qb-blackout:client:fixlights', -1)
      blackout = false

    end)
  else
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'videopack_Trim', 1.8)
    QBCore.Functions.Notify("فشلت في تسليح الكهرباء",'error', 5000)
    TriggerServerEvent("QBCore:Server:RemoveItem", "bombdefuse", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bombdefuse"], "remove")
    TriggerServerEvent("QBCore:Server:RemoveItem", "screwdriverset", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["screwdriverset"], "remove")
  end
  end, 5,7)
    else
    QBCore.Functions.Notify("ليس لديك items..screwdriverset.. bombdefuse ",'error', 5000)
    end
    else
      QBCore.Functions.Notify("ليس لديك items...  screwdriverset...  bombdefuse ",'error', 5000)
    end
end)

local requiredItemsShowed = false
CreateThread(function()
    local requiredItems = {
      [1] = {name = QBCore.Shared.Items["advancedlockpick"]["name"], image = QBCore.Shared.Items["advancedlockpick"]["image"]},
      [2] = {name = QBCore.Shared.Items["thermite"]["name"], image = QBCore.Shared.Items["thermite"]["image"] },
    }
    while true do
    Wait(0)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local dist = #(pos - vector3(512.59, -998.8, 27.62))
        if dist < 1.5 then
            if not requiredItemsShowed then
                requiredItemsShowed = true
                TriggerEvent('inventory:client:requiredItems', requiredItems, true)
            end
        else
            if requiredItemsShowed then
                requiredItemsShowed = false
                TriggerEvent('inventory:client:requiredItems', requiredItems, false)
            end
        end
    end
end)

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("power1", vector3(513.77, -998.91, 27.64), 3.6, 2, {
    name = "power1",
    heading = 359,
    debugPoly = false,
  }, {
    options = {
      {
        type = "Client",
        event = "qb:count1",
        icon = "fas fa-sack-dollar",
        label = 'تعطيل كهرباء المدينة',
        minZ = 24.04,
        maxZ = 28.84,
        
      },
      {
        type = "Client",
        event = "qb-blackout:client:fixlights",
        icon = "fas fa-sack-dollar",
        label = 'تشغيل كهرباء المدينة',
        job = "police",
        minZ = 24.04,
        maxZ = 28.84,
        canInteract = function()
          if blackout then return true else return false end 
      end
      
      },
    },
    distance = 1.5
  })
end)