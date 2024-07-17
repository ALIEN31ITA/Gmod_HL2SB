// Yes i am a terrible coder
// Help gained from the Gmod Discord, i am not a coder!!

// KILLICONS
//NPC LIST
killicon.Add( "npc_helicopter", "HUD/hl2sb/killicons/npc_helicopter", Color( 255, 80, 0, 255 ) )
killicon.Add( "grenade_helicopter", "HUD/hl2sb/killicons/grenade_helicopter", Color( 255, 80, 0, 255 ) )
killicon.Add( "npc_antlion", "HUD/hl2sb/killicons/npc_antlion", Color( 255, 80, 0, 255 ) )
killicon.Add( "npc_antlionguard", "HUD/hl2sb/killicons/npc_antlionguard", Color( 255, 80, 0, 255 ) )
killicon.Add( "npc_barnacle", "HUD/hl2sb/killicons/npc_barnacle", Color( 255, 80, 0, 255 ) )
killicon.Add( "npc_combinedropship", "HUD/hl2sb/killicons/npc_combinedropship", Color( 255, 80, 0, 255 ) )
killicon.Add( "npc_combinegunship", "HUD/hl2sb/killicons/npc_combinegunship", Color( 255, 80, 0, 255 ) )
killicon.Add( "npc_manhack", "HUD/hl2sb/killicons/npc_manhack", Color( 255, 80, 0, 255 ) )
killicon.Add( "npc_rollermine", "HUD/hl2sb/killicons/npc_rollermine", Color( 255, 80, 0, 255 ) )
killicon.Add( "npc_turret_floor", "HUD/hl2sb/killicons/npc_turret_floor", Color( 255, 80, 0, 255 ) )
killicon.Add( "npc_turret_ceiling", "HUD/hl2sb/killicons/npc_turret_ceiling", Color( 255, 80, 0, 255 ) )
killicon.Add( "npc_strider", "HUD/hl2sb/killicons/npc_strider", Color( 255, 80, 0, 255 ) )
killicon.Add( "npc_sniper", "HUD/hl2sb/killicons/npc_sniper", Color( 255, 80, 0, 255 ) )
killicon.Add( "npc_stalker", "HUD/hl2sb/killicons/env_laser", Color( 255, 80, 0, 255 ) )
//VEHICLES
killicon.Add( "prop_vehicle_apc", "HUD/hl2sb/killicons/prop_vehicle_apc", Color( 255, 80, 0, 255 ) )
killicon.Add( "prop_vehicle_airboat", "HUD/hl2sb/killicons/prop_vehicle_airboat", Color( 255, 80, 0, 255 ) )
killicon.Add( "prop_vehicle_jeep", "HUD/hl2sb/killicons/prop_vehicle_jeep", Color( 255, 80, 0, 255 ) )
killicon.Add( "prop_vehicle_prisoner_pod", "HUD/hl2sb/killicons/prop_vehicle_prisoner_pod", Color( 255, 80, 0, 255 ) )
//WORLD
killicon.Add( "env_explosion", "HUD/hl2sb/killicons/env_explosion", Color( 255, 80, 0, 255 ) )
killicon.Add( "env_headcrabcanister", "HUD/hl2sb/killicons/env_headcrabcanister", Color( 255, 80, 0, 255 ) )
killicon.Add( "env_laser", "HUD/hl2sb/killicons/env_laser", Color( 255, 80, 0, 255 ) )
killicon.Add( "env_fire", "HUD/hl2sb/killicons/env_fire", Color( 255, 80, 0, 255 ) )
killicon.Add( "entityflame", "HUD/hl2sb/killicons/env_fire", Color( 255, 80, 0, 255 ) )
killicon.Add( "concussiveblast", "HUD/hl2sb/killicons/env_explosion", Color( 255, 80, 0, 255 ) )
//WEAPONS
killicon.Add( "item_ammo_crate", "HUD/hl2sb/killicons/item_ammo_crate", Color( 255, 80, 0, 255 ) )
killicon.Add( "weapon_annabelle", "HUD/hl2sb/killicons/weapon_annabelle", Color( 255, 80, 0, 255 ) )
killicon.Add( "weapon_alyxgun", "HUD/hl2sb/killicons/weapon_alyxgun", Color( 255, 80, 0, 255 ) )
//EP2
killicon.Add( "npc_antlion_worker", "HUD/hl2sb/killicons/npc_antlion_worker", Color( 255, 80, 0, 255 ) )
killicon.Add( "grenade_spit", "HUD/hl2sb/killicons/grenade_spit", Color( 255, 80, 0, 255 ) )
killicon.Add( "npc_hunter", "HUD/hl2sb/killicons/npc_hunter", Color( 255, 80, 0, 255 ) )
killicon.Add( "hunter_flechette", "HUD/hl2sb/killicons/hunter_flechette", Color( 255, 80, 0, 255 ) )
killicon.Add( "weapon_striderbuster", "HUD/hl2sb/killicons/weapon_striderbuster", Color( 255, 80, 0, 255 ) )

local hl2sb_getmap = game.GetMap()
local hl2sb_map_title = "."
local hl2sb_map_chapter = "Not an HL2:SB Map"

// CHAPTER NAMES

