ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
end)

local lastAmmoCounts = {}
local ammoCounts = {}
local ammoGive = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)

        local playerPed = GetPlayerPed(-1)

        for k, v in pairs(Config.Weapons) do
            local weaponHash = GetHashKey(v.weapon)
            local ammoType = GetPedAmmoTypeFromWeapon(playerPed, weaponHash)

            if HasPedGotWeapon(playerPed, weaponHash, false) then
                local ammoCount = GetPedAmmoByType(playerPed, ammoType)
                local maxAmmo, maxAmmoCount = GetMaxAmmoByType(playerPed, ammoType)
                local ammoCountCorrection

                if ammoCounts[ammoType] ~= nil then

                    if lastAmmoCounts[ammoType] == nil then
                        lastAmmoCounts[ammoType] = ammoCount
                    end

                    if ammoCounts[ammoType] > ammoCount and lastAmmoCounts[ammoType] ~= ammoCount and not ammoGive then
                        if ammoCounts[ammoType] > maxAmmoCount then
                            
                            ammoCountCorrection = lastAmmoCounts[ammoType] - ammoCount
                            ammoCountCorrection = ammoCounts[ammoType] - ammoCountCorrection

                            SetPedAmmoByType(playerPed, ammoType, ammoCountCorrection)
                            ammoCount = GetPedAmmoByType(playerPed, ammoType)
                            
                        else
                            ammoCountCorrection = ammoCount
                        end

                        ammoCounts[ammoType] = ammoCountCorrection
                        lastAmmoCounts[ammoType] = ammoCount

                        TriggerServerEvent('FDev:AmmoUpdate', v.ammoItem, ammoCountCorrection)
                    elseif ammoCounts[ammoType] < ammoCount and not ammoGive then
                        ammoCounts[ammoType] = ammoCount
                        lastAmmoCounts[ammoType] = ammoCount
                        TriggerServerEvent('FDev:AmmoUpdate', v.ammoItem, ammoCount)
                    end
                end

            elseif v.weapon == v.ammoItem and ammoCount[ammoType] > 0 then
                ammoCount[ammoType] = 0
                lastAmmoCounts[ammoType] = 0
                
                TriggerServerEvent('FDev:AmmoUpdate', v.ammoItem, 0)
            end
        end
    end
end)


AddEventHandler('esx:onPlayerSpawn', function()
    Citizen.Wait(2000)
    TriggerServerEvent('FDev:WeaponSync')
end)

RegisterNetEvent('FDev:UpdateWeapon')  
AddEventHandler('FDev:UpdateWeapon', function(weaponName, ammoCount, removeWeapon, ammoOnly, weaponSync)
    local playerPed = GetPlayerPed(-1)
    local weaponHash = GetHashKey(weaponName)

    if weaponSync then
        local ammoType = GetPedAmmoTypeFromWeapon(playerPed, weaponHash)
        ammoCounts[ammoType] = 0
        SetPedAmmoByType(playerPed, ammoType, 0)
    end
  
    if not ammoOnly then
        
        if not removeWeapon then
            ammoGive = true

            local ammoType = GetPedAmmoTypeFromWeapon(playerPed, weaponHash)
            ammoCounts[ammoType] = ammoCount

            GiveWeaponToPed(playerPed, weaponHash, 0, false, false)
            SetPedAmmoByType(playerPed, ammoType, ammoCount)

            ammoGive = false
        else
            RemoveWeaponFromPed(playerPed, weaponHash)
        end
    else
        ammoGive = true

        local ammoType = GetPedAmmoTypeFromWeapon(playerPed, weaponHash)
        ammoCounts[ammoType] = ammoCount

        SetPedAmmoByType(playerPed, ammoType, ammoCount)
        lastAmmoCounts[ammoType] = GetPedAmmoByType(playerPed, ammoType)
        ammoGive = false
    end
end)

RegisterNetEvent('FDev:UpdateWeaponComponent')
AddEventHandler('FDev:UpdateWeaponComponent', function(weaponName, componentHash, remove)
    local playerPed = GetPlayerPed(-1)
    local weaponHash = GetHashKey(weaponName)

    if not remove then
        GiveWeaponComponentToPed(playerPed, weaponHash, componentHash)
    else
        RemoveWeaponComponentFromPed(playerPed, weaponHash, componentHash)
    end
    
end)