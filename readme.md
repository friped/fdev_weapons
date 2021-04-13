#Credit

I give credit to the developers of es_extended for the use of thier framework in this code.
https://github.com/esx-framework/es_extended/graphs/contributors

#Requirements

This code require the use of es_extended(https://github.com/esx-framework/es_extended/) it's mainly developed for version 1.2.


#Installation

1. Open up client/main.lua in es_extended and find:

RegisterNetEvent('esx:addInventoryItem')
AddEventHandler('esx:addInventoryItem', function(item, count, showNotification)
	for k,v in ipairs(ESX.PlayerData.inventory) do
		if v.name == item then
			ESX.UI.ShowInventoryItemNotification(true, v.label, count - v.count)
			ESX.PlayerData.inventory[k].count = count
			break
		end
	end

	if showNotification then
		ESX.UI.ShowInventoryItemNotification(true, item, count)
	end

	if ESX.UI.Menu.IsOpen('default', 'es_extended', 'inventory') then
		ESX.ShowInventory()
	end
end)

RegisterNetEvent('esx:removeInventoryItem')
AddEventHandler('esx:removeInventoryItem', function(item, count, showNotification)
 	for k,v in ipairs(ESX.PlayerData.inventory) do
		if v.name == item then
			ESX.UI.ShowInventoryItemNotification(false, v.label, v.count - count)
			ESX.PlayerData.inventory[k].count = count
			break
		end
	end

	if showNotification then
		ESX.UI.ShowInventoryItemNotification(false, item, count)
	end

	if ESX.UI.Menu.IsOpen('default', 'es_extended', 'inventory') then
		ESX.ShowInventory()
	end
end)

2. Remove or mark out from both 'esx:addInventoryItem' and 'esx:removeInventoryItem':

	ESX.UI.ShowInventoryItemNotification(false, v.label, v.count - count)

3. Setup the weapons and components in Config.lua file according to what weapons you want to use on your server.
	For weapons with out ammunition such as the stun gun leave the blank and for throwables use the weapon item as the ammoItem just like the pre-setup is made.

4. Edit the fdev_weapons.sql so weight works for the server your running.

5. Run the fdev_weapon.sql into your database and if you add custom weapons or components remember to add them as well.


