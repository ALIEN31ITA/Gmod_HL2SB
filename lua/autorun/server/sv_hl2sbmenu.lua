util.AddNetworkString( "HL2SB_MenuCommand" )

local vars = {
    [ "hl2sb_trainstation_intro" ] = true,
    [ "hl2sb_npcgodmode" ] = true,
    [ "hl2sb_deathpit_triggers" ] = true,
    [ "hl2sb_levelswitch_triggers" ] = true,
    [ "hl2sb_antlionspawn_triggers" ] = true,
}

net.Receive( "HL2SB_MenuCommand", function( len, ply )
    if !IsValid( ply ) or ( !ply:IsAdmin() and !game.SinglePlayer() ) or len <= 0 then
        return
    end
    local str, bol = net.ReadString(), net.ReadBool()
    if !vars[ str ] then return end
    
    RunConsoleCommand( str, bol and 1 or 0 )
end )