hl2sb = hl2sb or {}

local hl2sb_getmap = game.GetMap()

local function SetupNPCs(ent)
	if ent:GetClass() == "npc_eli" && ent.NPCTable.ListClass == "npc_eli_episodic" then
		ent.NPCTable.Name = "Eli Vance"
		ent:SetSubMaterial( 0, "models/hl2sb/characters/eli_sheet_ep2" )
	elseif ent:GetClass() == "npc_kleiner" && ent.NPCTable.ListClass == "npc_kleiner_episodic" then
		ent.NPCTable.Name = "Dr. Isaac Kleiner"
		ent:SetSubMaterial( 0, "models/hl2sb/characters/kleiner_sheet_ep2" )
	elseif ent:GetClass() == "npc_mossman" && ent.NPCTable.ListClass == "npc_mossman_episodic" then
		ent.NPCTable.Name = "Dr. Judith Mossman"
	elseif ent:GetClass() == "npc_barney" then
		if ent.NPCTable.ListClass == "npc_barney_episodic" then
			ent.NPCTable.Name = "Barney Calhoun"
			ent:SetSubMaterial( 2, "models/hl2sb/characters/barneyface_ep1" )
		elseif ent.NPCTable.ListClass == "npc_barney_cp" then
			ent:SetName("hl2sb_barney_cp" .. ent:EntIndex())
			ent.NPCTable.Name = "Barney Calhoun (CP)"

			local maskPlateBack = ents.Create("prop_dynamic")
			maskPlateBack:SetModel("models/barneyhelmet.mdl")
			maskPlateBack:Fire("SetParent", "hl2sb_barney_cp" .. ent:EntIndex())
			maskPlateBack:Fire("SetParentAttachment", "helmet_attachment")
			maskPlateBack:Spawn()

			local maskPlateFront = ents.Create("prop_dynamic")
			maskPlateFront:SetModel("models/barneyhelmet_faceplate.mdl")
			maskPlateFront:Fire("SetParent", "hl2sb_barney_cp" .. ent:EntIndex())
			maskPlateFront:Fire("SetParentAttachment", "helmet_attachment")
			maskPlateFront:Spawn()
		end
	elseif ent:GetClass() == "npc_metropolice" then
		if ent.NPCTable.ListClass == "npc_barney_cp_hostile" then
			ent.NPCTable.Name = "Barney Calhoun (CP)"
		end
	elseif ( ent:GetClass() == "npc_helicopter" ) then
		if ( ent.NPCTable.ListClass == "npc_helicopter_nightlights" ) or ( ent:GetClass() == "npc_combinegunship" && ent.NPCTable.ListClass == "npc_gunship_chopper" ) then
			ent.NPCTable.Name = "Hunter-Chopper"
		elseif ( ent.NPCTable.ListClass == "npc_helicopter_nightlightsplusspot" ) then
			local attachment = ent:LookupAttachment("Spotlight")
			local data_attach = ent:GetAttachment(attachment)

			ent.spotLight = ents.Create("point_spotlight")
			ent.spotLight:SetPos(data_attach.Pos)
			ent.spotLight:SetAngles(data_attach.Ang)
			ent.spotLight:SetParent(ent, attachment)
			ent.spotLight:SetKeyValue("spotlightlength", "5000")
			ent.spotLight:SetKeyValue("spotlightwidth", "1000")
			ent.spotLight:SetKeyValue("rendermode", "9")
			ent.spotLight:SetKeyValue("spawnflags", "1")
			ent.spotLight:Spawn()
			ent.spotLight:Activate()
		end
	elseif ent:GetClass() == "npc_rollermine" then
		if ent.NPCTable.ListClass == "npc_rollermine_alyxhack" then
			ent.NPCTable.Name = "Rollermine"
			ent:SetSaveValue( "m_bHackedByAlyx", true )
			ent:SetSkin(1)
			ent:SetKeyValue("spawnflags", bit.bor(ent:GetSpawnFlags(), SF_ROLLERMINE_FRIENDLY))
		elseif ent.NPCTable.ListClass == "npc_rollermine_buried" then
			ent.NPCTable.Name = "Rollermine"
			ent:SetKeyValue("startburied", "1")
			ent:SetSaveValue( "m_bBuried", true )
			ent:SetPos(ent:GetPos() + ent:GetUp() * -35)
			ent:SetMoveType(MOVETYPE_NONE)
		end
	elseif ent:GetClass() == "npc_poisonzombie" and ent.NPCTable.ListClass == "npc_poisonzombie_crabless" then
		ent.NPCTable.Name = "Poison Zombie"

		ent:SetSaveValue("m_nCrabCount", 0)
		ent:SetSaveValue("m_bCrabs", {
			[0] = false,
			[1] = false,
			[2] = false
		})

		for i = 1, 5 do
			ent:SetBodygroup(i, 0)
		end
	elseif ent:GetClass() == "npc_zombie" and ent.NPCTable.ListClass == "npc_zombie_crabless" then
		ent.NPCTable.Name = "Zombie"

		ent:SetBodygroup(1, 0)
	elseif ent:GetClass() == "npc_fastzombie" and ent.NPCTable.ListClass == "npc_fastzombie_crabless" then
		ent.NPCTable.Name = "Fast Zombie"

		ent:SetBodygroup(1, 0)
	elseif ent:GetClass() == "npc_vortigaunt" && ent.NPCTable.ListClass == "npc_bluevorti_episodic" then
		ent:SetNW2Entity("hl2sbSpawnedBy", ply)

		ent:SetSubMaterial( 0, "models/hl2sb/characters/vortigaunt_blueeye_patch" )
		ent:SetSubMaterial( 1, "models/hl2sb/characters/vortigaunt_blue_patch" )
		ent:SetSubMaterial( 2, "models/hl2sb/characters/vortigaunt_blueeye_patch" )
		ent:SetSubMaterial( 3, "models/hl2sb/characters/vortigaunt_blueeye_patch" )
		ent:SetSubMaterial( 4, "models/hl2sb/characters/vortigaunt_blueeye_patch" )
		ent:SetSubMaterial( 5, "models/hl2sb/characters/vortigaunt_blueeye_patch" )
		ent.NPCTable.Name = "Vortigaunt"
	end
