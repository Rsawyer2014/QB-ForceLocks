QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("blowtorch", function(source, item)
        TriggerClientEvent('forcelocks:client:forcelock', source)
end)