local hl2sb_getchapter = {
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

hl2sb_map_chapter = hl2sb_getchapter[hl2sb_getmap] or "Not an HL2:SB Map" // Default to "Not an HL2:SB Map"

// CHAPTER TITLES

local hl2sb_gettitle = {
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
	["gmhl2_c17_01"] = "Your kinda late pal...",
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

hl2sb_map_title = hl2sb_gettitle[hl2sb_getmap]

hook.Add( "AddToolMenuCategories", "HL2SBCategory", function()
	spawnmenu.AddToolCategory( "Utilities", "HL2 Sandbox", "#HL2: Sandbox" )
end )

hook.Add( "PopulateToolMenu", "HL2SB_General_Settings", function()
	spawnmenu.AddToolMenuOption( "Utilities", "HL2 Sandbox", "Settings", "#Settings", "", "", function(panel)
		panel:ClearControls()
		local logo = vgui.Create("DImage", panel)
		logo:SetSize(267, 134)
		logo:SetImage("hud/hl2sb/logo.png")
		panel:AddItem(logo)
		panel:Help("Generic settings for the maps")
		panel:CheckBox("[TRAINSTATION-EP1] Disable intros", "hl2sb_trainstation_intro")
		panel:ControlHelp("You don't need to hear all of this, you are a highly trained professional")
		panel:CheckBox("Death barriers", "hl2sb_deathpit_triggers")
		panel:ControlHelp("Disable/Enable death barriers, pits, leeches")
		panel:CheckBox("Loading Zones", "hl2sb_levelswitch_triggers")
		panel:ControlHelp("Disable/Enable level switch triggers")
		panel:CheckBox("Antlion spawns", "hl2sb_antlionspawn_triggers")
		panel:ControlHelp("Disable/Enable antlions burrowing from the ground")

	end )
end )

hook.Add( "PopulateToolMenu", "HL2SB_Currentmap_Settings", function()
	spawnmenu.AddToolMenuOption( "Utilities", "HL2 Sandbox", "Current Map", "#Current Map", "", "", function(panel)
		panel:ClearControls()
		panel:Help(hl2sb_map_chapter..hl2sb_map_title)

		if hl2sb_getmap == ( "gmhl2_coast_01" or "gmhl2_coast_bridge" ) then
			panel:Help("One time only settings")

			local HW17_B_ClearCars = panel:Button("Clear Wagons")
			local function HW17_B_Cars()
				net.Start("request_HL2SB_HW17_Bridge_ClearCars")
				net.SendToServer()
			end

			function HW17_B_ClearCars:DoClick()
				HW17_B_Cars()
			end
		end

		if hl2sb_getmap == "gmhl2_trainstation_02" then
			panel:Help("One time only settings")

			local PI_TS2_ClearProps = panel:Button("Clear Furniture Blocks")
			local function PI_TS2_CProps()
				net.Start("request_HL2SB_TRAINSTATION_02_ClearProps")
				net.SendToServer()
			end

			function PI_TS2_ClearProps:DoClick()
				PI_TS2_CProps()
			end
		end

		if hl2sb_getmap == "gmhl2_canals_01" then
			local CAN01_Train_1 = panel:Button("Call Razor Train")
			local function CAN01_Train_R()
				net.Start("request_HL2SB_CAN01_TrainR")
				net.SendToServer()
			end

			function CAN01_Train_1:DoClick()
				CAN01_Train_R()
			end

			local CAN01_Train_2 = panel:Button("Call Civilian Train")
			local function CAN01_Train_N()
				net.Start("request_HL2SB_CAN01_TrainN")
				net.SendToServer()
			end

			panel:Help("The civilian train must stop first!")
			function CAN01_Train_2:DoClick()
				CAN01_Train_N()
			end

			local CAN01_Train_1_Leave = panel:Button("Scram Civilian Train")
			local function CAN01_Train_NGO()
				net.Start("request_HL2SB_CAN01_TrainNGO")
				net.SendToServer()
			end

			function CAN01_Train_1_Leave:DoClick()
				CAN01_Train_NGO()
			end
		end

		if hl2sb_getmap == ( "gmhl2_ravenholm" or "gmhl2_c17_part1" ) then
			panel:Help("One time only settings")

			local RAVEN_KillClouds = panel:Button("Remove Clouds [FPS]")
			local function RAVEN_Clouds()
				net.Start("request_HL2SB_RAVEN_KillClouds")
				net.SendToServer()
			end

			function RAVEN_KillClouds:DoClick()
				RAVEN_Clouds()
			end
		end

		if hl2sb_getmap == "gmhl2_coast_bridge" then
			local HW17_B_Train = panel:Button("Call Train")

			local function HW17_Train()
				net.Start("request_HL2SB_HW17_Bridge_Train")
				net.SendToServer()
			end

			function HW17_B_Train:DoClick()
				HW17_Train()
			end
		end

		if hl2sb_getmap == "gmhl2_coast_09" then
			panel:Help("One time only settings")
			local HW17_C09_ClearCars = panel:Button("Clear Road")

			local function HW17_C09_Cars()
				net.Start("request_HL2SB_SANDTRAP_COAST_09_ClearCars")
				net.SendToServer()
			end

			function HW17_C09_ClearCars:DoClick()
				HW17_C09_Cars()
			end
		end
	end )
end )