end

local MAP_HELINPC = {
	["npc_combinegunship"] = true,
	["npc_helicopter"] = true,
	["npc_combinedropship"] = true
}

local function SetHeliPath(ent)
	if ( hl2sb_getmap == "gmhl2_coast_03" ) then
		if MAP_HELINPC[ent:GetClass()] then
			ent:Fire("SetTrack", "helipathstart", 0)
		end
	end
end

// hl2sb NPC SWITCH - Zaurzo code
hook.Add("PlayerSpawnedNPC", "hl2sb_NPC_SUBMATERIALS", function(ply, ent)
	if ( !IsValid(ent) or !IsValid(ply) ) then return end

	SetupNPCs(ent)

	if hl2sb:IsMap() then
		SetHeliPath(ent)
	end
end)

// Fisherman MDL code fix - Phoenixf
local function FisherManFix(ent)
	if ( !IsValid(ent) ) then return end
	if ( ent:GetClass() != "npc_fisherman" ) then return end

	ent:SetModel("models/hl2sb/lostcoast/fisherman/fisherman.mdl")
	ent:SetPos(ent:GetPos() + Vector(0, 0, 5))
end

// Vortiguant Blue - July Update
local function EpisodeOneBlueVortigaunts(ent)
	if ( !IsValid(ent) ) then return end
	if ( IsValid(ent:GetNW2Entity("hl2sbSpawnedBy", nil)) ) then return end
	if ( ent:GetModel() != "models/vortigaunt_blue.mdl" ) then return end
	if ( hl2sb_getmap != "gmhl2e1_citadel_00" ) then return end

	ent:SetSubMaterial(0, "models/vortigaunt/eyeball_blue")
	ent:SetSubMaterial(1, "models/vortigaunt/vortigaunt_blue_ep1")
	ent:SetSubMaterial(2, "models/vortigaunt/eyeball_blue")
	ent:SetSubMaterial(3, "models/vortigaunt/eyeball_blue")
	ent:SetSubMaterial(4, "models/vortigaunt/eyeball_blue")
