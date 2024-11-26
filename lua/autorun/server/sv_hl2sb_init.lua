hl2sb = hl2sb or {}

hook.Add("PostCleanupMap", "hl2sb_PostCleanupMap", function()
    if ( !hl2sb:IsMap() ) then return end

    for k, v in pairs(hl2sb.mapSettings) do
        if ( !v.EffectOnlyOnCleanup ) then continue end

        local cvar = v.value
        if ( !cvar ) then continue end

        if ( cvar:GetBool() ) then
            v.on()
        else
            v.off()
        end
    end
end)

hook.Add("InitPostEntity", "hl2sb_InitPostEntity", function()
    if ( !hl2sb:IsMap() ) then return end

    for k, v in pairs(hl2sb.mapSettings) do
        if ( v.EffectOnlyOnCleanup ) then continue end

        local cvar = v.value
        if ( !cvar ) then continue end

        if ( cvar:GetBool() ) then
            v.on()
        else
            v.off()
        end
    end
end)

hook.Add("PhysgunPickup", "hl2sb_PhysgunPickup", function(ply, entity)
    if ( !IsValid(ply) or !IsValid(entity) ) then return end
    if ( !hl2sb:IsMap() ) then return end

    if ( entity.bHL2SBNoPickup ) then return false end
end)