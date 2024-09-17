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
	hl2sb_SoldiersVeryGoodAim = {
		value = CreateConVar( "hl2sb_soldiers_verygoodaim", "0", FCVAR_ARCHIVE, "Toggle Soldiers Very Good Aim", 0, 1 ),

		on = function()
			for k, v in ipairs(ents.FindByClass("npc_combine_s")) do
				if ( !IsValid(v) ) then continue end

				v:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			end
		end,
		off = function()
			for k, v in ipairs(ents.FindByClass("npc_combine_s")) do
				if ( !IsValid(v) ) then continue end

				v:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			end
		end,

		menuText = "Toggle Soldiers Very Good Aim",
		menuDesc = "Enable/Disable Soldiers Very Good Aim",
	},
	hl2sb_SoldiersInfiniteThrowable = {
		value = CreateConVar( "hl2sb_soldiers_infinitethrowable", "0", FCVAR_ARCHIVE, "Toggle Soldiers Infinite Throwables", 0, 1 ),

		on = function()
			for k, v in ipairs(ents.FindByClass("npc_combine_s")) do
				if ( !IsValid(v) ) then continue end

				v:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			end
		end,
		off = function()
			for k, v in ipairs(ents.FindByClass("npc_combine_s")) do
				if ( !IsValid(v) ) then continue end

				v:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			end
		end,

		menuText = "Toggle Soldiers Infinite Throwables",
		menuDesc = "Enable/Disable Soldiers having infinite throwables",
	},
	hl2sb_NPCsExplodeOnDeath = {
		value = CreateConVar( "hl2sb_npcs_explodeondeath", "0", FCVAR_ARCHIVE, "Toggle NPCs Explode on Death", 0, 1 ),

		on = function()
		end,

		off = function()
		end,

		menuText = "Toggle NPCs Explode on Death",
		menuDesc = "Enable/Disable NPCs Explode on Death",
	}
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

hl2sb.creditsMap = {
    ["gmhl2e1_citadel_00"] = "HALF-LIFE'\n== episode one==",
    ["ep1_citadel_00"] = "HALF-LIFE'\n== episode one==",
    ["gmhl2e1_c17_03"] = "HALF-LIFE'\n== episode one==",
    ["ep1_c17_06"] = "HALF-LIFE'\n== episode one==",
    ["gmhl2e2_outland_01"] = "HALF-LIFE'\n== episode two==",
    ["ep2_outland_01"] = "HALF-LIFE'\n== episode two=="
}

hl2sb.creditsEpisodes = {
    ["gmhl2e1_c17_03"] = "==episode one==",
    ["ep1_c17_06"] = "==episode one==",
    ["gmhl2e2_outland_12"] = "==episode two==",
    ["ep2_outland_12"] = "==episode two=="
}

