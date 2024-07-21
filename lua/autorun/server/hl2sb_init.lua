CreateConVar("hl2sb_npcgodmode", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Enable/Disable NPC Godmode for Story NPCs")

local godModeNPCNames = {
	["alyx_name"] = true,
	["barney_name"] = true,
}

local godModeNPCs = {
	["npc_alyx"] = true,
	["npc_barney"] = true,
}

hook.Add("EntityTakeDamage", "HL2SB_NPCGodmode", function(ent, dmginfo)
	if ( !IsValid( ent ) ) then return end

	local bGodmode = GetConVar("hl2sb_npcgodmode"):GetBool()
	local ent_class = ent:GetClass():lower()
	local ent_name = ent:GetName():lower()

	local map = game.GetMap()
	if ( !map:find("gmhl2") ) then print("wrong map") return end

	if ( ent:IsNPC() and ( godModeNPCs[ent_class] and godModeNPCNames[ent_name] ) and bGodmode ) then
		return true
	end
end)