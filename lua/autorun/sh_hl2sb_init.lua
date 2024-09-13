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
    },
	HL2EP1SB_CoreDamage = {
		value = CreateConVar( "hl2sb_ep1_core_damage", "1", FCVAR_ARCHIVE, "Toggle Core Damage", 0, 1 ),
		on = function()
		end,
		off = function()
		end
	}
}