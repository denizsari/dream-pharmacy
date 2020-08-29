ESX              = nil
local PlayerData = {}
local Injected = false --- Morfin
local Timer = 0 --- Morfin Timer
local Adrenalin = false --- Adrenalin
local AdrTimer = 0 --- Adrenalin Timer
local Stress = false --- Stress
local strTimer = 0 --- Stress Timer



Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

-- Morfin İğnesi Bölümü

RegisterNetEvent('dreamTeamPharmacy:morphine')
AddEventHandler('dreamTeamPharmacy:morphine', function()
    propName = 'p_syringe_01_s'
    Citizen.CreateThread(function()
        local Ped = GetPlayerPed(-1)
        local x,y,z = table.unpack(GetEntityCoords(Ped))
        local prop = CreateObject(GetHashKey(propName), x, y, z + 0.3, true, true, true)
        local boneIndex = GetPedBoneIndex(Ped, 18905)
        AttachEntityToEntity(prop, Ped, boneIndex, 0.15, 0.03, 0.02, -50.0, 130.0, -.0, true, true, false, true, 1, true)
        loadAnimDict('mp_arresting')
        TaskPlayAnim(Ped, 'mp_arresting', 'a_uncuff', 8.0, -8, -1, 49, 0, 0, 0, 0)
        ESX.ShowNotification('Morfin İğnesi Yapıldı !')
        SetPedMoveRateOverride(PlayerId(), 10.0)
        SetRunSprintMultiplierForPlayer(PlayerId(), 1.05)
        SetSwimMultiplierForPlayer(PlayerId(),1.03)
        Citizen.Wait(1800)
        ClearPedTasks(Ped)
        DeleteObject(prop)
        ClearAllPedProps(Ped)
        if Injected == false then
           Injected = true
            while Timer < 15 do
                Timer = Timer + 1
                local Health = GetEntityHealth(GetPlayerPed(-1))
                Health = Health + 5
                SetEntityHealth(GetPlayerPed(-1), Health)
                Citizen.Wait(1250)
            end
            if Injected == true then
               Injected = false
            ESX.ShowNotification('İğne Etkisindesin !')
                Timer = 0
                SetPedMoveRateOverride(PlayerPedId(), 12.0)
                SetRunSprintMultiplierForPlayer(PlayerPedId(), 1.5)
                SetSwimMultiplierForPlayer(PlayerPedId(), 1.5)
            end
        else
            ESX.ShowNotification('Zaten Morfin İğnesi Yapıldı !')
        end
    end)
end)

-- Adrenalin İğnesi Bölümü

RegisterNetEvent('dreamTeamPharmacy:adrenalin')
AddEventHandler('dreamTeamPharmacy:adrenalin', function()
    adrPropName ='p_syringe_01_s'
    Citizen.CreateThread(function()
        local xPed = GetPlayerPed(-1)
        local x,y,z = table.unpack(GetEntityCoords(xPed))
        local xProp = CreateObject(GetHashKey(adrPropName), x, y, z + 0.3, true, true, true)
        local boneXIndex = GetPedBoneIndex(xPed, 18905)
        AttachEntityToEntity(xProp, xPed, boneXIndex, 0.15, 0.03, 0.02, -50.0, 130.0, -.0, true, true, false, true, 1, true)
        loadAnimDict('mp_arresting')
        TaskPlayAnim(xPed, 'mp_arresting', 'a_uncuff', 8.0, -8, -1, 49, 0, 0, 0, 0)
        ESX.ShowNotification('Adrenalin İğnesi Yapıldı !')
        SetPedMoveRateOverride(PlayerId(), 10.0)
        SetRunSprintMultiplierForPlayer(PlayerId(), 1.05)
        SetSwimMultiplierForPlayer(PlayerId(),1.03)
        Citizen.Wait(1500)
        ClearPedTasks(xPed)
        DeleteObject(xProp)
        ClearAllPedProps(xPed)
        if Adrenalin == false then
           Adrenalin = true
            while AdrTimer < 15 do
                AdrTimer = AdrTimer + 1
                local HealthX = GetEntityHealth(GetPlayerPed(-1))
                HealthX = HealthX + 3
                SetEntityHealth(GetPlayerPed(-1), HealthX)
                Citizen.Wait(1250)
            end
            if Adrenalin == true then
               Adrenalin = false
            ESX.ShowNotification('İğne Etkisindesin !')
                AdrTimer = 0
                SetPedMoveRateOverride(PlayerPedId(), 12.0)
                SetRunSprintMultiplierForPlayer(PlayerPedId(), 1.5)
                SetSwimMultiplierForPlayer(PlayerPedId(), 1.5)
            end
        else
            ESX.ShowNotification('Zaten Adrenalin İğnesi Yapıldı !')
        end
    end)
end)

-- Stress Düşürücü İğne

RegisterNetEvent('dreamTeamPharmacy:stress')
AddEventHandler('dreamTeamPharmacy:stress', function()
    stressPropName ='p_syringe_01_s'
    Citizen.CreateThread(function()
        local sPed = GetPlayerPed(-1)
        local x,y,z = table.unpack(GetEntityCoords(sPed))
        local sProp = CreateObject(GetHashKey(stressPropName), x, y, z + 0.3, true, true, true)
        local boneSIndex = GetPedBoneIndex(sPed, 18905)
        AttachEntityToEntity(sProp, sPed, boneSIndex, 0.15, 0.03, 0.02, -50.0, 130.0, -.0, true, true, false, true, 1, true)
        loadAnimDict('mp_arresting')
        TaskPlayAnim(sPed, 'mp_arresting', 'a_uncuff', 8.0, -8, -1, 49, 0, 0, 0, 0)
        ESX.ShowNotification('Stress İğnesi Yapıldı !')
        SetPedMoveRateOverride(PlayerId(), 10.0)
        SetRunSprintMultiplierForPlayer(PlayerId(), 1.05)
        SetSwimMultiplierForPlayer(PlayerId(),1.03)
        Citizen.Wait(1500)
        ClearPedTasks(sPed)
        DeleteObject(sProp)
        ClearAllPedProps(sPed)
        if Stress == false then
           Stress = true
            while strTimer < 1500 do
                strTimer = strTimer + 1
                local HealthS = GetEntityHealth(GetPlayerPed(-1))
                HealthS = HealthS + 0
                SetEntityHealth(GetPlayerPed(-1), HealthS)
                Citizen.Wait(1250)
            end
            if Stress == true then
               Stress = false
            ESX.ShowNotification('İğne Etkisindesin !')
                strTimer = 0
                SetPedMoveRateOverride(PlayerPedId(), 12.0)
                SetRunSprintMultiplierForPlayer(PlayerPedId(), 1.5)
                SetSwimMultiplierForPlayer(PlayerPedId(), 1.5)
            end
        else
            ESX.ShowNotification('Zaten Stres Düşürücü İğnesi Yapıldı !')
        end
    end)
end)