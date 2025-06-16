local inNeedsZone = false
local restoreTimer = 0
local needsRestoreDelay = 5000 -- for testing (5 sec)

-- Load config
if not Config or not Config.SafeZones or not Config.NeedsZone then
    print("^1[SafeCafe] Config not loaded. Check Config.lua^7")
    return
end

CreateThread(function()
    Wait(100)

    local NeedsZone = PolyZone:Create(Config.NeedsZone.coords, {
        name = Config.NeedsZone.name,
        minZ = Config.NeedsZone.minZ,
        maxZ = Config.NeedsZone.maxZ,
        debugPoly = Config.Debug
    })

    NeedsZone:onPlayerInOut(function(isInside)
        inNeedsZone = isInside
        if isInside then
            restoreTimer = GetGameTimer()
            TriggerEvent('QBCore:Notify', "You've entered the SafeCafe. Hunger & thirst pause started.", "success", 2500)
        else
            restoreTimer = 0
            TriggerEvent('QBCore:Notify', "You left the SafeCafe. Timer reset.", "error", 2500)
        end
    end)

    CreateThread(function()
        while true do
            Wait(1000)
            if inNeedsZone and restoreTimer > 0 then
                if GetGameTimer() - restoreTimer >= needsRestoreDelay then
                    restoreTimer = GetGameTimer()
                    TriggerServerEvent('qb-safecafe:GiveAndUseProtentMix')
                end
            end
        end
    end)
end)

local inSafeZone = false

CreateThread(function()
    Wait(100)

    local safeZones = {}
    for _, zone in ipairs(Config.SafeZones) do
        local poly = PolyZone:Create(zone.coords, {
            name = zone.name,
            minZ = zone.minZ,
            maxZ = zone.maxZ,
            debugPoly = Config.Debug
        })
        table.insert(safeZones, poly)
    end

    local CombinedSafeZones = ComboZone:Create(safeZones, {
        name = "CombinedSafeZones",
        debugPoly = Config.Debug
    })

    CombinedSafeZones:onPlayerInOut(function(isInside)
        inSafeZone = isInside
        if isInside then
            TriggerEvent('QBCore:Notify', "You've entered a SafeZone. PvP and weapons are disabled.", "primary", 2500)
        else
            TriggerEvent('QBCore:Notify', "You left the SafeZone. Combat re-enabled.", "error", 2500)
        end
    end)
end)

CreateThread(function()
    while true do
        Wait(0)
        if inSafeZone then
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(0, 257, true)
            DisableControlAction(0, 263, true)
            DisableControlAction(0, 69, true)
            DisableControlAction(0, 92, true)
            if IsPedArmed(PlayerPedId(), 6) then
                SetCurrentPedWeapon(PlayerPedId(), `WEAPON_UNARMED`, true)
            end
        else
            Wait(500)
        end
    end
end)

AddEventHandler('gameEventTriggered', function(name, args)
    if name == 'CEventNetworkEntityDamage' and inSafeZone then
        CancelEvent()
    end
end)
