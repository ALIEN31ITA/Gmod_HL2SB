CreateConVar("hl2sb_npcgodmode", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Enable/Disable NPC Godmode for Story NPCs")

local godModeNPCNames = {
	["npc_alyx"] = {"alyx"},
}

hook.Add("EntityTakeDamage", "HL2SB_NPCGodmode", function(ent, dmginfo)
	if ( !IsValid( ent ) ) then return end

	local bGodmode = GetConVar("hl2sb_npcgodmode"):GetBool()
	local ent_class = ent:GetClass():lower()
	local ent_name = ent:GetName():lower()

	local map = game.GetMap()
	if ( !map:find("gmhl2") ) then return end

	if ( ent:IsNPC() and bGodmode ) then
		for k, v in pairs(godModeNPCNames) do
			if ( ent_class == k ) then
				for index, entName in ipairs(v) do
					if ( ent_name == entName ) then
						return true
					end
				end
			end
		end
	end
end)