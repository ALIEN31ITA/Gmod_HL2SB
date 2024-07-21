CreateConVar("hl2sb_npcgodmode", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Enable/Disable NPC Godmode for Story NPCs")

local godModeNPCs = {
	["alyx_name"] = true,
	["barney_name"] = true,
}

hook.Add("EntityTakeDamage", "HL2SB_NPCGodmode", function(ent, dmginfo)
	if ( !IsValid( ent ) ) then return end

	local bGodmode = GetConVar("hl2sb_npcgodmode"):GetBool()
	local eName = ent:GetName() or ""

	local map = game.GetMap()
	if ( !map:find("gmhl2") ) then return end

	if ( ent:IsNPC() and godModeNPCs[eName:lower()] and bGodmode ) then
		return true
	end
end)