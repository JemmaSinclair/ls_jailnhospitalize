
RegisterCommand('jail', function(source, args)
if #args < 2 then
			TriggerEvent('chat:addMessage', {
			templateId =  'ccChat',
			multiline =  false,
			args = {
			'#00000060',
			'fa-solid fa-handcuffs',
			'Jailler',
			'',
			'Invalid Usage: /jail <id> <time>'
		}})	return;
end
if GetPlayerIdentifiers(args[1])[1] ~= nil then
	if tonumber(args[2]) ~= nil and tonumber(args[2]) > JailMinTime and tonumber(args[2]) < JailMaxTime then			
		TriggerClientEvent('chat:addMessage', -1 , {
			templateId =  'ccChat',
			multiline =  false,
			args = {
			'#00000060',
			'fa-solid fa-handcuffs',
			'Jailler',
			'',
			GetPlayerName(args[1])..' has been jailed for '..tonumber(args[2])..' seconds.'
		}})	
		TriggerClientEvent('ls:jail', tonumber(args[1]), tonumber(args[2]))
		exports.ls_essentials:sendDiscord(GetPlayerName(source), "Used /jail on **"..GetPlayerName(args[1]).."** for **".. tonumber(args[2]).."** seconds.")	
	else
		TriggerClientEvent('chatMessage', source, "^1ERROR: Invalid usage. ^7Usage: /jail <id> <time>");
	end
else
TriggerClientEvent('chatMessage', source, "^1ERROR: Invalid usage. ^7Usage: /jail <id> <time>");
end
end, false)

RegisterCommand('unjail', function(source, args)
if #args < 1 then 
	TriggerClientEvent('chatMessage', source, "^1ERROR: Invalid usage. ^7Usage: /unjail <id>");
	return;
end
if GetPlayerIdentifiers(args[1])[1] ~= nil then
		TriggerClientEvent('ls:unjail', args[1])
	else
		TriggerClientEvent('chatMessage', source, "^1ERROR: Invalid usage. ^7Usage: /unjail <id>")
end

end, JailPermissions)




RegisterNetEvent('ls:unjailmsg')
AddEventHandler('ls:unjailmsg', function(name)
TriggerClientEvent('chat:addMessage', -1 , {
	templateId =  'ccChat',	
	multiline =  false,
	args = {
	'#00000060',
	'fa-solid fa-handcuffs',
	'Jailler',
	'',
	name..' has been released from jail.'
}})	
exports.ls_essentials:sendDiscord('Jail', "**"..name.."** has been released from jail.")
end)

RegisterNetEvent('ls:erexitmsg')
AddEventHandler('ls:erexitmsg', function(name)
TriggerClientEvent('chat:addMessage', -1 , {
	templateId =  'ccChat',	
	multiline =  false,
	args = {
	'#00000060',
	'fa-solid fa-hospital',
	'Hospital',
	'',
	name..' has been released from the hospital.'
}})	
	exports.ls_essentials:sendDiscord('ER', "**"..name.."** has been released from the hospital.")
end)


RegisterCommand('er', function(source, args)
local hospital = nil
if #args < 3 then
	TriggerClientEvent('chatMessage', source, "^1ERROR: Invalid usage. ^7Usage: /er <id> <hospital> <time> <reason>");
	return;
end
if tonumber(args[2]) == 0 then
hospital = 'the Morgue'
location = vector3(240.37, -13879.74, 33.74)
elseif tonumber(args[2]) == 1 then
hospital = 'Paleto Medical Center'
location = vector3(-246.09, 6328.29, 32.43)
elseif tonumber(args[2]) == 2 then
hospital = 'Sandy Medical Center'
location = vector3(1839.84, 3674.02, 34.28)
elseif tonumber(args[2]) == 3 then
hospital = 'Mount Zonah Medical Center'
location = vector3(-448.63, -343.22, 34.5)
elseif tonumber(args[2]) == 4 then
hospital = 'Pillbox Hill Medical Center'
location = vector3(300.26, -579.78, 43.26)
elseif tonumber(args[2]) == 5 then
hospital = 'Central Medical Center'
location = vector3(342, -1397.7, 32.51)
else
TriggerClientEvent('chatMessage', source, "^1ERROR: Invalid usage. ^7Usage0: /er <id> <hospital> <time> <reason>");
end

if GetPlayerIdentifiers(args[1])[1] ~= nil then
	if tonumber(args[2]) ~= nil and tonumber(args[3]) > ERMinTime and tonumber(args[3]) < ERMaxTime then			
		TriggerClientEvent('chat:addMessage', -1 , {
			templateId =  'ccChat',
			multiline =  false,
			args = {
			'#00000060',
			'fa-solid fa-hospital',
			'Hospital',
			'',
			GetPlayerName(args[1])..' has been sent to '..hospital..' for '..tonumber(args[3])..' seconds because: '..table.concat(args, ' ', 4, #args).."."
		}});
		exports.ls_essentials:sendDiscord(GetPlayerName(source), "Used /er on **"..GetPlayerName(args[1]).."** for **".. tonumber(args[3]).."** seconds at **"..hospital.."** because: **"..table.concat(args, ' ', 4, #args).."**.")
		TriggerClientEvent('ls:er', tonumber(args[1]), location, tonumber(args[3]))
	else
TriggerClientEvent('chatMessage', source, "^1ERROR: Invalid usage. ^7Usage1: /er <id> <hospital> <time> <reason>");
	end
else
TriggerClientEvent('chatMessage', source, "^1ERROR: Invalid usage. ^7Usage2: /er <id> <hospital> <time> <reason>");
end
end, ERPermissions)




RegisterCommand('unjail', function(source, args)
if #args < 1 then 
	TriggerClientEvent('chatMessage', source, "^1ERROR: Invalid usage. ^7Usage: /unjail <id>");
	return;
end
if GetPlayerIdentifiers(args[1])[1] ~= nil then
		TriggerClientEvent('ls:unjail', args[1])
	else
		TriggerClientEvent('chatMessage', source, "^1ERROR: Invalid usage. ^7Usage: /unjail <id>")
end

end, UnjailPermissions)

