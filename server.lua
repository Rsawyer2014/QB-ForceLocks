QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add('forcelock', 'Force open a locked vehicle', {}, false, function(source)
    TriggerClientEvent('forcelocks:client:forcelock', source)
end)

RegisterNetEvent('forcelocks:server:forcelock', function(player, veh)
    local src = source
    TriggerClientEvent("forcelocks:client:breaklocks", source)


end)
