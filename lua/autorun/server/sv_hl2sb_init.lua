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

hook.Add("EntityTakeDamage", "hl2sb_NPCGodmode", function(ent, dmginfo)
	if !IsValid( ent ) then return end

	local bGodmode = GetConVar("hl2sb_npcgodmode"):GetBool()
	local ent_class = ent:GetClass()
	local ent_name = ent:GetName()

	local map = game.GetMap()
	if !tobool(map:find("gmhl2")) then return end

	if map == "gmhl2e1_citadel_03" then
		local bNearCore = false

		for k, v in ipairs(ents.FindInSphere(ent:GetPos(), 200)) do
			if ( v:GetClass() == "prop_coreball" ) then
				bNearCore = true
				break
			end
		end

		if ( bNearCore and IsValid(dmginfo:GetAttacker()) and dmginfo:GetAttacker() == ent and GetConVar("hl2sb_ep1_core_damage"):GetBool() ) then
			return true
		end
	end

	local godModeTable = hl2sb.godModeNPCNames[ent_class]
	if ( godModeTable and ent:IsNPC() and bGodmode ) then
		for k, v in ipairs(hl2sb.godModeTable) do
			if ( ent_name == v ) then
				return true
			end
		end
	end
end)