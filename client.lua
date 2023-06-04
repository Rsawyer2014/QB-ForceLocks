QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('forcelocks:client:forcelock', function()
    local player = QBCore.Functions.GetPlayerData()
    local veh = QBCore.Functions.GetClosestVehicle()
    local plate = GetVehicleNumberPlateText(veh)
    local jobAllowed = false

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local vehicleCoords = GetEntityCoords(veh)
    local distance = GetDistanceBetweenCoords(playerCoords, vehicleCoords, true)
    local maxDistance = 2

    if distance <= maxDistance then
        for i = 1, #Config.AllowedJobs do
            if player.job.name ~= nil and player.job.name == Config.AllowedJobs[i] and player.job.onduty == true then
                jobAllowed = true
                break
            end
        end

        if jobAllowed then
            QBCore.Functions.Progressbar('forcelocks', 'Forcing Open Locks', 20000, false, true,
                {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true
                },
                {
                    task = 'WORLD_HUMAN_WELDING',
                },
                {}, {}, function()
                    TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
                    ClearPedTasks(playerPed)
                end, function()
                    ClearPedTasks(playerPed)
                end)
        else
            QBCore.Functions.Notify("You are not allowed to force open locks with your current job.", "error")
        end
    else
        QBCore.Functions.Notify("You are too far from the vehicle to force open locks.", "error")
    end
end)
