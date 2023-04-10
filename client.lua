QBCore = exports['qb-core']:GetCoreObject()






RegisterNetEvent('forcelocks:client:forcelock', function()
    local player = QBCore.Functions.GetPlayerData()
    local veh = QBCore.Functions.GetClosestVehicle()
    local plate = GetVehicleNumberPlateText(veh)
    print('Vehicle= '..tostring(GetVehicleNumberPlateText(veh)))
    for i = 0, #Config.AllowedJobs do 
        if player.job.name == Config.AllowedJobs[i] and player.job.onduty == true then
            if player.job.onduty == true then
                TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
                PlayAnimation()
                print('Forcing Locks')
                    break      
                end
            else
        end
    end
end)

function PlayAnimation()
    local ped = GetPlayerPed(-1)
    local time = 10000 -- in milliseconds (10 seconds)
    
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge_heels")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge_heels") do
      Citizen.Wait(100)
    end
    
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge_heels", "idle", 8.0, -8.0, time, 1, 0, false, false, false)
    
    Citizen.Wait(time)
    
    ClearPedTasks(ped)
  
end
