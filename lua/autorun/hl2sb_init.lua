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

if ( GlowLib ) then
	GlowLib.Glow_Data["models/hl2sb/characters/vortigaunt_blue.mdl"] = table.Copy(GlowLib.Glow_Data["models/vortigaunt.mdl"])
	local glowData = GlowLib.Glow_Data["models/hl2sb/characters/vortigaunt_blue.mdl"]

	function glowData:ShouldDraw(ent, sprite)
		local mat = Material("models/vortigaunt/vortigaunt_blue_ep1")
		if ( !mat ) then return false end

		local bEnabled = mat:GetFloat("$warpparam")
		if ( bEnabled == 0 ) then return false end

		return true
	end

	glowData.Color = {
		[0] = Color(0, 120, 255)
	}

	glowData.Size = 0.5

	GlowLib:Define("models/hl2sb/characters/advisor_ep2.mdl", {
		Position = function(self, ent)
			if ( !IsValid(ent) ) then return end

			local attachmentData = ent:GetAttachment(ent:LookupAttachment("attach_mask_end_l"))
			return attachmentData.Pos
		end,
		Attachment = "attach_mask_end_l",
		Color = {
			[0] = Color(0, 255, 255)
		},
		Size = 0.35
	})
end