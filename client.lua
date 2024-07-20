local showPlayerIds = true
QBCore = exports["qb-core"]:GetCoreObject()
local Users = {}
-- Toggle the visibility of player IDs when the 'ids' command is executed.
RegisterCommand('ids', function()
    showPlayerIds = not showPlayerIds
end,false)

TriggerServerEvent("unky:getUsers")
RegisterCommand("getdata", function()
	TriggerServerEvent("unky:getUsers")
   
end, false )
RegisterNetEvent("QBCore:Client:OnPlayerUnload",function ()
	 TriggerServerEvent("unky:getUsers")
end)
RegisterNetEvent('unky:refreshUsers', function(data)
		Users = data
end)
-- Main loop to draw player IDs above characters.
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        if showPlayerIds then
            for _, player in ipairs(Users) do
--                local ped1 = GetPlayerPed(GetActivePlayers()[1])
                local ped = GetPlayerPed(GetPlayerFromServerId(player.source))
  
                if DoesEntityExist(ped) then
                    local distance = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(ped))
                    if Config.debug then print(ped,distance) end
                    if distance < Config.Disctance then -- The value Config.Disctance determines the maximum distance for ID visibility
                        local playerCoords = GetEntityCoords(ped) + vector3(0, 0, Config.offsetY)
                        DrawText3D(playerCoords, player.tag)
                    end
                end
            end
        end
    end
end)

-- Function to draw text in 3D world space.
function DrawText3D(coords, text)
    local onScreen, x, y = World3dToScreen2d(coords.x, coords.y, coords.z)

    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(Config.Color.r, Config.Color.g, Config.Color.b, Config.Color.a)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextCentre(1)
        SetDrawOrigin(coords, 0)
        BeginTextCommandDisplayText('STRING')
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandDisplayText(0, 0)
        ClearDrawOrigin()
    end
end
