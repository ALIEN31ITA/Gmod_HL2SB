if ( SERVER ) then
    hook.Add("CreateEntityRagdoll", "HL2VANILLA_Ragdoll", function( ent, ragdoll )
        if ( !IsValid(ent) or !IsValid(ragdoll) ) then return end

        local mats = ent:GetMaterials()
        for k, mat in ipairs(mats) do
            ragdoll:SetSubMaterial(k - 1, ent:GetSubMaterial(k - 1))
        end
    end)
else
    hook.Add("CreateClientsideRagdoll", "HL2VANILLA_RagdollClientside", function( ent, ragdoll )
        if ( !IsValid(ent) or !IsValid(ragdoll) ) then return end

        local mats = ent:GetMaterials()
        for k, mat in ipairs(mats) do
            ragdoll:SetSubMaterial(k - 1, ent:GetSubMaterial(k - 1))
        end
    end)
end