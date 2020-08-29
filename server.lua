ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('morphine', function(source)
    local _source = source
	xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.getInventoryItem('morphine').count > 0 then
        TriggerClientEvent('dreamTeamPharmacy:morphine', _source)
        xPlayer.removeInventoryItem('morphine', 1)
    end
end)

ESX.RegisterUsableItem('adrenalin', function(source)
    local _source = source
	xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.getInventoryItem('adrenalin').count > 0 then
        TriggerClientEvent('dreamTeamPharmacy:adrenalin', _source)
        xPlayer.removeInventoryItem('adrenalin', 1)
    end
end)

ESX.RegisterUsableItem('stressigne', function(source)
    local _source = source
	xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.getInventoryItem('stressigne').count > 0 then
        TriggerClientEvent('dreamTeamPharmacy:stress', _source)
        xPlayer.removeInventoryItem('stressigne', 1)
    end
end)