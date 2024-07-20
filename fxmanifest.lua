fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Erenoske, Berkayediz'
description 'EE Simple Show ID Script'
shared_scripts{
    '@ox_lib/init.lua',
    'config.lua',
}
server_scripts{
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}
client_scripts {
    'client.lua'
} 
