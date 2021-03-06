--[[
	CuffsUP originally known as Handcuff and Handsup scripts 
	Version 1.0.0.4
	By BadKaiPanda[NavaRayUK(Rexzooly)] & Xander1998 (X. Cross)
]]--
CuffsUP.Server = {}
if CuffsUP.HandsUP.Command.Enabled then
	RegisterCommand(CuffsUP.HandsUP.Command.ChatCommand , function(source, name, raw)
		if source > 0 then
			cl, cltable = stringsplit(raw, " ");
			-- Check if we can even run the handsup function as a command 
			if cl[1] == CuffsUP.HandsUP.Command.ChatCommand or  cl == CuffsUP.HandsUP.Command.ChatCommand then
				CancelEvent();
				HandsCanRunThis = CuffsUP.AceCheck(source, "HCommand")
				if HandsCanRunThis then
					TriggerClientEvent("cuffsup:Handsup", source);
				else
					if CuffsUP.HandsUP.Command.Ace.Warning.Enabled then
						TriggerClientEvent("cuffsup:messageback", source, CuffsUP.HandsUP.Command.Ace.Warning.Message);
					end		
				end
			end
		end
	end, false)
end
RegisterCommand("curp", function(source, arg, raw)
	if source > 0 then
		cl, cltable = stringsplit(raw, " ");
		if cltable then
			if cl[1] == "curp" then
				CancelEvent();
				if type(cl[2]) == "string" then
					if cl[2] == "mute" then
						TriggerClientEvent("cuffsup:mutemode", source);
					end
					if cl[2] == "display" then
						TriggerClientEvent("cuffsup:displaymode", source);
					end
					if cl[2] == "chat" then
						TriggerClientEvent("cuffsup:chatmode", source);
					end
					if cl[2] == "reset" then
						TriggerClientEvent("cuffsup:reset", source);
					end
				end
			end
		else
			if cl == "curp" then
				TriggerClientEvent("cuffsup:messageback", source, "Please use the command with the correct syntax command {mute,chat,display,none}!")
			end
		end
	else
		print("^2CuffsUP^0: This command is for in-game RP/Streamers, no server admins.");
	end
end, false) 

if CuffsUP.Cuffs.Command.Enabled then
	RegisterCommand(CuffsUP.Cuffs.Command.ChatCommand, function(source, arg, raw)
		if source > 0 then
			cl, cltable = stringsplit(raw, " ");
			if cltable then
				if cl[1] == CuffsUP.Cuffs.Command.ChatCommand then
					CancelEvent();
					-- Check if the user is able to run this command.	
					CuffsCanRunThis = CuffsUP.AceCheck(source, "CCommand")
				
					if CuffsCanRunThis then
						if type(cl[2]) ~= "nil" then
							TriggerClientEvent("cuffsup:handcuff", tonumber(cl[2]))
						else
							TriggerClientEvent("cuffsup:handcuffcommand", source);
						end
					else
						if CuffsUP.Cuffs.Command.Ace.Warning.Enabled then
							TriggerClientEvent("cuffsup:messageback", source, CuffsUP.Cuffs.Command.Ace.Warning.Message);
						end
					end
				end
			else
				TriggerClientEvent("cuffsup:messageback", source, "no ID to cuff.");
			end
		else
			print("^2CuffsUP^0: This command wont work via the server, this is a in-game command.")
		end
	end, false);
end