end

local function SnowyMossman(ent)
	if ( !IsValid(ent) ) then return end
	if ( hl2sb_getmap != ( "gmhl2e1_citadel_03" or "ep2_outland_11b" or "ep1_citadel_03" ) ) then return end
	if ( ent:GetClass() != "npc_mossman" and ent:GetName() != "mossman2" ) then return end

	ent:SetModel("models/hl2sb/characters/mossman_ep1.mdl")
	ent:SetPos(ent:GetPos() + Vector(0, 0, 5))
end

local function EpisodicRetextures(ent)
	if ( !IsValid(ent) ) then return end

	if ( hl2sb_getmap == "gmhl2e2_outland_12" ) then
		if ( ent:GetClass() == "npc_eli" && ent:GetName() == "eli" ) then
			ent:SetSubMaterial(4, "models/hl2sb/characters/eli_sheet_ep2")
		end

		if ( ent:GetClass() == "npc_kleiner" && ent:GetName() == "kleiner" ) then
			ent:SetSubMaterial(1, "models/hl2sb/characters/kleiner_sheet_ep2")
		end
	elseif ( hl2sb_getmap == ( "gmhl2e1_c17_02" or "gmhl2e1_c17_03" ) ) then
		if ( ent:GetClass() == "npc_barney" && ent:GetName() == "barney" ) then
			ent:SetSubMaterial(2, "models/hl2sb/characters/barneyface_ep1")
		end
	end
end

local function PhysicalCanisters(ent)
	if ( !IsValid(ent) ) then return end
	if ( hl2sb_getmap != "gmhl2e1_c17_03" ) then return end

	if ( ent:GetClass() == "env_headcrabcanister" ) then
		ent:SetMoveType(MOVETYPE_VPHYSICS)
		ent:PhysicsInit(SOLID_VPHYSICS)

		local phys = ent:GetPhysicsObject()
		if ( IsValid(phys) ) then
			phys:EnableMotion(false)
		end
	end
end

// AMMO CRATE Pickable
local modelTranslation = {
	[0] = "models/hl2sb/items/ammocrate_pistol.mdl",
	[1] = "models/hl2sb/items/ammocrate_smg1.mdl",
	[2] = "models/hl2sb/items/ammocrate_ar2.mdl",
	[3] = "models/hl2sb/items/ammocrate_rockets.mdl",
	[4] = "models/hl2sb/items/ammocrate_buckshot.mdl",
	[5] = "models/hl2sb/items/ammocrate_grenade.mdl",
	[6] = "models/hl2sb/items/ammocrate_357.mdl",
	[7] = "models/hl2sb/items/ammocrate_crossbow.mdl",
	[8] = "models/hl2sb/items/ammocrate_ar2.mdl",
	[9] = "models/hl2sb/items/ammocrate_smg1.mdl"
}

local function AmmoCrateModelSwitch(ent)
	if ( !IsValid(ent) ) then return end
	if ( ent:GetClass() != "item_ammo_crate" ) then return end

	local key = ent:GetInternalVariable("AmmoType")
	local translation = modelTranslation[key]

	if ( translation ) then
		ent:SetModel(translation)
	end

	ent:SetMoveType(MOVETYPE_VPHYSICS)
	ent:PhysicsInit(SOLID_VPHYSICS)

	local phys = ent:GetPhysicsObject()

	if ( IsValid(phys) ) then
		phys:EnableMotion(false)
	end
end

