hl2sb = hl2sb or {}

util.AddNetworkString( "hl2sb_MenuCommand" )

local vars = {
    [ "hl2sb_trainstation_intro" ] = true,
    [ "hl2sb_npcgodmode" ] = true,
    [ "hl2sb_deathpit_triggers" ] = true,
    [ "hl2sb_levelswitch_triggers" ] = true,
    [ "hl2sb_antlionspawn_triggers" ] = true,
    [ "hl2sb_ep1_core_damage" ] = true,
}

net.Receive( "hl2sb_MenuCommand", function( len, ply )
    if ( !IsValid(ply) ) then return end

    local bHasAccess = false
    if ( game.SinglePlayer() or ply:IsAdmin() ) then
        bHasAccess = true
    end

    local str, bol = net.ReadString(), net.ReadBool()
    if ( !str or bol == nil ) then return end

    local bVarExists = false

    for k, v in pairs(hl2sb.cvars) do
        if ( v.value:GetName() == str ) then
            bVarExists = true
            break
        end
    end

    if ( !bVarExists ) then return end

    RunConsoleCommand( str, bol and 1 or 0 )
end )