if CuffsUP.Grab.Command.Enabled and CuffsUP.Undoc then 
	RegisterCommand(CuffsUP.Grab.Command.ChatCommand, function(source, arg, raw)
		if source > 0 then
			cl, cltable = stringsplit(raw, " ");
			if cltable then
				if cl[1] == CuffsUP.Grab.Command.ChatCommand then
					CancelEvent();
					GrabCanRunThis, SourceRank = CuffsUP.AceCheck(source, "GCommand");

					if GrabCanRunThis then
						if type(cl[2]) ~= "nil" then
							if source == tonumber(cl[2]) then
								TriggerClientEvent("cuffsup:messageback", source, "This was a bad idea and would of crashed your client so I stopped this action.");
							else
								TriggerClientEvent("cuffsup:grab", cl[2]);
							end
						else
							TriggerClientEvent("cuffsup:grabcommand", source);
						end
					else
						if CuffsUP.Grab.Command.Ace.Warning.Enabled then
							TriggerClientEvent("cuffsup:messageback", source, CuffsUP.Grab.Command.Ace.Warning.Message);
						end		
					end
				end
			else
				TriggerClientEvent("cuffsup:messageback", source, "No ID to grab");
			end
		else
			print("^2CuffsUP^0: This command wont work via the server, this is a in-game command.")
		end
	end, false);
end

RegisterCommand("curank", function(source, arg, raw)
	CancelEvent();
	CuffsCanRunThis, SourceRank = CuffsUP.AceCheck(source);
	TriggerClientEvent("cuffsup:messageback", source, SourceRank);
end, false);

---------------------------------------------------------------------------
-- Check This For Maybe Allowed Users?
---------------------------------------------------------------------------
RegisterServerEvent("CheckAction")
AddEventHandler("CheckAction", function(player, s_action, b_npc)
	
	if type(s_action) == "string" then
		-- Check for Cuffs Ace
		if s_action == "CCuffs" then
			CuffsCanRunThis = CuffsUP.AceCheck(source, "CCommand")
			if CuffsCanRunThis then
				if type(s_npc) ~= "nil" and b_npc then
					TriggerClientEvent("cuffsup:handcuffAI", tonumber(player));
				else
					TriggerClientEvent("cuffsup:handcuff", tonumber(player));
				end
			else
				if CuffsUP.Cuffs.Command.Ace.Warning.Enabled then
					TriggerClientEvent("cuffsup:messageback", source, CuffsUP.Cuffs.Command.Ace.Warning.Message);
				end	
			end
		end
		if s_action == "KCuffs" then
			CuffsCanRunThis = CuffsUP.AceCheck(source, "CKey")
			if CuffsCanRunThis then
				if type(b_npc) ~= "nil" and b_npc then
					TriggerClientEvent("cuffsup:handcuffAI", source, tonumber(player));
				else
					TriggerClientEvent("cuffsup:handcuff", tonumber(player));
				end
			else
				if CuffsUP.Cuffs.Command.Ace.Warning.Enabled then
					TriggerClientEvent("cuffsup:messageback", source, CuffsUP.Cuffs.Command.Ace.Warning.Message);
				end	
			end
		end
		if s_action == "CHands" then
			CuffsCanRunThis = CuffsUP.AceCheck(source, "HCommand")
			if CuffsCanRunThis then
				TriggerClientEvent("cuffsup:Handsup", tonumber(source));
			else
				if CuffsUP.HandsUP.Command.Ace.Warning.Enabled then
					TriggerClientEvent("cuffsup:messageback", source, CuffsUP.HandsUP.Command.Ace.Warning.Message);
				end	
			end
		end
		if s_action == "KHands" then
			CuffsCanRunThis = CuffsUP.AceCheck(source, "HKey")
			if CuffsCanRunThis then
				TriggerClientEvent("cuffsup:Handsup", tonumber(source));
			else
				if CuffsUP.HandsUP.Command.Ace.Warning.Enabled then
					TriggerClientEvent("cuffsup:messageback", source, CuffsUP.HandsUP.Command.Ace.Warning.Message);
				end	
			end
		end
		if s_action == "CGrab" then
			CuffsCanRunThis = CuffsUP.AceCheck(source, "GCommand")
			if CuffsCanRunThis then
				if type(b_npc) ~= "nil" and b_npc then
					TriggerClientEvent("cuffsup:grab", source, tonumber(player));
				else
					TriggerClientEvent("cuffsup:grab", tonumber(player));
				end
			else
				if CuffsUP.Grab.Command.Ace.Warning.Enabled then
					TriggerClientEvent("cuffsup:messageback", source, CuffsUP.Grab.Command.Ace.Warning.Message);
				end	
			end
		end
		if s_action == "KGrab" then
			CuffsCanRunThis = CuffsUP.AceCheck(source, "GKey")
			if CuffsCanRunThis then
				if type(b_npc) ~= "nil" and b_npc then
					TriggerClientEvent("cuffsup:grab", source, tonumber(player));
				else
					TriggerClientEvent("cuffsup:grab", tonumber(player), true, source);
				end
			else
				if CuffsUP.Grab.Key.Ace.Warning.Enabled then
					TriggerClientEvent("cuffsup:messageback", source, CuffsUP.Grab.Key.Ace.Warning.Message);
				end	
			end
		end
		if s_action == "KCG" then
			CuffsCanRunThis = CuffsUP.AceCheck(source, "CKey");
			if CuffsCanRunThis then
				CuffsCanRunThis = CuffsUP.AceCheck(source, "GKey");
				if CuffsCanRunThis then
					if type(b_npc) ~= "nil" and b_npc then
						TriggerClientEvent("cuffsup:cuffgrabAI", source, tonumber(player));
					else
						TriggerClientEvent("cuffsup:cuffgrab", tonumber(player), true, source);
					end
				else
					if CuffsUP.Grab.Key.Ace.Warning.Enabled then
						TriggerClientEvent("cuffsup:messageback", source, CuffsUP.Grab.Key.Ace.Warning.Message);
					end	
				end
			else
				if CuffsUP.Cuffs.Key.Ace.Warning.Enabled then
					TriggerClientEvent("cuffsup:messageback", source, CuffsUP.Cuffs.Key.Ace.Warning.Message);
				end
			end
		end
	else
		TriggerClientEvent("cuffsup:messageback", source, type(s_action));
	end
end)

