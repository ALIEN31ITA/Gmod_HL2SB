if ( !GlowLib ) then
    return MsgC(Color(255, 0, 0), "[ GlowLib ] ", color_white, "GlowLib is not installed! You could install it to use the custom glow data for HL2 Sandbox Support!\n")
end

GlowLib:Define("models/hl2sb/characters/advisor_ep2.mdl", {
    Position = function(self, ent)
        if ( !IsValid(ent) ) then return end

        local attachmentData = ent:GetAttachment(ent:LookupAttachment("glowlib_camera"))
        return attachmentData.Pos + attachmentData.Ang:Right() * -1
    end,
    Attachment = "glowlib_camera",
    Color = {
        [0] = Color(0, 255, 255, 150)
    },
})