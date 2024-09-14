hl2sb = hl2sb or {}

local Category = "Humans + Resistance"

if ( IsMounted( "episodic" ) ) then
	local hl2sb_NPC_MOSSMAN = {
		Name = "Mossman (Arctic)",
		Class = "npc_mossman",
		Model = "models/hl2sb/characters/Mossman_ep1.mdl",
		Category = Category,
		ListClass = "npc_mossman_episodic",
	}

	list.Set( "NPC", "npc_mossman_episodic", hl2sb_NPC_MOSSMAN )

	local hl2sb_NPC_BVORTI = {
		Name = "Vortigaunt (Blue)",
		Class = "npc_vortigaunt",
		Model = "models/vortigaunt_blue.mdl",
		Category = Category,
		KeyValues = { SquadName = "resistance", ArmorRechargeEnabled = 1 },
		ListClass = "npc_bluevorti_episodic",
	}

	list.Set( "NPC", "npc_bluevorti_episodic", hl2sb_NPC_BVORTI )

	local hl2sb_NPC_BARNEYBLOOD = {
		Name = "Barney Calhoun (Ep1)",
		Class = "npc_barney",
		Category = Category,
		Weapons = { "weapon_smg1", "weapon_shotgun", "weapon_ar2" },
		KeyValues = { SquadName = "resistance" },
		ListClass = "npc_barney_episodic",
	}

	list.Set( "NPC", "npc_barney_episodic", hl2sb_NPC_BARNEYBLOOD )
end

local hl2sb_NPC_BARNEY_CP = {
	Name = "Barney Calhoun (CP)",
	Class = "npc_barney",
	Category = "Combine",
	Weapons = { "weapon_smg1", "weapon_ar2" },
	KeyValues = { SquadName = "overwatch" },
	ListClass = "npc_barney_cp",
}

list.Set( "NPC", "npc_barney_cp", hl2sb_NPC_BARNEY_CP )

local hl2sb_NPC_BARNEY_CP_HOSTILE = {
	Name = "Barney Calhoun (CP Hostile)",
	Class = "npc_metropolice",
	Category = "Combine",
	Weapons = { "weapon_smg1" },
	KeyValues = { SquadName = "overwatch" },
	ListClass = "npc_barney_cp_hostile",
}

list.Set( "NPC", "npc_barney_cp_hostile", hl2sb_NPC_BARNEY_CP_HOSTILE )

local hl2sb_NPC_KLEINER = {
	Name = "Kleiner (Dark Labcoat)",
	Class = "npc_kleiner",
	Category = Category,
	ListClass = "npc_kleiner_episodic",
}

list.Set( "NPC", "npc_kleiner_episodic", hl2sb_NPC_KLEINER )

local hl2sb_NPC_ELI = {
	Name = "Eli Vance (Sweater)",
	Class = "npc_eli",
	Category = Category,
	ListClass = "npc_eli_episodic",
}

list.Set( "NPC", "npc_eli_episodic", hl2sb_NPC_ELI )

local hl2sb_NPC_ROLLER_ALYX = {
	Name = "Rollermine (Hacked)",
	Class = "npc_rollermine",
	Category = Category,
	Offset = 20,
	KeyValues = { SquadName = "resistance" },
	NoDrop = true,
	ListClass = "npc_rollermine_alyxhack",

}

list.Set( "NPC", "npc_rollermine_alyxhack", hl2sb_NPC_ROLLER_ALYX )

if ( IsMounted( "ep2" ) ) then
	local hl2sb_NPC_COMBINEMINE_FRIENDLY = {
		Name = "Combine Mine (Modified)",
		Class = "combine_mine",
		Category = Category,
		KeyValues = { SquadName = "resistance", Modification = 1 },
		ListClass = "npc_combinemine_resistance",
	}

	list.Set( "NPC", "npc_combinemine_resistance", hl2sb_NPC_COMBINEMINE_FRIENDLY )

	local hl2sb_NPC_TURRETFLOOR_FRIENDLY = {
		Name = "Turret (Modified)",
		Class = "npc_turret_floor",
		Category = Category,
		SpawnFlags = 512,
		OnFloor = true,
		Rotate = Angle( 0, 180, 0 ),
		Offset = 2,
		KeyValues = { SquadName = "resistance" },
		ListClass = "npc_turretfloor_resistance",
	}

	list.Set( "NPC", "npc_turretfloor_resistance", hl2sb_NPC_TURRETFLOOR_FRIENDLY )
end

local Category = "Combine"

local hl2sb_NPC_HELICOPTER_NIGHT = {
	Name = "Hunter-Chopper (Lights)",
	Class = "npc_helicopter",
	Category = Category,
	Offset = 300,
	Health = 600,
	KeyValues = { SquadName = "overwatch" },
	NoDrop = true,
	SpawnFlags = 262144,
	ListClass = "npc_helicopter_nightlights",
}

list.Set( "NPC", "npc_helicopter_nightlights", hl2sb_NPC_HELICOPTER_NIGHT )

local hl2sb_NPC_HELICOPTER_GUNSHIP = {
	Name = "Hunter-Chopper (Gunship)",
	Class = "npc_combinegunship",
	Category = Category,
	Offset = 300,
	KeyValues = { SquadName = "overwatch" },
	NoDrop = true,
	SpawnFlags = SERVER and bit.bor( 8192, 4096 ) or nil,
	ListClass = "npc_gunship_chopper",
}

list.Set( "NPC", "npc_gunship_chopper", hl2sb_NPC_HELICOPTER_GUNSHIP )

// VEHICLES

local Category = "Half-Life 2"

local hl2sb_VEH_COMBINE_APC = {
	Name = "Combine APC (hl2sb)",
	Model = "models/hl2sb/vehicles/combine_apc.mdl",
	Class = "prop_vehicle_apc",
	Category = Category,
	KeyValues = { vehiclescript = "scripts/vehicles/apc.txt" },
	ListClass = "hl2sb_prop_vehicle_apc",
}

list.Set( "Vehicles", "hl2sb_prop_vehicle_apc", hl2sb_VEH_COMBINE_APC )