local function SoldiersModifier(ent)
	if ( !IsValid(ent) ) then return end
	if ( ent:GetClass() != "npc_combine_s" ) then return end

	if ( hl2sb.cvars.hl2sb_SoldiersVeryGoodAim.value:GetBool() ) then
		ent:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
	end

	if ( hl2sb.cvars.hl2sb_SoldiersInfiniteThrowable.value:GetBool() ) then
		for k, v in ipairs(ent:GetWeapons()) do
			v:SetSaveValue("m_iSecondaryAmmoCount", "-1")
		end

		ent:SetSaveValue("NumGrenades", "-1")
		ent:SetKeyValue("NumGrenades", "-1")
	end
end

hook.Add( "OnEntityCreated", "hl2sb_OnEntityCreated", function(ent)
	timer.Simple(0.1, function()
		if ( !IsValid(ent) ) then return end
		if hl2sb:IsMap() then
			EpisodicRetextures( ent )
			SnowyMossman( ent )
			EpisodeOneBlueVortigaunts( ent )
			SoldiersModifier( ent )
		end

		PhysicalCanisters( ent )
		FisherManFix( ent )
		AmmoCrateModelSwitch( ent )
	end)
end)

// Ballspawner OFF ON START HACK - Thanks a lot VALVe... cheap ass solution
local function hl2sb_BallspawnerOFF()
	if hl2sb_getmap == "gmhl2_c17_part5" then
		RunConsoleCommand("hl2_episodic", "1")

		timer.Simple(3, function()
			RunConsoleCommand("hl2_episodic", "0")
		end)
	end
end

// Lost coast Easter Egg
local function hl2sb_LostCoast_Easteregg()
	if ( IsMounted( "lostcoast" ) ) then
		if hl2sb_getmap == "gmhl2_coast_03" then
			for k, v in ipairs(ents.FindByName("trigger_lostcoast")) do
				v:Fire("Enable")
			end
		end
	end
end


// Hook Killfeed names
// SCRAPPED - doesn't seem to work

hook.Add( "GetDeathNoticeEntityName", "hl2sb_KillFeedNames", function(ent)
	if !hl2sb:IsMap() then return end

	if hl2sb_getmap == "gmhl2_c17_part3" then
		if ( ent:GetClass() == "npc_barney" and ent:GetName() == "fakebarney" ) then
			return "Fake Barney"
		end
	end

	if hl2sb_getmap == "gmhl2e1_c17_01" then
		if ( ent:GetClass() == "npc_sniper" and ent:GetName() == "sniper_alyx" ) then
			return "Alyx"
		end
	end
end)

// TOGGLES CODE - Phatso

//Map Breakable Props - Redox
// TODO - Need coder for making it as a toggle, so people decide if they can break them or not (MAP SPAWNED ONES)

local hl2sb_Breakprops = {
    ["hl2sb/props_c17/utilitypole01b_break.mdl"] = true
}

cvars.AddChangeCallback( "hl2sb_deathpit_triggers", function( _, _, newValue )
	if !hl2sb:IsMap() then return end

    if newValue == "1" then
        hl2sb.mapSettings.hl2sb_Deathpits.on()
    else
        hl2sb.mapSettings.hl2sb_Deathpits.off()
    end
end)

cvars.AddChangeCallback( "hl2sb_levelswitch_triggers", function( _, _, newValue )
	if !hl2sb:IsMap() then return end

    if newValue == "1" then
        hl2sb.mapSettings.hl2sb_LevelSwitchTriggers.on()
    else
        hl2sb.mapSettings.hl2sb_LevelSwitchTriggers.off()
    end
end)

cvars.AddChangeCallback( "hl2sb_antlionspawn_triggers", function( _, _, newValue )
	if !hl2sb:IsMap() then return end

    if newValue == "1" then
        hl2sb.mapSettings.hl2sb_Antlions_Spawns.on()
    else
        hl2sb.mapSettings.hl2sb_Antlions_Spawns.off()
    end
end)

// STARTING INTRO

local hl2sb_Introhasplayed = 0

