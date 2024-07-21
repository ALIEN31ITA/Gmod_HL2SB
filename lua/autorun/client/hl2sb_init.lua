surface.CreateFont("HL2SBEP1CreditsFont", {
    font = "HL2EP1",
    size = 50,
    weight = 500,
    antialias = true,
    shadow = false
})

local fadeStart = 0
local fadeEnd = 5
local fadeHold = 3
local fadeTime = fadeEnd - fadeStart

concommand.Add("hl2sb_ep1_startintro", function()
    fadeStart = CurTime()
    fadeEnd = CurTime() + fadeTime
    fadeTime = fadeEnd - fadeStart
end)

concommand.Add("hl2sb_ep1_stopintro", function()
    fadeStart = 0
    fadeEnd = 5
    fadeTime = fadeEnd - fadeStart
end)

hook.Add("HUDPaint", "Credits", function()
    local curTime = CurTime()
    local alpha = 255

    if curTime < fadeEnd then
        alpha = Lerp((curTime - fadeStart) / fadeTime, 0, 255)
    elseif curTime > fadeEnd + fadeHold then
        alpha = Lerp((curTime - fadeEnd - fadeHold) / fadeTime, 255, 0)
    end

    if ( alpha > 0 ) then
        draw.DrawText("HALF-LIFE2\n== episode one==", "HL2SBEP1CreditsFont", ScrW() / 2, ScrH() / 2, Color(255, 255, 255, alpha), TEXT_ALIGN_CENTER)
    end
end)