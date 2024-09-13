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
local hl2sb.mapTitle = "."
local hl2sb.mapChapter = "Not an HL2:SB Map"

// CHAPTER NAMES

hl2sb.mapChapters = {
	["gmhl2_trainstation_01"] = "POINT INSERTION: ",
	["gmhl2_trainstation_02"] = "POINT INSERTION: ",
	["gmhl2_canals_01"] = "ROUTE KANAL: ",
	["gmhl2_canals_02"] = "ROUTE KANAL: ",
	["gmhl2_canals_06"] = "WATER HAZARD: ",
	["gmhl2_canals_07"] = "WATER HAZARD: ",
	["gmhl2_canals_08"] = "WATER HAZARD: ",
	["gmhl2_canals_09"] = "WATER HAZARD: ",
	["gmhl2_canals_10"] = "WATER HAZARD: ",
	["gmhl2_canals_11"] = "WATER HAZARD: ",
	["gmhl2_canals_12"] = "WATER HAZARD: ",
	["gmhl2_canals_13"] = "WATER HAZARD: ",
	["gmhl2_eli_01"] = "BLACK MESA EAST ",
	["gmhl2_eli_02"] = "BLACK MESA EAST ",
	["gmhl2_ravenholm"] = "WE DON'T GO TO RAVENHOLM... ",
	["gmhl2_coast_01"] = "HIGHWAY 17: ",
	["gmhl2_coast_03"] = "HIGHWAY 17: ",
	["gmhl2_coast_04"] = "HIGHWAY 17: ",
	["gmhl2_coast_05"] = "HIGHWAY 17: ",
	["gmhl2_coast_06"] = "HIGHWAY 17: ",
	["gmhl2_coast_bridge"] = "HIGHWAY 17: ",
	["gmhl2_lostcoast"] = "LOST COAST: ",
	["gmhl2_coast_09"] = "SANDTRAPS: ",
	["gmhl2_coast_10"] = "SANDTRAPS: ",
	["gmhl2_coast_11"] = "SANDTRAPS: ",
	["gmhl2_coast_12"] = "SANDTRAPS: ",
	["gmhl2_prison_part1"] = "NOVA PROSPEKT: ",
	["gmhl2_prison_part2"] = "ENTANGLEMENT: ",
	["gmhl2_c17_01"] = "ENTANGLEMENT: ",
	["gmhl2_c17_part1"] = "ANTICITIZEN ONE: ",
	["gmhl2_c17_part2"] = "ANTICITIZEN ONE: ",
	["gmhl2_c17_part3"] = "FOLLOW FREEMAN!: ",
	["gmhl2_c17_part4"] = "FOLLOW FREEMAN!: ",
	["gmhl2_c17_part5"] = "FOLLOW FREEMAN!: ",
	["gmhl2_c17_part6"] = "FOLLOW FREEMAN!: ",
	["gmhl2_citadel_p1"] = "OUR BENEFACTORS: ",
	["gmhl2_citadel_04"] = "OUR BENEFACTORS: ",
	["gmhl2_citadel_05"] = "OUR BENEFACTORS: ",
	["gmhl2_breen_01"] = "DARK ENERGY: ",
	["gmhl2e1_citadel_00"] = "Undue Alarm: ",
	["gmhl2e1_citadel_01"] = "Undue Alarm: ",
	["gmhl2e1_citadel_02"] = "Undue Alarm: ",
	["gmhl2e1_citadel_02b"] = "Undue Alarm: ",
	["gmhl2e1_citadel_03"] = "[UNEDITED] Direct Intervention: ",
	["gmhl2e1_citadel_04"] = "Direct Intervention: ",
	["gmhl2e1_c17_00"] = "Lowlife: ",
	["gmhl2e1_c17_01"] = "Urban Flight: ",
	["gmhl2e1_c17_02"] = "Urban Flight: ",
	["gmhl2e1_c17_03"] = "Exit 17: "
}

