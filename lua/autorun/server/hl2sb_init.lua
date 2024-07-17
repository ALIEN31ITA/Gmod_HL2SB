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

	if ( ent:IsNPC() and godModeNPCs[eName] and bGodmode ) then
		return true
	end
end)