hl2sb.soundtracks = {
	{"Entanglement (looped)", "Played when you enter the walls between Nova Prospekts after you kill the second Antlion Guardian.", "music/hl2_ambient_1.wav"},
	{"Lambda Code", "Played when you start fleeing from the Second Hunter-Chopper during the large cement pipes segment.", "music/hl1_song10.mp3"},
	{"Hazardous Environments (short version)", "Played When you equip the HEV Suit in \"Red Letter Day\".", "music/hl1_song11.mp3"},
	{"Triple Entanglement", "Played Upon entering the Zombie Infested sewers near the end of Chapter \"Anticitizen One\".", "music/hl1_song14.mp3"},
	{"Something Secret Steers Us", "Played during \"Sandtraps\"'s Lighthouse Point Dropship Attack.", "music/hl1_song15.mp3"},
	{"Tau-9", "Played when you enter the Magnetic Crane in the chapter \"Highway 17\" to hit and lower a bridge.", "music/hl1_song17.mp3"},
	{"Negative Pressure", "Played during the chapter \"Our Benefactors\" when Breen starts the speech about \"You have destroyed so much. What is it exactly you have created?\"", "music/hl1_song19.mp3"},
	{"Escape Array", "Played at the start of the level \"Black Mesa East\".", "music/hl1_song20.mp3"},
	{"Dirac Shore", "Played when entering the flooded basement in \"Entanglement\".", "music/hl1_song21.mp3"},
	{"Singularity", "Played when you see the Nova Prospekt Teleporter.", "music/hl1_song24.mp3"},
	{"Tracking Device (game mix) ", "Played during the second section of the Credits.", "music/hl1_song25_remix3.mp3"},
	{"Xen Relay", "Played upon reaching the top of the Citadel, just before meeting Breen.", "music/hl1_song26.mp3"},
	{"Black Mesa Inbound", "Played at the scrapyard in \"Black Mesa East\".", "music/hl1_song3.mp3"},
	{"Echoes of a Resonance Cascade", "Played in \"Anticitizen One\" and \"Our Benefactors\".", "music/hl1_song5.mp3"},
	{"Zero Point Energy Field", "Played when you first enter the sewers in \"Route Kanal\" after the first Hunter-Chopper Attack.", "music/hl1_song6.mp3"},
	{"Neutrino Trap", "Played upon exiting the sewer tunnel at the base of the Citadel", "music/hl1_song9.mp3"},
	{"Shadows Fore and Aft", "Played during the intro of Half-Life 2", "music/hl2_intro.mp3"},
	{"Entanglement", "Played upon entering the Combine Wall crushing canyon at end of chapter, just before meeting Alyx. ", "music/hl2_song0.mp3"},
	{"Particle Ghost", "Plays after leaving the Ravenholm Mines", "music/hl2_song1.mp3"},
	{"A Red Letter Day", "Played when entering Dr. Kleiner's lab. ", "music/hl2_song10.mp3"},
	{"Sandtraps", "Played at the zombie-infested area in the tunnels of chapter \"Sandtraps\".", "music/hl2_song11.mp3"},
	{"Hard Fought", "Played during the CP barricade and Underground shootout while waiting for a rebel to blow up a wall. Both in the chapter \"Anticitizen One\"", "music/hl2_song12_long.mp3"},
	{"Suppression Field", "Played when you meet your first rebel squad members in \"Anticitizen One\".", "music/hl2_song13.mp3"},
	{"You're Not Supposed to Be Here", "Played after receiving the mounted gun for the Airboat and facing the Hunter Chopper.", "music/hl2_song14.mp3"},
	{"Kaon", "Played when you fight the Gunship over the Overwatch Nexus.", "music/hl2_song15.mp3"},
	{"LG Orbifold", "Played during the last map of the Chapter \"Follow Freeman\".", "music/hl2_song16.mp3"},
	{"Broken Symmetry", "Played in \"Route Kanal\" upon leaving the sewers and arriving at the first toxic water area.", "music/hl2_song17.mp3"},
	{"Nova Prospekt", "Played when the player enters the prison.", "music/hl2_song19.mp3"},
	{"Lab Practicum", "Played under the bridge in \"Highway 17\" and when you finish teleporting in \"Entanglement\".", "music/hl2_song2.mp3"},
	{"CP Violation", "Played when the CP officer pushes down a barrel in \"Route Kanal\" at the traintracks.", "music/hl2_song20_submix0.mp3"},
	{"CP Violation (remix)", "Played when CP officers push barrels down in the water.", "music/hl2_song20_submix4.mp3"},
	{"Triage at Dawn", "Played when the battle in the garage before \"Highway 17\" is over.", "music/hl2_song23_suitsong3.mp3"},
	{"Miscount Detected", "Not Played in Retail Game.", "music/hl2_song25_teleporter.mp3"},
	{"Our Resurrected Teleport", "Played when you enter the teleporter in Kleiner's Lab.", "music/hl2_song26.mp3"},
	{"Train Station 1", "Played when you enter the plaza in the beginning of the game.", "music/hl2_song26_trainstation1.mp3"},
	{"Train Station 2", "Played when you're running on the rooftops in \"Point Insertion\" and when entering the Overwatch Nexus in \"Follow Freeman!\".", "music/hl2_song27_trainstation2.mp3"},
	{"Hunter Down", "Played after the last strider in \"Follow Freeman!\" is killed.", "music/hl2_song28.mp3"},
	{"Apprehension and Evasion", "Played while escaping from Civil Protection through the train tracks and During the night time raid on Nova Prospekt.", "music/hl2_song29.mp3"},
	{"Dark Energy", "Played when you leave Shorepoint Base in \"Highway 17\".", "music/hl2_song3.mp3"},
	{"Calabi-Yau Model", "Played in \"Sandtraps\" upon entering the camp and in \"Follow Freeman!\" upon entering the Zombie-Infested Building.", "music/hl2_song30.mp3"},
	{"Brane Scan", "Played when you're fighting in the plaza and waiting for the generator to be brought down.", "music/hl2_song31.mp3"},
	{"Slow Light", "Played after the Gunship at NLO has been defeated.", "music/hl2_song32.mp3"},
	{"Probably Not a Problem", "Played during the shelling in \"Route Kanal\".", "music/hl2_song33.mp3"},
	{"The Innsbruck Experiment", "Played in \"Route Kanal\" when the SMG metrocops rappel down and in \"Anticitizen One\" when Dog starts fighting.", "music/hl2_song4.mp3"},
	{"Pulse Phase", "Played in \"Follow Freeman!\" when the player goes outside and fights striders and in \"Dark Energy\" when the player is descending in an elevator to defeat Breen.", "music/hl2_song6.mp3"},
	{"Ravenholm Reprise", "Played in the beginning of \"We don't go to Ravenholm...\".", "music/hl2_song7.mp3"},
	{"Highway 17", "Played in \"Sandtraps\" at the house by the coast where the Combin eare burning bodies.", "music/hl2_song8.mp3"},
	{"Requiem For Ravenholm", "Played after you pass by the gate that Grigori opens for you.", "music/ravenholm_1.mp3"},
	{"Radio", "GOR---... C-- --U -E-- --", "music/radio1.mp3"},

	// Episode One
	{"[Episode One] Eine Kleiner Elevatormuzik", "Played when you look over the ledge in the Citadel before Alyx says \"I had no idea\".", "music/vlvx_song1.mp3"},
	{"[Episode One] Disrupted Original", "Played in the first large fight in the tunnels.", "music/vlvx_song11.mp3"},
	{"[Episode One] Self Destruction", "Played when Alyx says \"here comes trouble\".", "music/vlvx_song12.mp3"},
	{"[Episode One] What Kind of Hospital Is This?", "Played after Alyx gets a shotgun and you enter the hall.", "music/vlvx_song18.mp3"},
	{"[Episode One] Infraradiant", "Played when you enter the Citadel Core.", "music/vlvx_song19a.mp3"},
	{"[Episode One] Decay Mode", "Played after the lights go out in the elevator section.", "music/vlvx_song19b.mp3"},
	{"[Episode One] Combine Advisory", "Played when you enter the room with advisor pods.", "music/vlvx_song2.mp3"},
	{"[Episode One] Penultimatum", "Played during the last Strider Fight at the end.", "music/vlvx_song21.mp3"},
	{"[Episode One] Guard Down", "Played when Alyx uses the mounted gun after killing the antlion guardian.", "music/vlvx_song4.mp3"},
	{"[Episode One] Darkness at Noon", "Played when you enter the vents and alyx comments \"blind as a bat\".", "music/vlvx_song8.mp3"},

	// Episode Two
	{"[Episode Two] No One Rides For Free", "Played when you drive away from the junkyard.", "music/vlvx_song0.mp3"},
	{"[Episode Two] Nectarium", "Played when you find the larval extract.", "music/vlvx_song15.mp3"},
	{"[Episode Two] Extinction Event Horizon", "Played in the start of the game.", "music/vlvx_song20.mp3"},
	{"[Episode Two] Vortal Combat", "Played during the last wave of Antlions", "music/vlvx_song22.mp3"},
	{"[Episode Two] Sector Sweep", "Played when the Hunter-Chopper starts chasing you.", "music/vlvx_song23.mp3"},
	{"[Episode Two] Shu'ulathoi", "Played during the scene with the Barn Advisor.", "music/vlvx_song23ambient.mp3"},
	{"[Episode Two] Last Legs", "Played during the second wave of Hunters and Striders.", "music/vlvx_song24.mp3"},
	{"[Episode Two] Abandoned In Place", "Played during the Combine Breach on White Forest.", "music/vlvx_song25.mp3"},
	{"[Episode Two] Inhuman Frequency", "Played during the GMan Sequence.", "music/vlvx_song26.mp3"},
	{"[Episode Two] Hunting Party", "Played during the Hunter ambush.", "music/vlvx_song27.mp3"},
	{"[Episode Two] Eon Trap", "Played during the Ambush at the House.", "music/vlvx_song28.mp3"},
	{"[Episode Two] Dark Interval", "Played during the Final Scene and Credits.", "music/vlvx_song3.mp3"},
	{"[Episode Two] Crawl Yard", "Plays near one of the Radioactive Leaks", "music/vlvx_song9.mp3"}
}

function hl2sb:IsEnabled(identifier)
	if ( !identifier ) then return false end

	local setting = hl2sb.mapSettings[identifier]
	if ( !setting ) then return false end

	if ( !setting.value ) then return false end

	return setting.value:GetBool()
end