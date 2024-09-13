hl2sb = hl2sb or {}

CreateConVar("hl2sb_npcgodmode", "0", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Enable/Disable NPC Godmode for Story NPCs")

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