QBCore = exports["qb-core"]:GetCoreObject()

function sendUsers()
    local Users = {} 
    local xPlayers = QBCore.Functions.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer =  QBCore.Functions.GetPlayer(xPlayers[i])
        local response = MySQL.query.await('SELECT `online_time` FROM `players` WHERE `citizenid` = ?', {
            xPlayer.PlayerData.citizenid
        })
        local time = response[1].online_time
        if(Config.debug) then print(time) end
        if time  < Config.newPlayerTime  then
            table.insert(Users, {
                source = xPlayers[i],
                name = xPlayer.PlayerData.charinfo.firstname..xPlayer.PlayerData.charinfo.lastname,
                tag = '新市民'
            })   
        else
        
        end  
    end
    TriggerClientEvent('unky:refreshUsers', -1, Users)
end
lib.cron.new(Config.cronExpress, sendUsers, nil)
RegisterNetEvent("unky:getUsers",function ()
    sendUsers()
end)