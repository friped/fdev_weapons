ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('FDev:WeaponSync')
AddEventHandler('FDev:WeaponSync', function()
    local playerId = source
    local xPlayer = ESX.GetPlayerFromId(playerId)
  
    for k, v in pairs(Config.Weapons) do
        if xPlayer.getInventoryItem(v.item) ~= nil then
            
            local weaponItem = xPlayer.getInventoryItem(v.item)

            if weaponItem and weaponItem.count > 0 then
                local ammoItem = xPlayer.getInventoryItem(v.ammoItem)
                local ammoCount = 0

                if ammoItem and ammoItem.count > 0 then
                    ammoCount = ammoItem.count
                end

                TriggerClientEvent('FDev:UpdateWeapon', playerId, v.weapon, ammoCount, false, false, true)
            end
        end
    end

    for k, v in pairs(Config.WeaponComponents) do 
        if xPlayer.getInventoryItem(v.item) ~= nil then

            local componentItem = xPlayer.getInventoryItem(v.item)

            if componentItem and componentItem.count > 0 then
                TriggerClientEvent('FDev:UpdateWeaponComponent', playerId, v.weapon, v.componentHash, false)
            end
        end
    end
end)

RegisterNetEvent('FDev:InventoryUpdate')
AddEventHandler('FDev:InventoryUpdate', function(playerId, item, amount, remove)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    local itemCount = xPlayer.getInventoryItem(item).count
    
    for k, v in pairs(Config.Weapons) do
        if item == v.item then
           
            if itemCount < 1 then
                local ammoCount = 0

                if xPlayer.getInventoryItem(v.ammoItem) ~= nil then
                    ammoCount = xPlayer.getInventoryItem(v.ammoItem).count
                end

                TriggerClientEvent('FDev:UpdateWeapon', playerId, v.weapon, ammoCount, true, false, false)
            else
                local ammoCount = 0

                if xPlayer.getInventoryItem(v.ammoItem) ~= nil then
                    ammoCount = xPlayer.getInventoryItem(v.ammoItem).count
                end

                TriggerClientEvent('FDev:UpdateWeapon', playerId, v.weapon, ammoCount, false, false, false)
            end
        elseif item == v.ammoItem then
            TriggerClientEvent('FDev:UpdateWeapon', playerId, v.weapon, itemCount, remove, true, false)
            break
        end
    end

    for k, v in pairs(Config.WeaponComponents) do 
        if item == v.item then
            if itemCount < 1 then
                TriggerClientEvent('FDev:UpdateWeaponComponent', playerId, v.weapon, v.componentHash, true)
            else
                TriggerClientEvent('FDev:UpdateWeaponComponent', playerId, v.weapon, v.componentHash, false)
            end
        end
    end
end)

local ammoUpdate = false

RegisterNetEvent('FDev:AmmoUpdate')
AddEventHandler('FDev:AmmoUpdate', function(ammoItem, ammoCount)
    ammoUpdate = true

    local playerId = source
    local xPlayer = ESX.GetPlayerFromId(playerId)
   
   
      
    for k, v in pairs(Config.Weapons) do
        if ammoItem == v.ammoItem then
            xPlayer.setInventoryItem(ammoItem, ammoCount)
        end
    end

    ammoUpdate = false
end)

AddEventHandler('esx:onAddInventoryItem', function(playerId, itemName, itemCount)
    TriggerEvent('FDev:InventoryUpdate', playerId, itemName, itemCount, false)
end)

AddEventHandler('esx:onRemoveInventoryItem', function(playerId, itemName, itemCount)
    if not ammoUpdate then
        TriggerEvent('FDev:InventoryUpdate', playerId, itemName, itemCount, true)
    end
end)