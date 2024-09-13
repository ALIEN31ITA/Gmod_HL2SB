hl2sb = hl2sb or {}

if ( SERVER ) then
    hook.Add("CreateEntityRagdoll", "hl2sb_CreateEntityRagdoll", function( ent, ragdoll )
        if ( !IsValid(ent) or !IsValid(ragdoll) ) then return end

        local mats = ent:GetMaterials()
        for k, mat in ipairs(mats) do
            ragdoll:SetSubMaterial(k - 1, ent:GetSubMaterial(k - 1))
        end
    end)
else
    hook.Add("CreateClientsideRagdoll", "hl2sb_CreateClientsideRagdoll", function( ent, ragdoll )
        if ( !IsValid(ent) or !IsValid(ragdoll) ) then return end

        local mats = ent:GetMaterials()
        for k, mat in ipairs(mats) do
            ragdoll:SetSubMaterial(k - 1, ent:GetSubMaterial(k - 1))
        end
    end)
end