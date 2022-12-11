jailTime = nil;
hospitaltime = nil;
hospital = nil;

TriggerEvent('chat:addSuggestion', '/jail', 'Jail a player', {
    { name="Server ID", help="The players server id." },
    { name="Time (in seconds)", help="Min: "..JailMinTime.. " Max: ".. JailMaxTime}
})

TriggerEvent('chat:addSuggestion', '/unjail', 'Unjails a player', {
    { name="Server ID", help="The players server id." }
})

TriggerEvent('chat:addSuggestion', '/er', 'Hospitalizes a player.', {
    { name="Server ID", help="The players server id." },
    { name="Hospital", help="0 = Morgue | 1 = Paleto | 2 = Sandy | 3 = Zonah | 4 = Pillbox | 5 = Central"},
    { name="Time (in seconds)", help="Min: "..ERMinTime.. " Max: ".. ERMaxTime},
    { name="Reason", help="Give a detailed reason for the hospitalization."}
})

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(15000)
	if jailtime ~= nil and jailtime > 0 then
	jailtime = jailtime - 15
		if jailtime > 0 then
		TriggerEvent('chat:addMessage', {
			templateId =  'ccChat',
			multiline =  false,
			args = {
			'#00000060',
			'fa-solid fa-handcuffs',
			'Jailler',
			'',
			'Your time has been reduced by 15 seconds.  You have '..jailtime..' seconds left.'
		}})	
		print('Time reduced by 15 seconds.')
	elseif jailtime == 0 or jailtime < 0 then
		TriggerEvent('ls:unjail', source)
		end
	end
  end
  while true do
	Citizen.Wait(15000)
	if hospitaltime ~= nil and hospitaltime > 0 then
	hospitaltime = hospitaltime - 15
		if hospitaltime > 0 then
		TriggerEvent('chat:addMessage', {
			templateId =  'ccChat',
			multiline =  false,
			args = {
			'#00000060',
			'fa-solid fa-hospital',
			'Hospital',
			'',
			'Your time has been reduced by 15 seconds.  You have '..hospitaltime..' seconds left.'
		}})	
		print('Time reduced by 15 seconds.')
	elseif hospitaltime == 0 or hospitaltime < 0 then
		TriggerEvent('ls:erexit', source, hospital)
		end
	end
end
end)

Citizen.CreateThread(function()
  while true do
	Citizen.Wait(15000)
	if hospitaltime ~= nil and hospitaltime > 0 then
	hospitaltime = hospitaltime - 15
		if hospitaltime > 0 then
		TriggerEvent('chat:addMessage', {
			templateId =  'ccChat',
			multiline =  false,
			args = {
			'#00000060',
			'fa-solid fa-hospital',
			'Hospital',
			'',
			'Your time has been reduced by 15 seconds.  You have '..hospitaltime..' seconds left.'
		}})	
		print('Time reduced by 15 seconds.')
	elseif hospitaltime == 0 or hospitaltime < 0 then
		TriggerEvent('ls:erexit', source)
		end
	end
end
end)
RegisterNetEvent('ls:jail')
AddEventHandler('ls:jail', function(time)
local ped = GetPlayerPed(-1)
jailtime = time
SetEveryoneIgnorePlayer(PlayerId(), true)
DoScreenFadeOut(1000)
Citizen.Wait(2000)
SetEntityCoords(GetPlayerPed(PlayerId()), 1668.42, 2644.96, 45.56, 284.11,	true,	false, false, false)
Citizen.Wait(2000)
DoScreenFadeIn(1000)
end)

RegisterNetEvent('ls:er')
AddEventHandler('ls:er', function(location, time)
local ped = GetPlayerPed(-1)
hospitaltime = time
hospital = location
SetEveryoneIgnorePlayer(PlayerId(), true)
DoScreenFadeOut(1000)
Citizen.Wait(2000)
SetEntityCoords(GetPlayerPed(PlayerId()), 263.57, -1353.52, 24.54, 284.11,	true,	false, false, false)
Citizen.Wait(2000)
DoScreenFadeIn(1000)
end)

RegisterNetEvent('ls:unjail')
AddEventHandler('ls:unjail', function(source)
jailtime = nil
local pID = NetworkGetPlayerIndexFromPed(GetPlayerPed(-1))
print('Jail time over.')
DoScreenFadeOut(1000)
Citizen.Wait(2000)
SetEntityCoords(GetPlayerPed(PlayerId()), 1848.59, 2586.31, 45.67, 275,	true,	false, false, false)
Citizen.Wait(2000)
DoScreenFadeIn(1000)
TriggerServerEvent('ls:unjailmsg', GetPlayerName(pID))
end)



RegisterNetEvent('ls:erexit')
AddEventHandler('ls:erexit', function(source, loc)
local v = hospital
local x, y, z = table.unpack(v)
hospitaltime = nil
local pID = NetworkGetPlayerIndexFromPed(GetPlayerPed(-1))
print('ER time over.')
DoScreenFadeOut(1000)
Citizen.Wait(2000)
SetEntityCoords(GetPlayerPed(PlayerId()), x, y, z, 90,	true,	false, false, false)
Citizen.Wait(2000)
DoScreenFadeIn(1000)
TriggerServerEvent('ls:erexitmsg', GetPlayerName(pID))
end)

RegisterCommand('htime', function()
print(hospitaltime)
print(hospital)
print(x..y..z)
end, false)