local introStarterMaps = {
	["gmhl2e2_outland_01"] = true,
	["gmhl2e1_citadel_00"] = true,
	["gmhl2_trainstation_01"] = true
}

local function IntroFunc()
	if introStarterMaps[hl2sb_getmap] then
		hl2sb_Introhasplayed = 1

		if hl2sb.mapSettings.hl2sb_GmanIntro.value:GetBool() then
			ProtectedCall( hl2sb.mapSettings.hl2sb_GmanIntro.on )
		else
			ProtectedCall( hl2sb.mapSettings.hl2sb_GmanIntro.off )
		end
	end
end

hook.Add("PlayerInitialSpawn", "hl2sb_PlayerInitialSpawn", function(ply)
	if !hl2sb:IsMap() then return end

	IntroFunc()
end)

// MAP FIRST LOAD
hook.Add( "InitPostEntity", "hl2sb_InitPostEntity", function()
	if hl2sb:IsMap() then
		hl2sb_BallspawnerOFF()
		hl2sb_LostCoast_Easteregg()

		if hl2sb.mapSettings.hl2sb_Deathpits.value:GetBool() then
			ProtectedCall( hl2sb.mapSettings.hl2sb_Deathpits.on )
		end

		if hl2sb.mapSettings.hl2sb_LevelSwitchTriggers.value:GetBool() then
			ProtectedCall( hl2sb.mapSettings.hl2sb_LevelSwitchTriggers.on )
		end

		if hl2sb.mapSettings.hl2sb_Antlions_Spawns.value:GetBool() then
			ProtectedCall( hl2sb.mapSettings.hl2sb_Antlions_Spawns.on )
		end
	end

	for k, v in ents.Iterator() do
		if not ( IsValid(v) ) then continue end

		if ( v:GetClass() == "npc_fisherman" ) then
			v:SetModel( "models/hl2sb/lostcoast/fisherman/fisherman.mdl" )
			v:SetPos(v:GetPos() + Vector(0, 0, 5))
		end

		if hl2sb_getmap == "gmhl2e1_citadel_03" or hl2sb_getmap == "ep2_outland_11b" or hl2sb_getmap == "ep1_citadel_03" then
			if ( v:GetClass() == "npc_mossman" and v:GetName() == "mossman2" ) then
				v:SetModel( Model( "models/hl2sb/characters/mossman_ep1.mdl" ) )
				v:SetPos(v:GetPos() + Vector(0, 0, 5))
			end
		end

		if hl2sb_getmap == "gmhl2e2_outland_12" then
			if ( v:GetClass() == "npc_eli" and ent:GetName() == "eli" ) then
				v:SetSubMaterial( 4, "models/hl2sb/characters/eli_sheet_ep2" )
			end

			if ( v:GetClass() == "npc_kleiner" and v:GetName() == "kleiner" ) then
				v:SetSubMaterial( 0, "models/hl2sb/characters/kleiner_sheet_ep2" )
			end
		end

		if hl2sb_getmap == "gmhl2e1_c17_02" or hl2sb_getmap == "gmhl2e1_c17_03" then
			if ( v:GetClass() == "npc_barney" and v:GetName() == "barney" ) then
				v:SetSubMaterial( 2, "models/hl2sb/characters/barneyface_ep1" )
			end
		end

		if hl2sb_getmap == "gmhl2e1_c17_03" then
			if ( v:GetClass() == "env_headcrabcanister" ) then
				v:SetMoveType( MOVETYPE_VPHYSICS )
				v:PhysicsInit( SOLID_VPHYSICS )

				local phys = v:GetPhysicsObject()
				if ( IsValid( phys ) ) then
					phys:EnableMotion( false )
				end
			end
		end

		if ( v:GetClass() == "item_ammo_crate" ) then
			local key = v:GetInternalVariable( "AmmoType" )
			local translation = modelTranslation[key]

			if ( translation ) then
				v:SetModel(translation)
			end

			v:SetMoveType( MOVETYPE_VPHYSICS )
			v:PhysicsInit( SOLID_VPHYSICS )
			local phys = v:GetPhysicsObject()

			if IsValid( phys ) then
				phys:EnableMotion( false )
			end
		end
	end

end)

