local hl2credits_getmap = game.GetMap()

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

	local mapName = creditsMap[hl2credits_getmap] or "HALF-LIFE'\n== sandbox=="
    draw.DrawText(mapName, "HL2SBEP1CreditsFont", ScrW() / 2, ScrH() / 2, Color(255, 255, 255, alpha), TEXT_ALIGN_CENTER)
end)