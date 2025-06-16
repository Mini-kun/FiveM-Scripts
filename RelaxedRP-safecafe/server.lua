local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-safecafe:GiveAndUseProtentMix', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    Player.Functions.SetMetaData('hunger', 100)
    Player.Functions.SetMetaData('thirst', 100)
    
    -- HUD update for wais-rhud
    TriggerClientEvent('hud:client:UpdateNeeds', src, 100, 100)
    
    TriggerClientEvent('QBCore:Notify', src, "Your hunger and thirst were fully restored!", "success", 3000)

    print("[SafeCafe] ✅ Auto-restore applied to", GetPlayerName(src))
end)