hl2sb = hl2sb or {}

CreateConVar("hl2sb_showsettings", "0", {FCVAR_REPLICATED}, "Show the current settings.")

do
    surface.CreateFont("hl2sbCreditsFontSmall", {
        font = "HL2Generic",
        size = 24,
        weight = 500,
        antialias = true,
        shadow = false
    })

    surface.CreateFont("hl2sbCreditsFont", {
        font = "HL2Credits",
        size = 35,
        weight = 500,
        antialias = true,
        shadow = false
    })

    surface.CreateFont("hl2sbCreditsFontBig", {
        font = "HL2Credits",
        size = 95,
        weight = 500,
        antialias = true,
        shadow = false
    })

    surface.CreateFont("hl2sbGenericFontSmall", {
        font = "HL2Generic",
        size = 24,
        weight = 500,
        antialias = true,
        shadow = false
    })

    surface.CreateFont("hl2sbGenericFont", {
        font = "HL2Generic",
        size = 35,
        weight = 500,
        antialias = true,
        shadow = false
    })

    surface.CreateFont("hl2sbGenericFontMed", {
        font = "HL2Generic",
        size = 50,
        scanlines = 2,
        weight = 500,
        antialias = true,
        shadow = false
    })

    surface.CreateFont("hl2sbGenericFontBig", {
        font = "HL2Generic",
        size = 95,
        weight = 500,
        antialias = true,
        shadow = false
    })
end

local hl2sb_IntroFadeStart = 0
local hl2sb_IntroFadeEnd = 5
local hl2sb_IntroFadeHold = 3
local hl2sb_IntroFadeTime = hl2sb_IntroFadeEnd - hl2sb_IntroFadeStart

local hl2sb_OutroFadeStart = 0
local hl2sb_OutroFadeEnd = 5
local hl2sb_OutroFadeHold = 3
local hl2sb_OutroFadeTime = hl2sb_OutroFadeEnd - hl2sb_OutroFadeStart

do
    concommand.Add("hl2sb_StartIntro", function()
        hl2sb_IntroFadeStart = CurTime()
        hl2sb_IntroFadeEnd = CurTime() + hl2sb_IntroFadeTime
        hl2sb_IntroFadeTime = hl2sb_IntroFadeEnd - hl2sb_IntroFadeStart
    end)

    concommand.Add("hl2sb_StopIntro", function()
        hl2sb_IntroFadeStart = 0
        hl2sb_IntroFadeEnd = 5
        hl2sb_IntroFadeTime = hl2sb_IntroFadeEnd - hl2sb_IntroFadeStart
    end)

    local hl2sb_CreditSound = Sound("hl2sb/ui/checkpoint_reached.wav")
    concommand.Add("hl2sb_DisplayCredits", function()
        LocalPlayer():EmitSound(hl2sb_CreditSound)
        hl2sb_OutroFadeStart = CurTime()
        hl2sb_OutroFadeEnd = CurTime() + hl2sb_OutroFadeTime
        hl2sb_OutroFadeTime = hl2sb_OutroFadeEnd - hl2sb_OutroFadeStart
    end)

    concommand.Add("hl2sb_StopCredits", function()
        hl2sb_OutroFadeStart = 0
        hl2sb_OutroFadeEnd = 5
        hl2sb_OutroFadeTime = hl2sb_OutroFadeEnd - hl2sb_OutroFadeStart
    end)
end

local function DrawIntro()
    local curTime = CurTime()
    local alpha = 255

    if ( hl2sb_IntroFadeStart == 0 ) then return end
    if ( alpha == 0 ) then return end

    if curTime < hl2sb_IntroFadeEnd then
        alpha = Lerp((curTime - hl2sb_IntroFadeStart) / hl2sb_IntroFadeTime, 0, 255)
    elseif curTime > hl2sb_IntroFadeEnd + hl2sb_IntroFadeHold then
        alpha = Lerp((curTime - hl2sb_IntroFadeEnd - hl2sb_IntroFadeHold) / hl2sb_IntroFadeTime, 255, 0)
    end

	local hl2sb_markupfonts = markup.Parse("<font=hl2sbCreditsFont>HALF-LIFE'</font>\n<font=hl2sbGenericFont>   ==sandbox==</font>")
	local mapName = creditsMap[hl2credits_getmap]
    if ( mapName ) then
	    draw.DrawText(mapName, "hl2sbCreditsFont", ScrW() / 2, ScrH() / 2.08, ColorAlpha(color_white, alpha), TEXT_ALIGN_CENTER)
    else
        hl2sb_markupfonts:Draw(ScrW() / 2, ScrH() / 2.08, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, alpha)
    end
end

hl2sb.OutroIcons = {
    Material("hl2sbox/credits/alien31.jpg"),
    Material("hl2sbox/credits/bloodycop.jpg"),
}