// ADMIN CLEANUP

hook.Add( "PostCleanupMap", "hl2sb_PostCleanupMap", function()
	if !hl2sb:IsMap() then return end

	hl2sb_BallspawnerOFF()
	hl2sb_LostCoast_Easteregg()

	if hl2sb_getmap == "gmhl2_lostcoast" then
		timer.Simple(0.1, function()
			for k, v in ipairs(ents.FindByName("tele_restart")) do
				v:Fire("Teleport")
			end
		end)
	end

	if hl2sb_getmap == "gmhl2_trainstation_01" then
		for k, v in ipairs(ents.FindByName("point_teleport_intro")) do
			v:Fire("Teleport")
		end

		for k, v in ipairs(ents.FindByName("zoom_final")) do
			v:Fire("UnZoom")
		end
	end

	if hl2sb.mapSettings.hl2sb_GmanIntro.value:GetBool() then
		ProtectedCall( hl2sb.mapSettings.hl2sb_GmanIntro.on )
	else
		ProtectedCall( hl2sb.mapSettings.hl2sb_GmanIntro.off )
	end

	if hl2sb_getmap == "gmhl2_trainstation_02" then
		for k, v in ipairs(ents.FindByName("gordon_criminal_global")) do
			v:Fire("TurnOn")
		end
	end

	if hl2sb_getmap == "gmhl2_eli_02" or hl2sb_getmap == "gmhl2e1_citadel_04" then
		for k, v in ipairs(ents.FindByName("spawn_alyx")) do
			v:Fire("Spawn")
		end
	end

	if hl2sb_getmap == "gmhl2e1_c17_03" then
		for k, v in ipairs(ents.FindByName("fog")) do
			v:Fire("SetColor", "215 200 170")
			v:Fire("SetColorSecondary", "215 200 170")
			v:Fire("SetStartDist", 200)
			v:Fire("SetEndDist", 13000)
		end
	end

	if hl2sb_getmap == "gmhl2e1_citadel_03" then
		for k, v in ipairs(ents.FindByName("global_newgame_template_base_items")) do
			v:Fire("ForceSpawn")
		end

		for k, v in ipairs(ents.FindByName("global_newgame_template_base_items")) do
			v:Fire("ForceSpawn")
		end
	end

    if hl2sb.mapSettings.hl2sb_Deathpits.value:GetBool() then
        ProtectedCall( hl2sb.mapSettings.hl2sb_Deathpits.on )
    end

    if hl2sb.mapSettings.hl2sb_LevelSwitchTriggers.value:GetBool() then
        ProtectedCall( hl2sb.mapSettings.hl2sb_LevelSwitchTriggers.on )
    end

    if hl2sb.mapSettings.hl2sb_Antlions_Spawns.value:GetBool() then
        ProtectedCall( hl2sb.mapSettings.hl2sb_Antlions_Spawns.on )
    end
end)

local function EntityGodmode(ent, dmgInfo)
	if ( !IsValid( ent ) ) then return false end

	local bGodmode = hl2sb:IsEnabled("hl2sb_NPCGodmode") or false
	local ent_class = ent:GetClass()
	local ent_name = ent:GetName()

	if map == "gmhl2e1_citadel_03" then
		local bNearCore = false

		for k, v in ipairs(ents.FindInSphere(ent:GetPos(), 200)) do
			if ( v:GetClass() == "prop_coreball" ) then
				bNearCore = true
				break
			end
		end

		if ( bNearCore and IsValid(dmgInfo:GetAttacker()) and dmgInfo:GetAttacker() == ent and hl2sb:IsEnabled("hl2sb_ep1_CoreDamage") ) then
			return true
		end
	end

	local godModeTable = hl2sb.godModeNPCNames[ent_class]
	if ( godModeTable and ent:IsNPC() and bGodmode ) then
		for k, v in ipairs(godModeTable) do
			if ( ent_name == v ) then
				return true
			end
		end
	end

	return false