RegisterServerEvent("Print")
AddEventHandler("Print", function(printthis)
	print(tostring(printthis));
end)

RegisterServerEvent("")
AddEventHandler("cuffsup:returnmessageback", function(n_SendTo, s_Message)
	TriggerClientEvent("cuffsup:messageback", tonumber(n_SendTo), tostring(s_Message));
end)
RegisterCommand("CuffsUP", function(source, commands, raw)
	if type(commands) ~= "nil" then
		if type(commands[1]) ~= "nil" then
			UsedCommand = string.lower(commands[1]);
			if UsedCommand == "version" then
				CuffsUP.CheckVersion(UsedCommand)
			end
			if UsedCommand == "update" then
				CuffsUP.CheckVersion(UsedCommand)
			end
			if UsedCommand == "exit" then
				CuffsUP.Exit()
			end
			if UsedCommand == "reset" then
				CuffsUP.Exit(UsedCommand)
			end
			if UsedCommand == "accept" then
				-- Server Waiting Check
				if CuffsUP.Server.Waiting == "CheckVersion" then
					CuffsUP.CheckVersion(UsedCommand);
				end
				if CuffsUP.Server.Waiting == "reset" then
					CuffsUP.Exit("reset");
				end
			end
			if UsedCommand == "cache" then
				CuffsUP.UpdateClientCache("", "")
			end
		else
			print("^2CuffsUP: ^0Hands UP and Cuffs mod By ^5BadKaiPanda[NavaRayUK(Rexzooly)] ^0& ^5Xander1998 (X. Cross)")
			print("^2CuffsUP: ^0To use any of the functions please type ^5CuffsUP: ^0and the option you like to run.")
			print("^2CuffsUP: ^0Options are: ^3Update^0, ^3Exit^0, ^3Version^0, ^3Cache[^5Function^3,^5Option^3]^1(Future)^0.")
		end
	end
end)
function CuffsUP.CheckVersion(s_action)
	if type(CuffsUP.Server.Local) == "nil" then
		local WhoAmI = GetCurrentResourceName();
		local LocalVersion = LoadResourceFile(WhoAmI, "cuffsup.txt");
		CuffsUP.Server.Local = json.decode(LocalVersion);
	end
	print("\n^2CuffsUP: ^3[Update Manager] 0.1^0")
	--print("\n^2CuffsUP: ^00,^11,^22,^33,^44,^55,^66,^77,^88,^99")
	if type(CuffsUP.Branch) ~= "nil" and CuffsUP.Branch == "master" or CuffsUP.Branch == "grimly" then
	
		if CuffsUP.Branch == "grimly" then
			ShowBranch = "^1"..CuffsUP.Branch.."^0";
		else
			ShowBranch = "^5"..CuffsUP.Branch.."^0";
		end
	
		print("^2CuffsUP: ^0Branch found, you are running on branch: ".. ShowBranch);
	else
		print("^1CuffsUP: ^0Unknown or blank branch, resetting branch back to master.");
	end	
	if type(s_action) == "string" and s_action ~= "update" then
		if s_action == "version" then
			IsSupported = "";
			if CuffsUP.Version ~= CuffsUP.Server.Local.Version then
				IsSupported = "^1Unsupported^0";
			else
				IsSupported = "^3Supported^0";
			end
			print("^2CuffsUP: ^0Current version is ^3"..CuffsUP.Version.."^0 and seems to be "..IsSupported);
		end
		if s_action == "accept" and CuffsUP.Server.Waiting == "CheckVersion" then
			PerformHttpRequest("https://raw.githubusercontent.com/rexzooly/CuffsUP/"..CuffsUP.Branch.."/cuffsup.txt", function(StatusCode, grabthis, headers)
				print("^6CuffsUP ^0get-update-info^0");
				if StatusCode == 200 then
					CuffsUP.Server.Grab = json.decode(grabthis);
					if CuffsUP.Server.Grab.Version ~= CuffsUP.Server.Local.Version then
						print("^2CuffsUP: ^0This script is out of dated, Local: ^1"..CuffsUP.Server.Local.Version.."^0, GitHub: ^2"..CuffsUP.Server.Grab.Version.."^0");
						print("^2CuffsUP: ^0You can find the update at GitHub:^3"..CuffsUP.Server.Grab.Repo.Main.."^0 bitly:^3"..CuffsUP.Server.Grab.Repo.Short.."^0");
					else
						print("^2CuffsUP: ^0Get cuffing, your up to date.^0");
					end
				else
					print("^1CuffsUP: ^0Status code: ^3"..StatusCode.."^0");
				end
				print("^2CuffsUP: ^0Update check compleated.Please press ^1[Enter]^0 to continue.^0");
				CuffsUP.Server.Waiting = nil;
			end, "GET", json.encode({}), {})
		end
	else
		if type(CuffsUP.Server.Waiting) == "nil" then
			if CuffsUP.Version ~= CuffsUP.Server.Local.Version then
				print("^1CuffsUP: ^0Script version and installed version don't match, unsupported version detected.");
				CuffsUP.Server.Waiting = nil;
				Wait(1000);
				print("^5CuffsUP: ^0Cleaned up and stopped action.");
				return false
			else
				print("^2CuffsUP: ^0Supported Script detected, would you like to check");
				print("^2CuffsUP: ^0for a update?  If yes please type ^5CuffsUP Accept");
				print("^2CuffsUP: ^0if not please type ^5CuffsUP Exit");
				CuffsUP.Server.Waiting = "CheckVersion";
				return true
			end
		else
			print("^1CuffsUP: ^0Awaiting reply to the last command you ran,");
			print("^1CuffsUP: ^0if you want to clear this action please use");
			print("^1CuffsUP: ^5CuffsUP Exit ^0to clean all tasks.");
		end
	end
