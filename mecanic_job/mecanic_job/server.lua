
---annonce
RegisterServerEvent('Mechanic:Ouvert')
AddEventHandler('Mechanic:Ouvert', function()
    local _source  = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if Config.NotificationType == "esx" then
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], Config.JobUtiliser, '~b~Annonce Mecano', 'Mecano Ouvert', 'CHAR_CARSITE2', 7)
        elseif Config.NotificationType == "ox" then
            sendNotification(xPlayers[i], "info", 'Annonce Mecano', 'Mecano Ouvert')
        elseif Config.NotificationType == "okok" then
            sendNotification(xPlayers[i], "info", 'Annonce Mecano', 'Mecano Ouvert')
        end
    end
end)

RegisterServerEvent('Mechanic:Fermer')
AddEventHandler('Mechanic:Fermer', function()
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers    = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if Config.NotificationType == "esx" then
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], Config.JobUtiliser, '~b~Annonce Mecano', 'Mecano Fermer', 'CHAR_CARSITE2', 7)
        elseif Config.NotificationType == "ox" then
            sendNotification(xPlayers[i], "info", 'Annonce Mecano', 'Mecano Fermer')
        elseif Config.NotificationType == "okok" then
            sendNotification(xPlayers[i], "info", 'Annonce Mecano', 'Mecano Fermer')
        end
    end
end)

RegisterServerEvent('Mechanic:Perso')
AddEventHandler('Mechanic:Perso', function(message)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers    = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if Config.NotificationType == "esx" then
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], Config.JobUtiliser, '~b~Annonce Mecano', message, 'CHAR_CARSITE2', 7)
        elseif Config.NotificationType == "ox" then
            sendNotification(xPlayers[i], "info", 'Annonce Mecano', message)
        elseif Config.NotificationType == "okok" then
            sendNotification(xPlayers[i], "info", 'Annonce Mecano', message)
        end
    end
end)

---coffre
local borderstash = {
    id = 'coffre_mecano',
    label = 'Coffre mecano',
    slots = 90,
    weight = 2000000,
    owner = 'steam:'
}

AddEventHandler('onServerResourceStart', function(resourceName)
    if resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName() then
        Wait(0)
		exports.ox_inventory:RegisterStash(borderstash.id, borderstash.label, borderstash.slots, borderstash.weight, borderstash.owner)
    end
end)


---item

local ox_inventory = exports.ox_inventory

RegisterNetEvent('osc:removeitem')
AddEventHandler('osc:removeitem', function(item, amount)
local source = source

ox_inventory:RemoveItem(source, item, amount)
end)
---garage

RegisterNetEvent("testserversidemeca", function(data) 
    local source = source 
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= data.prix then 
        xPlayer.removeMoney(data.prix)
        xPlayer.showNotification("Vous avez sortie : ~b~"..data.name.."")
        TriggerClientEvent("clientsidemeca", source, data)
    else xPlayer.showNotification("Vous avez pas assez d'argent") end 
end)

---boss action 
RegisterServerEvent('Recruter')
AddEventHandler('Recruter', function(target, job, grade)
    local _source = source
    local sourceXPlayer = ESX.GetPlayerFromId(_source)
    local targetXPlayer = ESX.GetPlayerFromId(target)
    targetXPlayer.setJob(job, grade)
    TriggerClientEvent('esx:showNotification', _source, "Vous avez ~g~recruté " .. targetXPlayer.name .. "~w~.")
    TriggerClientEvent('esx:showNotification', target, "Vous avez été ~g~embauché par " .. sourceXPlayer.name .. "~w~.")
end)


RegisterServerEvent('Virer')
AddEventHandler('Virer', function(target)
    local _source = source
    local sourceXPlayer = ESX.GetPlayerFromId(_source)
    local targetXPlayer = ESX.GetPlayerFromId(target)
    local job = "unemployed"
    local grade = "0"
    if (sourceXPlayer.job.name == targetXPlayer.job.name) then
        targetXPlayer.setJob(job, grade)
        TriggerClientEvent('esx:showNotification', _source, "Vous avez ~r~viré " .. targetXPlayer.name .. "~w~.")
        TriggerClientEvent('esx:showNotification', target, "Vous avez été ~g~viré par " .. sourceXPlayer.name .. "~w~.")
    else
        TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas ~r~l'autorisation~w~.")
    end
end)

