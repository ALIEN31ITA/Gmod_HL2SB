local toggle = toggle or false
local hl2credits_getmap = game.GetMap()

concommand.Add("credits", function()
    toggle = !toggle
end)

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

concommand.Add("HL2SB_StartIntro", function()
    fadeStart = CurTime()
    fadeEnd = CurTime() + fadeTime
    fadeTime = fadeEnd - fadeStart
end)

hook.Add("HUDPaint", "HL2EP1SandboxCredits", function()
    local curTime = CurTime()
    local alpha = 255

    if curTime < fadeEnd then
        alpha = Lerp((curTime - fadeStart) / fadeTime, 0, 255)
    elseif curTime > fadeEnd + fadeHold then
        alpha = Lerp((curTime - fadeEnd - fadeHold) / fadeTime, 255, 0)
    end

	if hl2credits_getmap == "gmhl2e1_citadel_00" or hl2credits_getmap == "ep1_citadel_00"
    draw.DrawText("HALF-LIFE'\n== episode one==", "HL2SBEP1CreditsFont", ScrW() / 2, ScrH() / 2, Color(255, 255, 255, alpha), TEXT_ALIGN_CENTER)
	if hl2credits_getmap == "gmhl2e2_outland_01" or hl2credits_getmap == "ep2_outland_01"
    draw.DrawText("HALF-LIFE'\n== episode two==", "HL2SBEP1CreditsFont", ScrW() / 2, ScrH() / 2, Color(255, 255, 255, alpha), TEXT_ALIGN_CENTER)
end)