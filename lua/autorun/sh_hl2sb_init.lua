hl2sb = {}

// EPISODIC Particle Mounting Fix
if ( IsMounted( "episodic" ) ) then
	game.AddParticles( "particles/ep1_fx.pcf" )
end

if ( IsMounted( "ep2" ) ) then
	game.AddParticles( "particles/advisor.pcf" )
	game.AddParticles( "particles/aurora.pcf" )
	game.AddParticles( "particles/aurora_sphere2.pcf" )
	game.AddParticles( "particles/blob.pcf" )
	game.AddParticles( "particles/skybox_smoke.pcf" )
	game.AddParticles( "particles/choreo_dog_v_strider.pcf" )
	game.AddParticles( "particles/dust_rumble.pcf" )
	game.AddParticles( "particles/stalactite.pcf" )
	game.AddParticles( "particles/hunter_intro.pcf" )
	game.AddParticles( "particles/door_explosion.pcf" )
	game.AddParticles( "particles/choreo_launch.pcf" )
	game.AddParticles( "particles/magnusson_burner.pcf" )
end

hook.Add("IsEP2NectarTriggered", "hl2sb_IsEP2NectarTriggered", function()
	if ( !file.Exists("hl2sb_ep2_nectar.txt", "DATA") ) then return false end
	if ( game.GetMap() != "gmhl2e2_outland_02" ) then return false end

	local nectar = file.Read("hl2sb_ep2_nectar.txt", "DATA")
	if ( nectar == "1" ) then
		return true
	end

	return false
end)

hl2sb.mapSettings = {
    hl2sb_Deathpits = {
        value = CreateConVar( "hl2sb_deathpit_triggers", "0", FCVAR_ARCHIVE, "Toggle death zones", 0, 1 ),
		on = function()
			for k, v in ipairs(ents.FindByName("waterdeath")) do
				v:Fire("Enable")
			end

			for k, v in ipairs(ents.FindByName("pitdeath")) do
				v:Fire("Enable")
			end
        end,
        off = function()
			for k, v in ipairs(ents.FindByName("waterdeath")) do
				v:Fire("Disable")
			end

			for k, v in ipairs(ents.FindByName("pitdeath")) do
				v:Fire("Disable")
			end
        end,

		menuText = "Toggle Death Barriers",
		menuDesc = "Enable/Disable death barriers, pits, leeches",
    },
    hl2sb_LevelSwitchTriggers = {
        value = CreateConVar( "hl2sb_levelswitch_triggers", "1", FCVAR_ARCHIVE, "Toggle Changelevels", 0, 1 ),

		on = function()
			for k, v in ipairs(ents.FindByClass("trigger_changelevel")) do
				v:Fire("Enable")
			end

			for k, v in ipairs(ents.FindByName("changelvl_lua_trigger")) do
				v:Fire("Enable")
			end
        end,
        off = function()
			for k, v in ipairs(ents.FindByClass("trigger_changelevel")) do
				v:Fire("Disable")
			end

			for k, v in ipairs(ents.FindByName("changelvl_lua_trigger")) do
				v:Fire("Disable")
			end
        end,

		menuText = "Toggle Loading Zones",
		menuDesc = "Enable/Disable level switch triggers",
    },
    hl2sb_Antlions_Spawns = {
        value = CreateConVar( "hl2sb_antlionspawn_triggers", "1", FCVAR_ARCHIVE, "Toggle Antlion Spawns", 0, 1 ),

		on = function()
			for k, v in ipairs(ents.FindByName("trigger_expanse_sand_1")) do
				v:Fire("Enable")
			end

			for k, v in ipairs(ents.FindByName("antlion_sand_trigger")) do
				v:Fire("Enable")
			end

			for k, v in ipairs(ents.FindByName("antlion_spawner")) do
				v:Fire("Enable")
			end
        end,
        off = function()
			for k, v in ipairs(ents.FindByName("trigger_expanse_sand_1")) do
				v:Fire("Disable")
			end

			for k, v in ipairs(ents.FindByName("antlion_sand_trigger")) do
				v:Fire("Disable")
			end

			for k, v in ipairs(ents.FindByName("antlion_spawner")) do
				v:Fire("Disable")
			end
        end,

		menuText = "Toggle Antlion spawns",
		menuDesc = "Enable/Disable antlions burrowing from the ground",
    },
	hl2sb_GmanIntro = {
		value = CreateConVar( "hl2sb_trainstation_intro", "1", FCVAR_ARCHIVE, "Gman trainstation intro", 0, 1 ),

		on = function()
			for k, v in ipairs(ents.FindByName("intro_start")) do
				v:Fire("Trigger")
			end
        end,
        off = function()
			for k, v in ipairs(ents.FindByName("intro_skip_start")) do
				v:Fire("Trigger")
			end
        end,

		menuText = "Toggle G-Man Trainstation Intro",
		menuDesc = "Enable/Disable G-Man trainstation intro",
    },
	hl2sb_NPCGodmode = {
		value = CreateConVar( "hl2sb_npcgodmode", "0", FCVAR_ARCHIVE, "Toggle NPC Godmode", 0, 1 ),

		on = function()
		end,
		off = function()
		end,

		menuText = "Toggle Story NPC's Godmode",
		menuDesc = "Enable/Disable Godmode for Story NPC's",
	},
	hl2sb_ep1_CoreDamage = {
		value = CreateConVar( "hl2sb_ep1_core_damage", "1", FCVAR_ARCHIVE, "Toggle Core Damage", 0, 1 ),

		on = function()
		end,
		off = function()
		end,

		menuText = "Toggle Core Damage",
		menuDesc = "Enable/Disable core damage in Episode 1",
	},
}

hl2sb.godModeNPCNames = {
	["npc_alyx"] = {"alyx"},
	["npc_barney"] = {"barney"},
	["npc_breen"] = {"breen"},
	["npc_dog"] = {"dog"},
	["npc_kleiner"] = {"kleiner"},
	["npc_eli"] = {"eli"},
	["npc_citizen"] = {"odessa"},
	["npc_monk"] = {"monk"},
	["npc_mossman"] = {"mossman", "mossman2"},
}

hl2sb.cvars = {}

for k, v in pairs(hl2sb.mapSettings) do
	hl2sb.cvars[k] = v
end

local gameMap = game.GetMap()
hl2sb.mapTitle = "."
hl2sb.mapChapter = "Not an HL2:SB Map"

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

if ( hl2sb.mapChapters[gameMap] ) then
	hl2sb.mapChapter = hl2sb.mapChapters[gameMap]
end

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

if ( hl2sb.mapTitles[gameMap] ) then
	hl2sb.mapTitle = hl2sb.mapTitles[gameMap]
end