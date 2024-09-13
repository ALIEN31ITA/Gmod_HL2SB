if ( !GlowLib ) then
    return MsgC(Color(255, 0, 0), "[ GlowLib ] ", color_white, "GlowLib is not installed! You could install it to use the custom glow data for HL2 Sandbox Support!\n")
end

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

        local attachmentData = ent:GetAttachment(ent:LookupAttachment("glowlib_camera"))
        return attachmentData.Pos
    end,
    Attachment = "glowlib_camera",
    Color = {
        [0] = Color(0, 205, 255)
    },
    Size = 0.35
})