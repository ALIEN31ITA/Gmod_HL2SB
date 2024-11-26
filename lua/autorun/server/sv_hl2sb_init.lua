hl2sb = hl2sb or {}

// PostCleanupMap | cleanupEffects
hook.Add("PostCleanupMap", "hl2sb_PostCleanupMap", function()
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