RegisterServerEvent('Promotion')
AddEventHandler('Promotion', function(target)
	local _source = source

	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if (targetXPlayer.job.grade == 3) then
		TriggerClientEvent('esx:showNotification', _source, "Vous ne pouvez pas plus ~b~promouvoir~w~ d'avantage.")
	else
		if (sourceXPlayer.job.name == targetXPlayer.job.name) then
			local grade = tonumber(targetXPlayer.job.grade) + 1
			local job = targetXPlayer.job.name

			targetXPlayer.setJob(job, grade)

			TriggerClientEvent('esx:showNotification', _source, "Vous avez ~b~promu " .. targetXPlayer.name .. "~w~.")
			TriggerClientEvent('esx:showNotification', target, "Vous avez été ~b~promu~s~ par " .. sourceXPlayer.name .. "~w~.")
		end
	end
end)

RegisterServerEvent('Retrograder')
AddEventHandler('Retrograder', function(target)
	local _source = source

	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if (targetXPlayer.job.grade == 0) then
		TriggerClientEvent('esx:showNotification', _source, "Vous ne pouvez pas plus ~r~rétrograder~w~ d'avantage.")
	else
		if (sourceXPlayer.job.name == targetXPlayer.job.name) then
			local grade = tonumber(targetXPlayer.job.grade) - 1
			local job = targetXPlayer.job.name

			targetXPlayer.setJob(job, grade)

			TriggerClientEvent('esx:showNotification', _source, "Vous avez ~r~rétrogradé " .. targetXPlayer.name .. "~w~.")
			TriggerClientEvent('esx:showNotification', target, "Vous avez été ~r~rétrogradé par " .. sourceXPlayer.name .. "~w~.")
		else
			TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas ~r~l'autorisation~w~.")
		end
	end
end)

---gestion argent

ESX.RegisterServerCallback('getSocietyMoney', function(source, cb)
	  local society = Config.society
	  TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
        print(account.money)
		cb(account.money)
	  end)
end)



RegisterServerEvent("mecanodepotentreprise")
AddEventHandler("mecanodepotentreprise", function(money)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local total = money
    local xMoney = xPlayer.getAccount("bank").money
    
    TriggerEvent('esx_addonaccount:getSharedAccount', Config.society, function (account)
        if xMoney >= total then
            account.addMoney(total)
            xPlayer.removeAccountMoney('bank', total)
            TriggerClientEvent('esx:showAdvancedNotification', source, 'Banque Société', "~b~mecano", "Vous avez déposé ~g~"..total.." $~s~ dans votre ~b~entreprise", 'CHAR_BANK_FLEECA', 9)
        else
            TriggerClientEvent('esx:showNotification', source, "<C>~r~Vous n'avez pas assez d'argent !")
        end
    end)   
end)

RegisterServerEvent("mecanoRetraitEntreprise")
AddEventHandler("mecanoRetraitEntreprise", function(money)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local total = money
	local xMoney = xPlayer.getAccount("bank").money
	
	TriggerEvent('esx_addonaccount:getSharedAccount', Config.society, function (account)
		if account.money >= total then
			account.removeMoney(total)
			xPlayer.addAccountMoney('bank', total)
			TriggerClientEvent('esx:showAdvancedNotification', source, 'Banque Société', "~b~mecano", "Vous avez retiré ~g~"..total.." $~s~ de votre ~b~entreprise", 'CHAR_BANK_FLEECA', 9)
		else
			TriggerClientEvent('esx:showAdvancedNotification', source, 'Banque Société', "~b~mecano", "Vous avez pas assez d'argent dans votre ~b~entreprise", 'CHAR_BANK_FLEECA', 9)
		end
	end)
end) 