if ( hl2sb.mapChapters[hl2sb_getmap] ) then
	hl2sb.mapChapter = hl2sb.mapChapters[hl2sb_getmap]
end

// CHAPTER TITLES

hl2sb.mapTitles = {
	["gmhl2_trainstation_01"] = "Smell the ashes...",
	["gmhl2_trainstation_02"] = "Wrong address",
	["gmhl2_canals_01"] = "Railway violations",
	["gmhl2_canals_02"] = "Choppers & Canals",
	["gmhl2_canals_06"] = "Airboat first rampage",
	["gmhl2_canals_07"] = "oops, i broke it",
	["gmhl2_canals_08"] = "Oh no a big water gate!",
	["gmhl2_canals_09"] = "WATER HAZARD: ",
	["gmhl2_canals_10"] = "WATER HAZARD: ",
	["gmhl2_canals_11"] = "New airboat toy ",
	["gmhl2_canals_12"] = "APC Storm",
	["gmhl2_canals_13"] = "Chopper trouble",
	["gmhl2_eli_01"] = "You didn't change a bit",
	["gmhl2_eli_02"] = "Dog playtime before disaster",
	["gmhl2_ravenholm"] = "May the angels help you",
	["gmhl2_coast_01"] = "Winston",
	["gmhl2_coast_03"] = "GUNSHIP!!",
	["gmhl2_coast_04"] = "Crane Jump",
	["gmhl2_coast_05"] = "Ambush & Curves",
	["gmhl2_coast_06"] = "The real lost coast?",
	["gmhl2_coast_bridge"] = "Make a run for it",
	["gmhl2_coast_09"] = "Battery Puzzle",
	["gmhl2_coast_10"] = "Lighthouse defense",
	["gmhl2_coast_11"] = "Poor Lazlo :(",
	["gmhl2_coast_12"] = "Antlion D-Day & Prison",
	["gmhl2_lostcoast"] = "You like leeches yes?",
	["gmhl2_prison_part1"] = "Gordon, you are in prison!",
	["gmhl2_prison_part2"] = "Gordon, you are ALMOST OUT of prison!",
	["gmhl2_c17_01"] = "You're kinda late pal...",
	["gmhl2_c17_part1"] = "Uprising in the streets",
	["gmhl2_c17_part2"] = "Tunnels & Condos",
	["gmhl2_c17_part3"] = "Defend, Sewers & Snipers!",
	["gmhl2_c17_part4"] = "Overwatch Nexus P.1",
	["gmhl2_c17_part5"] = "Overwatch Nexus P.2",
	["gmhl2_c17_part6"] = "Striders Faceoff",
	["gmhl2_citadel_p1"] = "Taking a ride, and an upgrade",
	["gmhl2_citadel_04"] = "Despite my rage",
	["gmhl2_citadel_05"] = "I guess i have no choice...",
	["gmhl2_breen_01"] = "Final Showdown",
	["gmhl2e1_citadel_00"] = "Left the core on, brb",
	["gmhl2e1_citadel_01"] = "This place is collapsing on itself!",
	["gmhl2e1_citadel_02"] = "Left the core on, brb",
	["gmhl2e1_citadel_02b"] = "Left the core on, brb",
	["gmhl2e1_citadel_03"] = "The power source to everything",
	["gmhl2e1_citadel_04"] = "Scary train ride",
	["gmhl2e1_c17_00"] = "Tunnels, Parking lots, Zombies and a lot of hungry Antlions!",
	["gmhl2e1_c17_01"] = "Streetwars between snipers and antlions",
	["gmhl2e1_c17_02"] = "Kleiner wants you to get busy, and also Barney has something to give you.",
	["gmhl2e1_c17_03"] = "Final push towards the outlands..."
}

if ( hl2sb.mapTitles[hl2sb_getmap] ) then
	hl2sb.mapTitle = hl2sb.mapTitles[hl2sb_getmap]
end

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
