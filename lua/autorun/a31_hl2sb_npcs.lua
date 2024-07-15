local Category = "Humans + Resistance"

if ( IsMounted( "episodic" ) ) then
	local HL2SB_NPC_MOSSMAN = 
	{
		Name = "Mossman (Arctic)",
		Class = "npc_mossman",
		Model = "models/hl2sb/characters/Mossman_ep1.mdl",
		Category = Category,
		ListClass = "npc_mossman_episodic",
	}
	list.Set( "NPC", "npc_mossman_episodic", HL2SB_NPC_MOSSMAN )

	local HL2SB_NPC_BVORTI = 
	{
		Name = "Vortigaunt (Blue)",
		Class = "npc_vortigaunt",
		Model = "models/hl2sb/characters/vortigaunt_blue.mdl",
		Category = Category,
		KeyValues = { SquadName = "resistance", ArmorRechargeEnabled = 1 },
		ListClass = "npc_bluevorti_episodic",

	}
	list.Set( "NPC", "npc_bluevorti_episodic", HL2SB_NPC_BVORTI )

	local HL2SB_NPC_BARNEYBLOOD = 
	{
		Name = "Barney Calhoun (Ep1)",
		Class = "npc_barney",
		Category = Category,
		Weapons = { "weapon_smg1", "weapon_shotgun", "weapon_ar2" },
		KeyValues = { SquadName = "resistance"},
		ListClass = "npc_barney_episodic",

	}
	list.Set( "NPC", "npc_barney_episodic", HL2SB_NPC_BARNEYBLOOD )
end

local HL2SB_NPC_KLEINER = 
{
	Name = "Kleiner (Dark Labcoat)",
	Class = "npc_kleiner",
	Category = Category,
	ListClass = "npc_kleiner_episodic",
}
list.Set( "NPC", "npc_kleiner_episodic", HL2SB_NPC_KLEINER )

local HL2SB_NPC_ELI = 
{
	Name = "Eli Vance (Sweater)",
	Class = "npc_eli",
	Category = Category,
	ListClass = "npc_eli_episodic",

}
list.Set( "NPC", "npc_eli_episodic", HL2SB_NPC_ELI )

local HL2SB_NPC_ROLLER_ALYX = 
{
	Name = "Rollermine (Hacked)",
	Class = "npc_rollermine",
	Category = Category,
	Offset = 20,
	KeyValues = { SquadName = "resistance" },
	NoDrop = true,
	ListClass = "npc_rollermine_alyxhack",

}
list.Set( "NPC", "npc_rollermine_alyxhack", HL2SB_NPC_ROLLER_ALYX )

if ( IsMounted( "ep2" ) ) then
	local HL2SB_NPC_COMBINEMINE_FRIENDLY = 
	{
		Name = "Combine Mine (Modified)",
		Class = "combine_mine",
		Category = Category,
		KeyValues = {SquadName = "resistance", Modification = 1 },
		ListClass = "npc_combinemine_resistance",

	}
	list.Set( "NPC", "npc_combinemine_resistance", HL2SB_NPC_COMBINEMINE_FRIENDLY )

	local HL2SB_NPC_TURRETFLOOR_FRIENDLY = 
	{
		Name = "Turret (Modified)",
		Class = "npc_turret_floor",
		Category = Category,
		SpawnFlags = 512,
		OnFloor = true,
		Rotate = Angle( 0, 180, 0 ),
		Offset = 2,
		KeyValues = {SquadName = "resistance" },
		ListClass = "npc_turretfloor_resistance",

	}
	list.Set( "NPC", "npc_turretfloor_resistance", HL2SB_NPC_TURRETFLOOR_FRIENDLY )
end

local Category = "Combine"

local HL2SB_NPC_HELICOPTER_NIGHT = 
{
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
list.Set( "NPC", "npc_helicopter_nightlights", HL2SB_NPC_HELICOPTER_NIGHT )

local HL2SB_NPC_HELICOPTER_GUNSHIP = 
{
	Name = "Hunter-Chopper (Gunship)",
	Class = "npc_combinegunship",
	Category = Category,
	Offset = 300,
	KeyValues = { SquadName = "overwatch" },
	NoDrop = true,
	SpawnFlags = SERVER and bit.bor( 8192, 4096 ) or nil,
	ListClass = "npc_gunship_chopper",

}
list.Set( "NPC", "npc_gunship_chopper", HL2SB_NPC_HELICOPTER_GUNSHIP )

// VEHICLES

local Category = "Half-Life 2"

local HL2SB_VEH_COMBINE_APC = 
{
	Name = "Combine APC",
	Model = "models/hl2sb/vehicles/combine_apc.mdl",
	Class = "prop_vehicle_apc",
	Category = Category,
	KeyValues = { vehiclescript = "scripts/vehicles/apc.txt" },
	ListClass = "hl2sb_prop_vehicle_apc",

}
list.Set( "Vehicles", "hl2sb_prop_vehicle_apc", HL2SB_VEH_COMBINE_APC )