local function DrawOutro()
    local curTime = CurTime()
    local alpha = 255

    if ( hl2sb_OutroFadeStart == 0 ) then return end
    if ( alpha == 0 ) then return end

    if curTime < hl2sb_OutroFadeEnd then
        alpha = Lerp((curTime - hl2sb_OutroFadeStart) / hl2sb_OutroFadeTime * 10, 0, 255)
    elseif curTime > hl2sb_OutroFadeEnd + hl2sb_OutroFadeHold then
        alpha = Lerp((curTime - hl2sb_OutroFadeEnd - hl2sb_OutroFadeHold) / hl2sb_OutroFadeTime, 255, 0)
    end

    // Alien pfp
    surface.SetDrawColor(ColorAlpha(color_white, alpha))
    surface.SetMaterial(hl2sb.OutroIcons[1])
    surface.DrawTexturedRect(ScrW() / 2 - 256, ScrH() / 2 - 64, 128, 128)

    // Alien Text
    local markupAlien = markup.Parse("<font=hl2sbGenericFont>CREATOR\nALIEN31</font>")
    markupAlien:Draw(ScrW() / 2 - 190, ScrH() / 1.75, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, alpha, TEXT_ALIGN_CENTER)

    // Eon pfp
    surface.SetDrawColor(ColorAlpha(color_white, alpha))
    surface.SetMaterial(hl2sb.OutroIcons[2])
    surface.DrawTexturedRect(ScrW() / 2 + 128, ScrH() / 2 - 64, 128, 128)

    // EON Text
    local markupBloodycop = markup.Parse("<font=hl2sbGenericFont>CODER\neon\n<color=255,0,0>bloodycop</color></font>")
    markupBloodycop:Draw(ScrW() / 2 + 190, ScrH() / 1.75, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, alpha, TEXT_ALIGN_CENTER)

	// GAME TITLE
	local hl2sb_markupfonts = markup.Parse("<font=hl2sbCreditsFontBig>HALF-LIFE'</font>\n<font=hl2sbGenericFontBig>   ==sandbox==</font>")
    if hl2credits_getmap == "gmhl2e1_c17_03" or "ep1_c17_06" then
        hl2sb_markupfonts = markup.Parse("<color=211, 92, 2><font=hl2sbCreditsFontBig>	 HALF-LIFE'</font></color>\n<font=hl2sbGenericFontBig>   ==episode one==</font>")
    elseif hl2credits_getmap == "gmhl2e2_outland_12" or "ep2_outland_12a" then
        hl2sb_markupfonts = markup.Parse("<color=211, 92, 2><font=hl2sbCreditsFontBig>	 HALF-LIFE'</font></color>\n<font=hl2sbGenericFontBig>   ==episode two==</font>")
    end

    hl2sb_markupfonts:Draw(ScrW() / 2, ScrH() / 5, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, alpha)

	// Thanks for playing and Description
	local hl2sb_creditdescription = markup.Parse("<color=211, 92, 2><font=hl2sbGenericFontMed>           THANK YOU FOR PLAYING</color>\n   hopefully you had fun playing it.\n         see you next time... for now...</font>")
    hl2sb_creditdescription:Draw(ScrW() / 2, ScrH() / 1.35, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, alpha)
end

local function DrawSettings()
    local convar = GetConVar("hl2sb_showsettings")
    if ( !convar ) then return end

    if ( !convar:GetBool() ) then return end

    local ply = LocalPlayer()
    if ( !IsValid(ply) ) then return end

    local settings = hl2sb.cvars
    if ( !settings ) then return end

    draw.SimpleTextOutlined("half_life 2 Sbox Settings", "hl2sbGenericFont", 10, 10, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black)

    local yOffset = 0
    for k, v in SortedPairs(settings) do
        local value = v.value:GetBool()
        local name = v.menuText
        local desc = v.menuDesc

        name = name:gsub("Toggle", "")
        draw.SimpleText(name .. " - " .. ( value && "Enabled" || "Disabled" ), "BudgetLabel", 10, 60 + yOffset, color_white)

        yOffset = yOffset + 15
    end
end

hook.Add("HUDPaint", "HL2EP1Sandbox", function()
    DrawIntro()
    DrawOutro()
    DrawSettings()
end)

do
    net.Receive( "hl2sb_MenuPlaySound" , function()
        local ply = LocalPlayer()
        if ( !IsValid(ply) ) then return end

        local ostPath = net.ReadString()
        if ( !ostPath ) then return end

        timer.Simple(0, function()
            RunConsoleCommand("play", ostPath)
        end)
    end )

    net.Receive( "hl2sb_MenuStopSound" , function()
        local ply = LocalPlayer()
        if ( !IsValid(ply) ) then return end

        for k, v in ipairs(hl2sb.soundtracks) do
            local ostPath = v[3]
            if ( file.Exists( "sound/" .. ostPath, "GAME" ) ) then
                ply:StopSound( ostPath )
            end
        end
    end )
end