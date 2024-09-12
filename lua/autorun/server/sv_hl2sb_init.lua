CreateConVar("hl2sb_npcgodmode", "0", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Enable/Disable NPC Godmode for Story NPCs")

local godModeNPCNames = {
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

hook.Add("EntityTakeDamage", "HL2SB_NPCGodmode", function(ent, dmginfo)
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

	local godModeTable = godModeNPCNames[ent_class]
	if ( godModeTable and ent:IsNPC() and bGodmode ) then
		for k, v in ipairs(godModeTable) do
			if ( ent_name == v ) then
				return true
			end
		end
	end
end)

hook.Add("ShutDown", "HL2SB_SaveEP2Nectar", function()
	file.Write("hl2sb_ep2_nectar.txt", "0")
end)

hook.Add("InitPostEntity", "HL2SB_EP2TriggerNectar", function()
	file.Write("hl2sb_ep2_nectar.txt", "0")
end)

function HL2SB_EP2TriggerNectar()
	file.Write("hl2sb_ep2_nectar.txt", "1")
end