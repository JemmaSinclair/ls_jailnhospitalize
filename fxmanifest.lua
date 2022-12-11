fx_version "adamant"
game "gta5"

-- Resource Info
name 'ls_jailnhospitalize'
description 'FiveM Standalone Hospital and Jailing Script'
author 'KaraTheNeko'
version '1.0.0'

shared_script 'config.lua' 

server_scripts {
	'server.lua'
}
client_scripts {
	'client.lua'
}

dependencies {
	'ls_essentials',
	'cc-chat',
	'/onesync'
}