end

hook.Add("EntityTakeDamage", "hl2sb_EntityTakeDamage", function(ent, dmgInfo)
	if !IsValid( ent ) then return end
	if !hl2sb:IsMap() then return end

	local bGodmode = EntityGodmode(ent, dmgInfo)
	if ( bGodmode ) then
		return true
	end
end)

local function ZombieHeadless(ent)
	if !IsValid(ent) then return end
	if ent:GetClass() != ( "npc_zombie" || "npc_fastzombie" || "npc_poisonzombie" ) then return end
	if !ent.NPCTable or !ent.NPCTable.ListClass then return end

	if ent:GetClass() == "npc_zombie" and ent.NPCTable.ListClass == "npc_zombie_crabless" then
		local attachment = ent:LookupAttachment("headcrab")
		local data_attach = ent:GetAttachment(attachment)

		if data_attach then
			for k, v in ipairs(ents.FindInSphere(data_attach.Pos, 10)) do
				if v:GetClass() == "npc_headcrab" then
					SafeRemoveEntity(v)
				end
			end
		end
	elseif ent:GetClass() == "npc_poisonzombie" and ent.NPCTable.ListClass == "npc_poisonzombie_crabless" then
		for i = 1, 5 do
			local attachment = ent:LookupAttachment("headcrab" .. i)
			local data_attach = ent:GetAttachment(attachment)

			if data_attach then
				for k, v in ipairs(ents.FindInSphere(data_attach.Pos, 20)) do
					if v:GetClass() == "npc_headcrab_black" or v:GetClass() == "npc_headcrab_poison" then
						SafeRemoveEntity(v)
					end
				end
			end
		end
	elseif ent:GetClass() == "npc_fastzombie" and ent.NPCTable.ListClass == "npc_fastzombie_crabless" then
		local attachment = ent:LookupAttachment("headcrab")
		local data_attach = ent:GetAttachment(attachment)

		if data_attach then
			for k, v in ipairs(ents.FindInSphere(data_attach.Pos, 10)) do
				if v:GetClass() == "npc_headcrab_fast" then
					SafeRemoveEntity(v)
				end
			end
		end
	end
end

local function ExplodeNPC(ent)
	if !IsValid(ent) then return end
	if !hl2sb:IsEnabled("hl2sb_NPCsExplodeOnDeath") then return end
	if !ent:IsNPC() then return end

	local env_explosion = ents.Create("env_explosion")
	env_explosion:SetPos(ent:GetPos())
	env_explosion:SetOwner(ent)
	env_explosion:SetKeyValue("iMagnitude", "0")
	env_explosion:Spawn()
	env_explosion:Fire("Explode", 0, 0)
end

hook.Add("OnNPCKilled", "hl2sb_OnNPCKilled", function(ent, attacker, inflictor)
	if !IsValid( ent ) then return end
	ZombieHeadless(ent)

	if hl2sb:IsMap() then
		ExplodeNPC(ent)
	end
end)