end
function CuffsUP.Exit(s_action)
	if type(s_action) == "string" and s_action == "reset" then
		if type(CuffsUP.Server.Waiting) ~= "nil" and CuffsUP.Server.Waiting == "reset" then
			CuffsUP.Server = {} -- Clear the full server table
			Wait(100);
			print("^5CuffsUP: ^0Reset Done!")
			return true
		else
			print("^5CuffsUP: ^0This will clear all cashed like a script restarted");
			print("^5CuffsUP: ^0Are you sure?  If yes please type ^5CuffsUP Accept");
			print("^5CuffsUP: ^0if not please type ^5CuffsUP Exit");
			CuffsUP.Server.Waiting = "reset"
			return false
		end
	end
	if CuffsUP.Server.Waiting == nil then
		print("^5CuffsUP: ^0Nothing to clean!")
		Wait(100);
		return false
	end
	print("^5CuffsUP: ^0We are now clearning ....")
	CuffsUP.Server.Waiting = nil
	Wait(500);
	print("^5CuffsUP: ^0Cleaning Done!");
	return true
end
function CuffsUP.UpdateClientCache(s_action, option)
	print("^8CuffsUP: ^0This is a future function, sorry.")
end
-- Check if this user has this rank.
function CuffsUP.AceCheck(source, options)
	if type(source) == "nil" then
		print("CuffsUP.AceCheck: bad argument #1 to ' ' (string expected got nil)");
		return false, "Error";
	end
	
	if type(options) ~= "nil" then
		if type(options) == "table" then
			-- future options - custom config trigger for the true or false check.
			CheckThisOption = options[2];
			options = options[1];
		end
		if options == "CCommand" then
			CheckThisOption = CuffsUP.Cuffs.Command.Ace.Enabled; 
		end
		if options == "CKey" then
			CheckThisOption = CuffsUP.Cuffs.Key.Ace.Enabled;
		end
		-- Not sure why someone would want to do permission checks on grab but I added it.
		if options == "GCommand" then
			CheckThisOption = CuffsUP.Grab.Command.Ace.Enabled; 
		end
		-- Not sure why someone would want to do permission checks on grab but I added it.
		if options == "GKey" then
			CheckThisOption = CuffsUP.Grab.Key.Ace.Enabled;
		end
		-- Not sure why someone would want to do permission checks on hands up but I added it.
		if options == "HCommand" then
			CheckThisOption = CuffsUP.HandsUP.Command.Ace.Enabled; 
		end
		-- Not sure why someone would want to do permission checks on hands up but I added it.
		if options == "HKey" then
			CheckThisOption = CuffsUP.HandsUP.Key.Ace.Enabled;
		end
	else
		CheckThisOption = true;
	end
	if CheckThisOption then
		if IsPlayerAceAllowed(source, "cuffsup.boss") then
			FuncCuffsCanRunThis = true;
			FuncReturnRank = "Owner";
		else
			FuncCuffsCanRunThis = false;
			FuncReturnRank = "Civ";
		end
		-- basic Ace check
		if not FuncCuffsCanRunThis then
			if IsPlayerAceAllowed(source, "cuffsup.cuff") then
				FuncCuffsCanRunThis = true;
				FuncReturnRank = "Officer";
			else
				if options == "HCommand" or options == "HKey" then
					if IsPlayerAceAllowed(source, "cuffsup.hu") then
						FuncCuffsCanRunThis = true;
						FuncReturnRank = "Civ";
					else
						FuncReturnRank = "Tourist";
					end
				end
			end
		else
			FuncCuffsCanRunThis = true;
		end
	else
		FuncCuffsCanRunThis = true;
	end
	return FuncCuffsCanRunThis, FuncReturnRank
end
function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t = {}; i = 1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	if #t > 1 then
		return t, true
	else
		return inputstr, false
	end
end