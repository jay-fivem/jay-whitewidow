fx_version 'cerulean'
game 'gta5'

author 'Jay FiveM'
description 'Not 100% finished script for white widow mlo.'

shared_script 'config.lua'
client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client.lua',
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua',
}