do
	util.AddNetworkString("request_hl2sb_TRAINSTATION_02_ClearProps")
	util.AddNetworkString("request_hl2sb_CAN01_TrainR")
	util.AddNetworkString("request_hl2sb_CAN01_TrainN")
	util.AddNetworkString("request_hl2sb_CAN01_TrainNGO")
	util.AddNetworkString("request_hl2sb_RAVEN_KillClouds")
	util.AddNetworkString("request_hl2sb_HW17_Bridge_Train")
	util.AddNetworkString("request_hl2sb_HW17_Bridge_ClearCars")
	util.AddNetworkString("request_hl2sb_SANDTRAP_COAST_09_ClearCars")
	util.AddNetworkString("request_hl2sb_RemoveNPCs")

	net.Receive("request_hl2sb_CAN01_TrainR", function(len, ply)
		if !hl2sb:IsMap() then return end
		if !ply:IsAdmin() then return end
		if hl2sb_getmap != "gmhl2_canals_01" then return end

		for k, v in ipairs(ents.FindByName("looping_traincar2")) do
			v:Fire("teleporttopathtrack", "train_2_start", 0)
		end

		for k, v in ipairs(ents.FindByName("call_train_razor")) do
			v:Fire("Trigger", 0)
		end
	end)

	net.Receive("request_hl2sb_CAN01_TrainN", function(len, ply)
		if !hl2sb:IsMap() then return end
		if !ply:IsAdmin() then return end
		if hl2sb_getmap != "gmhl2_canals_01" then return end

		for k, v in ipairs(ents.FindByName("looping_traincar1")) do
			v:Fire("teleporttopathtrack", "train_1_start", 0)
			v:Fire("startforward", 0)
		end

		for k, v in ipairs(ents.FindByName("trainstopped_wav")) do
			v:Fire("StopSound", 0)
		end
	end)

	net.Receive("request_hl2sb_CAN01_TrainNGO", function(len, ply)
		if !hl2sb:IsMap() then return end
		if !ply:IsAdmin() then return end
		if hl2sb_getmap != "gmhl2_canals_01" then return end

		for k, v in ipairs(ents.FindByName("depart_train1")) do
			v:Fire("Trigger", 0)
		end
	end)

	net.Receive("request_hl2sb_HW17_Bridge_Train", function(len, ply)
		if !hl2sb:IsMap() then return end
		if !ply:IsAdmin() then return end
		if hl2sb_getmap != "gmhl2_coast_bridge" then return end

		for k, v in ipairs(ents.FindByName("razortrain")) do
			v:Fire("teleporttopathtrack", "train_2_start", 0)
		end

		for k, v in ipairs(ents.FindByName("call_train")) do
			v:Fire("Trigger", 0)
		end
	end)

	net.Receive("request_hl2sb_HW17_Bridge_ClearCars", function(len, ply)
		if !hl2sb:IsMap() then return end
		if !ply:IsAdmin() then return end
		if hl2sb_getmap != "gmhl2_coast_01" or hl2sb_getmap != "gmhl2_coast_bridge" then return end

		for k, v in ipairs(ents.FindByName("clear_railways")) do
			v:Fire("Trigger", 0)
		end
	end)

	net.Receive("request_hl2sb_TRAINSTATION_02_ClearProps", function(len, ply)
		if !hl2sb:IsMap() then return end
		if !ply:IsAdmin() then return end
		if hl2sb_getmap != "gmhl2_trainstation_02" then return end

		for k, v in ipairs(ents.FindByName("prop_stairblockers")) do
			v:Fire("Kill", 0)
		end
	end)

	net.Receive("request_hl2sb_RAVEN_KillClouds", function(len, ply)
		if !hl2sb:IsMap() then return end
		if !ply:IsAdmin() then return end
		if hl2sb_getmap != "gmhl2_ravenholm" or hl2sb_getmap != "gmhl2_c17_part1" then return end

		for k, v in ipairs(ents.FindByName("smokeclouds")) do
			v:Fire("Kill", 0)
		end
	end)

	net.Receive("request_hl2sb_SANDTRAP_COAST_09_ClearCars", function(len, ply)
		if !hl2sb:IsMap() then return end
		if !ply:IsAdmin() then return end
		if hl2sb_getmap != "gmhl2_coast_09" then return end

		for k, v in ipairs(ents.FindByName("clear_road")) do
			v:Fire("Trigger", 0)
		end
	end)

	net.Receive("request_hl2sb_RemoveNPCs", function(len, ply)
		if !hl2sb:IsMap() then return end
		if !ply:IsAdmin() then return end

		for k, v in ipairs(ents.FindByClass("npc_*")) do
			SafeRemoveEntity(v)
		end
	end)
end