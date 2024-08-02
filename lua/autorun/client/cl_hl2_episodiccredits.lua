local hl2credits_getmap = game.GetMap()
local hl2credits_panel

if ( IsValid(hl2credits_panel) ) then
    hl2credits_panel:Remove()
    hl2credits_panel = nil
end

surface.CreateFont("HL2SBCreditsFont", {
    font = "HL2Credits",
    size = 35,
    weight = 500,
    antialias = true,
    shadow = false
})

surface.CreateFont("HL2SBGenericFont", {
    font = "HL2Generic",
    size = 35,
    weight = 500,
    antialias = true,
    shadow = false
})

local fadeStart = 0
local fadeEnd = 5
local fadeHold = 3
local fadeTime = fadeEnd - fadeStart

concommand.Add("HL2SB_StartIntro", function()
    fadeStart = CurTime()
    fadeEnd = CurTime() + fadeTime
    fadeTime = fadeEnd - fadeStart
end)

concommand.Add("HL2SB_DisplayCredits", function()
    if ( IsValid(hl2credits_panel) ) then
        hl2credits_panel:Remove()
        hl2credits_panel = nil
    end

    hl2credits_panel = vgui.Create( "DPanel" )
    hl2credits_panel:SetPos( 0, 0 )
    hl2credits_panel:SetSize( ScrW(), ScrH() )
    hl2credits_panel:SetBackgroundColor(ColorAlpha(color_white, 0))

    local Avatar_Bloodycop = vgui.Create("AvatarImage", Panel)
    Avatar_Bloodycop:SetSize(128, 128)
    Avatar_Bloodycop:SetPos(ScrW() / 2 - 300, ScrH() / 2 - 128)
    Avatar_Bloodycop:SetSteamID("76561198373309941") // eon ( bloodycop )

    local Avatar_Alien31 = vgui.Create("AvatarImage", Panel)
    Avatar_Alien31:SetSize(128, 128)
    Avatar_Alien31:SetPos(ScrW() / 2 + 200, ScrH() / 2 - 128)
    Avatar_Alien31:SetSteamID("76561198130175522") // Alien31
end)

concommand.Add("HL2SB_StopIntro", function()
    fadeStart = 0
    fadeEnd = 5
    fadeTime = fadeEnd - fadeStart
end)

local creditsMap = {
    ["gmhl2e1_citadel_00"] = "HALF-LIFE'\n== episode one==",
    ["ep1_citadel_00"] = "HALF-LIFE'\n== episode one==",
    ["gmhl2e2_outland_01"] = "HALF-LIFE'\n== episode two==",
    ["ep2_outland_01"] = "HALF-LIFE'\n== episode two=="
}

hook.Add("HUDPaint", "HL2EP1SandboxCredits", function()
    local curTime = CurTime()
    local alpha = 255

    if ( fadeStart == 0 ) then return end

    if curTime < fadeEnd then
        alpha = Lerp((curTime - fadeStart) / fadeTime, 0, 255)
    elseif curTime > fadeEnd + fadeHold then
        alpha = Lerp((curTime - fadeEnd - fadeHold) / fadeTime, 255, 0)
    end

	local hl2sb_markupfonts = markup.Parse("<font=HL2SBCreditsFont>HALF-LIFE'</font>\n<font=HL2SBGenericFont>== sandbox==</font>")

	local mapName = creditsMap[hl2credits_getmap] or "==NOT==\nHALF-LIFE'\nMAP"
	draw.DrawText(mapName, "HL2SBCreditsFont", ScrW() / 2, ScrH() / 2.08, Color(255, 255, 255, alpha), TEXT_ALIGN_CENTER)
end)

hook.Add("HUDPaint", "HL2SBAddonCredits", function()
	//todo lol
end)
