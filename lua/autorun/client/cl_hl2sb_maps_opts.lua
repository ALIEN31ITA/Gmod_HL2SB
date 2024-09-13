hl2sb = hl2sb or {}

// Yes i am a terrible coder
// Help gained from the Gmod Discord, i am not a coder!!

// KILLICONS
//NPC LIST

local killIconColor = Color( 255, 80, 0, 255 )

killicon.Add( "npc_helicopter", "hud/hl2sb/killicons/npc_helicopter", killIconColor )
killicon.Add( "grenade_helicopter", "hud/hl2sb/killicons/grenade_helicopter", killIconColor )
killicon.Add( "npc_antlion", "hud/hl2sb/killicons/npc_antlion", killIconColor )
killicon.Add( "npc_antlionguard", "hud/hl2sb/killicons/npc_antlionguard", killIconColor )
killicon.Add( "npc_barnacle", "hud/hl2sb/killicons/npc_barnacle", killIconColor )
killicon.Add( "npc_combinedropship", "hud/hl2sb/killicons/npc_combinedropship", killIconColor )
killicon.Add( "npc_combinegunship", "hud/hl2sb/killicons/npc_combinegunship", killIconColor )
killicon.Add( "npc_manhack", "hud/hl2sb/killicons/npc_manhack", killIconColor )
killicon.Add( "npc_rollermine", "hud/hl2sb/killicons/npc_rollermine", killIconColor )
killicon.Add( "npc_turret_floor", "hud/hl2sb/killicons/npc_turret_floor", killIconColor )
killicon.Add( "npc_turret_ceiling", "hud/hl2sb/killicons/npc_turret_ceiling", killIconColor )
killicon.Add( "npc_strider", "hud/hl2sb/killicons/npc_strider", killIconColor )
killicon.Add( "npc_sniper", "hud/hl2sb/killicons/npc_sniper", killIconColor )
killicon.Add( "npc_stalker", "hud/hl2sb/killicons/env_laser", killIconColor )

//VEHICLES
killicon.Add( "prop_vehicle_apc", "hud/hl2sb/killicons/prop_vehicle_apc", killIconColor )
killicon.Add( "prop_vehicle_airboat", "hud/hl2sb/killicons/prop_vehicle_airboat", killIconColor )
killicon.Add( "prop_vehicle_jeep", "hud/hl2sb/killicons/prop_vehicle_jeep", killIconColor )
killicon.Add( "prop_vehicle_prisoner_pod", "hud/hl2sb/killicons/prop_vehicle_prisoner_pod", killIconColor )

//WORLD
killicon.Add( "env_explosion", "hud/hl2sb/killicons/env_explosion", killIconColor )
killicon.Add( "env_headcrabcanister", "hud/hl2sb/killicons/env_headcrabcanister", killIconColor )
killicon.Add( "env_laser", "hud/hl2sb/killicons/env_laser", killIconColor )
killicon.Add( "env_fire", "hud/hl2sb/killicons/env_fire", killIconColor )
killicon.Add( "entityflame", "hud/hl2sb/killicons/env_fire", killIconColor )
killicon.Add( "concussiveblast", "hud/hl2sb/killicons/env_explosion", killIconColor )

//WEAPONS
killicon.Add( "item_ammo_crate", "hud/hl2sb/killicons/item_ammo_crate", killIconColor )
killicon.Add( "weapon_annabelle", "hud/hl2sb/killicons/weapon_annabelle", killIconColor )
killicon.Add( "weapon_alyxgun", "hud/hl2sb/killicons/weapon_alyxgun", killIconColor )

//EP2
killicon.Add( "npc_antlion_worker", "hud/hl2sb/killicons/npc_antlion_worker", killIconColor )
killicon.Add( "grenade_spit", "hud/hl2sb/killicons/grenade_spit", killIconColor )
killicon.Add( "npc_hunter", "hud/hl2sb/killicons/npc_hunter", killIconColor )
killicon.Add( "hunter_flechette", "hud/hl2sb/killicons/hunter_flechette", killIconColor )
killicon.Add( "weapon_striderbuster", "hud/hl2sb/killicons/weapon_striderbuster", killIconColor )

local hl2sb_getmap = game.GetMap()

hook.Add( "AddToolMenuCategories", "hl2sbCategory", function()
	spawnmenu.AddToolCategory( "Utilities", "HL2 Sandbox", "#HL2: Sandbox" )
end )

hook.Add( "PopulateToolMenu", "hl2sb_Currentmap_Settings", function()
	spawnmenu.AddToolMenuOption( "Utilities", "HL2 Sandbox", "Current Map", "#Current Map", "", "", function(panel)
		panel:ClearControls()
		panel:Help(hl2sb.mapChapter .. hl2sb.mapTitle)

		if hl2sb_getmap == "gmhl2_coast_01" or hl2sb_getmap == "gmhl2_coast_bridge" then
			panel:Help("One time only settings")

			local HW17_B_ClearCars = panel:Button("Clear Wagons")
			function HW17_B_ClearCars:DoClick()
				net.Start("request_hl2sb_HW17_Bridge_ClearCars")
				net.SendToServer()
			end
		end

		if hl2sb_getmap == "gmhl2_trainstation_02" then
			panel:Help("One time only settings")

			local PI_TS2_ClearProps = panel:Button("Clear Furniture Blocks")
			function PI_TS2_ClearProps:DoClick()
				net.Start("request_hl2sb_TRAINSTATION_02_ClearProps")
				net.SendToServer()
			end
		end

		if hl2sb_getmap == "gmhl2_canals_01" then
			local CAN01_Train_1 = panel:Button("Call Razor Train")
			function CAN01_Train_1:DoClick()
				net.Start("request_hl2sb_CAN01_TrainR")
				net.SendToServer()
			end

			local CAN01_Train_2 = panel:Button("Call Civilian Train")
			panel:Help("The civilian train must stop first!")

			function CAN01_Train_2:DoClick()
				net.Start("request_hl2sb_CAN01_TrainN")
				net.SendToServer()
			end

			local CAN01_Train_1_Leave = panel:Button("Scram Civilian Train")
			function CAN01_Train_1_Leave:DoClick()
				net.Start("request_hl2sb_CAN01_TrainNGO")
				net.SendToServer()
			end
		end

		if hl2sb_getmap == "gmhl2_ravenholm" or hl2sb_getmap == "gmhl2_c17_part1" then
			panel:Help("One time only settings")

			local RAVEN_KillClouds = panel:Button("Remove Clouds [FPS]")
			function RAVEN_KillClouds:DoClick()
				net.Start("request_hl2sb_RAVEN_KillClouds")
				net.SendToServer()
			end
		end

		if hl2sb_getmap == "gmhl2_coast_bridge" then
			local HW17_B_Train = panel:Button("Call Train")
			function HW17_B_Train:DoClick()
				net.Start("request_hl2sb_HW17_Bridge_Train")
				net.SendToServer()
			end
		end

		if hl2sb_getmap == "gmhl2_coast_09" then
			panel:Help("One time only settings")

			local HW17_C09_ClearCars = panel:Button("Clear Road")
			function HW17_C09_ClearCars:DoClick()
				net.Start("request_hl2sb_SANDTRAP_COAST_09_ClearCars")
				net.SendToServer()
			end
		end
	end )
end )
