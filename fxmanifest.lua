--[[
	CuffsUP originally known as Handcuff and Handsup scripts 
	Version 1.0.0.3
	By BadKaiPanda[NavaRayUK(Rexzooly)] & Xander1998 (X. Cross)
]]--

fx_version 'bodacious'
game 'gta5'

author 'BadKaiPanda[NavaRayUK(Rexzooly)] & Xander1998 (X. Cross)';
description '[grimly branch]: CuffsUP';
version '1.0.0.3';

server_scripts {
	'config.lua',
	'server/server.lua',
}
client_scripts {
	'config.lua',
	'client/client.lua'
}

exports {
	'CuffsUP.TracePlayer',
	'CuffsUP.GetPedInFront',
	'CuffsUP.AceCheck'
}