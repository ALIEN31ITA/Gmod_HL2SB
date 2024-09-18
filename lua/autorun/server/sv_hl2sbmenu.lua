hl2sb = hl2sb or {}

util.AddNetworkString( "hl2sb_MenuCommand" )
util.AddNetworkString( "hl2sb_MenuPlaySound" )
util.AddNetworkString( "hl2sb_MenuStopSound" )

net.Receive( "hl2sb_MenuCommand", function( len, ply )
    if ( !IsValid(ply) ) then return end

    local bHasAccess = false
    if ( game.SinglePlayer() or ply:IsAdmin() ) then
        bHasAccess = true
    end

    local str, value = net.ReadString(), net.ReadType()
    if ( !str ) then return end

    local bVarExists = false

    for k, v in pairs(hl2sb.cvars) do
        if ( v.value:GetName() == str ) then
            bVarExists = true
            break
        end
    end

    if ( !bVarExists ) then return end

    if isbool(value) then
        value = value && 1 || 0
    end

    RunConsoleCommand( str, value )
end )

net.Receive( "hl2sb_MenuPlaySound", function( len, ply )
    if ( !IsValid(ply) ) then return end

    local bHasAccess = false
    if ( game.SinglePlayer() or ply:IsAdmin() ) then
        bHasAccess = true
    end

    local str = net.ReadString()
    if ( !str ) then return end

    if ( !bHasAccess ) then return end

    net.Start("hl2sb_MenuPlaySound")
        net.WriteString( str )
    net.Broadcast()
end )

net.Receive( "hl2sb_MenuStopSound", function( len, ply )
    if ( !IsValid(ply) ) then return end

    local bHasAccess = false
    if ( game.SinglePlayer() or ply:IsAdmin() ) then
        bHasAccess = true
    end

    if ( !bHasAccess ) then return end

    net.Start("hl2sb_MenuStopSound")
    net.Broadcast()
end )