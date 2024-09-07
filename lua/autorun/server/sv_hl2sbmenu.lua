util.AddNetworkString( "HL2SB_MenuCommand" )

local vars = {
    [ "hl2sb_trainstation_intro" ] = true,
    [ "hl2sb_npcgodmode" ] = true,
    [ "hl2sb_deathpit_triggers" ] = true,
    [ "hl2sb_levelswitch_triggers" ] = true,
    [ "hl2sb_antlionspawn_triggers" ] = true,
}

net.Receive( "HL2SB_MenuCommand", function( len, ply )
    if ( !IsValid(ply) ) then return end

    local bHasAccess = false
    if ( game.SinglePlayer() or ply:IsAdmin() ) then
        bHasAccess = true
    end

    local str, bol = net.ReadString(), net.ReadBool()
    if ( !str or bol == nil ) then return end
    if ( !vars[ str ] ) then return end

    RunConsoleCommand( str, bol and 1 or 0 )
end )