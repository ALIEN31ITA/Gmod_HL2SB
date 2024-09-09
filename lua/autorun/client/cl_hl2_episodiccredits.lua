local hl2credits_getmap = game.GetMap()

surface.CreateFont("HL2SBCreditsFont", {
    font = "HL2Credits",
    size = 35,
    weight = 500,
    antialias = true,
    shadow = false
})
surface.CreateFont("HL2SBCreditsFontBig", {
    font = "HL2Credits",
    size = 95,
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

surface.CreateFont("HL2SBGenericFontMed", {
    font = "HL2Generic",
    size = 50,
    scanlines = 2,
    weight = 500,
    antialias = true,
    shadow = false
})

surface.CreateFont("HL2SBGenericFontBig", {
    font = "HL2Generic",
    size = 95,
    weight = 500,
    antialias = true,
    shadow = false
})

local HL2SB_IntroFadeStart = 0
local HL2SB_IntroFadeEnd = 5
local HL2SB_IntroFadeHold = 3
local HL2SB_IntroFadeTime = HL2SB_IntroFadeEnd - HL2SB_IntroFadeStart

concommand.Add("HL2SB_StartIntro", function()
    HL2SB_IntroFadeStart = CurTime()
    HL2SB_IntroFadeEnd = CurTime() + HL2SB_IntroFadeTime
    HL2SB_IntroFadeTime = HL2SB_IntroFadeEnd - HL2SB_IntroFadeStart
end)

concommand.Add("HL2SB_StopIntro", function()
    HL2SB_IntroFadeStart = 0
    HL2SB_IntroFadeEnd = 5
    HL2SB_IntroFadeTime = HL2SB_IntroFadeEnd - HL2SB_IntroFadeStart
end)

local HL2SB_OutroFadeStart = 0
local HL2SB_OutroFadeEnd = 5
local HL2SB_OutroFadeHold = 3
local HL2SB_OutroFadeTime = HL2SB_OutroFadeEnd - HL2SB_OutroFadeStart

local HL2SB_CreditSound = Sound("hl2sb/ui/checkpoint_reached.wav")
concommand.Add("HL2SB_DisplayCredits", function()
	LocalPlayer():EmitSound(HL2SB_CreditSound)
    HL2SB_OutroFadeStart = CurTime()
    HL2SB_OutroFadeEnd = CurTime() + HL2SB_OutroFadeTime
    HL2SB_OutroFadeTime = HL2SB_OutroFadeEnd - HL2SB_OutroFadeStart
end)

concommand.Add("HL2SB_StopCredits", function()
    HL2SB_OutroFadeStart = 0
    HL2SB_OutroFadeEnd = 5
    HL2SB_OutroFadeTime = HL2SB_OutroFadeEnd - HL2SB_OutroFadeStart
end)

local creditsMap = {
    ["gmhl2e1_citadel_00"] = "HALF-LIFE'\n== episode one==",
    ["ep1_citadel_00"] = "HALF-LIFE'\n== episode one==",
    ["gmhl2e1_c17_03"] = "HALF-LIFE'\n== episode one==",
    ["ep1_c17_06"] = "HALF-LIFE'\n== episode one==",
    ["gmhl2e2_outland_01"] = "HALF-LIFE'\n== episode two==",
    ["ep2_outland_01"] = "HALF-LIFE'\n== episode two=="
}

local CreditsEpisodes = {
    ["gmhl2e1_c17_03"] = "==episode one==",
    ["ep1_c17_06"] = "==episode one==",
    ["gmhl2e2_outland_12"] = "==episode two==",
    ["ep2_outland_12"] = "==episode two=="
}

local function DrawIntro()
    local curTime = CurTime()
    local alpha = 255

    if HL2SB_IntroFadeStart == 0 then return end
    if alpha == 0 then return end

    if curTime < HL2SB_IntroFadeEnd then
        alpha = Lerp((curTime - HL2SB_IntroFadeStart) / HL2SB_IntroFadeTime, 0, 255)
    elseif curTime > HL2SB_IntroFadeEnd + HL2SB_IntroFadeHold then
        alpha = Lerp((curTime - HL2SB_IntroFadeEnd - HL2SB_IntroFadeHold) / HL2SB_IntroFadeTime, 255, 0)
    end

	local hl2sb_markupfonts = markup.Parse("<font=HL2SBCreditsFont>HALF-LIFE'</font>\n<font=HL2SBGenericFont>   ==sandbox==</font>")
	local mapName = creditsMap[hl2credits_getmap]
    if mapName then
	    draw.DrawText(mapName, "HL2SBCreditsFont", ScrW() / 2, ScrH() / 2.08, Color(255, 255, 255, alpha), TEXT_ALIGN_CENTER)
    else
        hl2sb_markupfonts:Draw(ScrW() / 2, ScrH() / 2.08, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, alpha)
    end
end

local OutroIcon_Bloodycop = Material("hl2sbox/credits/bloodycop.jpg")
local OutroIcon_Alien31 = Material("hl2sbox/credits/alien31.jpg")
local function DrawOutro()
    local curTime = CurTime()
    local alpha = 255

    if HL2SB_OutroFadeStart == 0 then return end
    if alpha == 0 then return end

    if curTime < HL2SB_OutroFadeEnd then
        alpha = Lerp((curTime - HL2SB_OutroFadeStart) / HL2SB_OutroFadeTime * 10, 0, 255)
    elseif curTime > HL2SB_OutroFadeEnd + HL2SB_OutroFadeHold then
        alpha = Lerp((curTime - HL2SB_OutroFadeEnd - HL2SB_OutroFadeHold) / HL2SB_OutroFadeTime, 255, 0)
    end

    // Alien pfp
    surface.SetDrawColor(ColorAlpha(color_white, alpha))
    surface.SetMaterial(OutroIcon_Alien31)
    surface.DrawTexturedRect(ScrW() / 2 - 256, ScrH() / 2 - 64, 128, 128)

	// EON Text
    local markupBloodycop = markup.Parse("<font=HL2SBGenericFont>CODER\neon\n<color=255,0,0>bloodycop</color></font>")
    markupBloodycop:Draw(ScrW() / 2 + 190, ScrH() / 1.75, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, alpha, TEXT_ALIGN_CENTER)

	// GAME TITLE
    local parseText = "<font=HL2SBCreditsFontBig>HALF-LIFE'</font>\n<font=HL2SBGenericFontBig>   ==sandbox==</font>"
    if hl2credits_getmap == "gmhl2e1_c17_03" or "ep1_c17_06" then
        parseText = "<color=211, 92, 2><font=HL2SBCreditsFontBig>	 HALF-LIFE'</font></color>\n<font=HL2SBGenericFontBig>   ==episode one==</font>"
    elseif hl2credits_getmap == "gmhl2e2_outland_12" or "ep2_outland_12a" then
        parseText = "<color=211, 92, 2><font=HL2SBCreditsFontBig>	 HALF-LIFE'</font></color>\n<font=HL2SBGenericFontBig>   ==episode two==</font>"
    end

	local hl2sb_markupfonts = markup.Parse(parseText)
    hl2sb_markupfonts:Draw(ScrW() / 2, ScrH() / 5, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, alpha)

	// Thanks for playing and Description
	local hl2sb_creditdescription = markup.Parse("<color=211, 92, 2><font=HL2SBGenericFontMed>           THANK YOU FOR PLAYING</color>\n   hopefully you had fun playing it.\n         see you next time... for now...</font>")
    hl2sb_creditdescription:Draw(ScrW() / 2, ScrH() / 1.35, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, alpha)

	// Eon pfp
    surface.SetDrawColor(ColorAlpha(color_white, alpha))
    surface.SetMaterial(OutroIcon_Bloodycop)
    surface.DrawTexturedRect(ScrW() / 2 + 128, ScrH() / 2 - 64, 128, 128)

	// Alien Text
    local markupBloodycop = markup.Parse("<font=HL2SBGenericFont>CREATOR\nALIEN31</font>")
    markupBloodycop:Draw(ScrW() / 2 - 190, ScrH() / 1.75, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, alpha, TEXT_ALIGN_CENTER)
end

hook.Add("HUDPaint", "HL2EP1Sandbox", function()
    DrawIntro()
    DrawOutro()
end)