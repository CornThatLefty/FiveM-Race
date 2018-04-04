RegisterServerEvent("printPlayers")
AddEventHandler("printPlayers", function()
	TriggerClientEvent("cRace:TPAll", -1)
	--TriggerClientEvent("printTime", -1)
end)

RegisterServerEvent("cRaceS:RequestRace")
AddEventHandler("cRaceS:RequestRace", function()
	local players = GetPlayers()
	for k, v in pairs(players) do
		if v ~= source then
		TriggerClientEvent("cRace:JoinRace", v, GetPlayerName(source))
		end
	end
end)

RegisterServerEvent("recieveTime")
AddEventHandler("recieveTime", function(time)
	TriggerClientEvent('chatMessage', -1, "Server", {255, 0, 0}, string.format(GetPlayerName(source) .. " finished with a time of " .. time))
end)

RegisterServerEvent("cRaceS:recieveCP")
AddEventHandler("cRaceS:recieveCP", function(acP)
	local cP = acP
	TriggerClientEvent("cRace:sendCP", -1, cP, source)
end)

RegisterServerEvent("cRaceS:AddRacer")
AddEventHandler("cRaceS:AddRacer", function()

end)

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/stoprace" then
		CancelEvent()
		TriggerClientEvent("stopRace", -1)
	elseif sm[1] == "/stopmyrace" then
			CancelEvent()
			TriggerClientEvent("stopRace", source)
	end
end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end