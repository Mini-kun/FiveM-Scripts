fx_version 'cerulean'
game 'gta5'

author 'Mini'
description 'Safe Cafe Zone - Disables hunger/thirst, PvP, weapons, and NPCs in a zone'
version '0.1.4'

shared_script '@qb-core/shared/locale.lua'

client_scripts {
    'config.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client.lua'
}

server_scripts {
    'config.lua',
    'server.lua'
}

dependencies {
    'PolyZone',
    'qb-core'
}

client_export 'IsInNeedsZone'
