util.AddNetworkString( "hl2sb_MenuCommand" )
util.AddNetworkString( "hl2sb_MenuPlaySound" )
util.AddNetworkString( "hl2sb_MenuStopSound" )
util.AddNetworkString( "hl2sb_MenuRemoveAllNPCs" )

net.Receive( "hl2sb_MenuCommand", function( len, ply )
    if ( !IsValid(ply) ) then return end

    local bHasAccess = false
    if ( game.SinglePlayer() or ply:IsAdmin() ) then
        bHasAccess = true
    end

    if ( !bHasAccess ) then return end

    local str, value = net.ReadString(), net.ReadType()
    if ( !str ) then return end

    local settingData = nil
    for k, v in pairs(hl2sb.cvars) do
        if ( v.value:GetName() == str ) then
            settingData = v
            break
        end
    end

    if ( !settingData ) then return end

    if isbool(value) then
        value = value && 1 || 0
    end

    if ( settingData.value ) then
        if ( !settingData.value:GetBool() ) then
            if ( settingData.on) then settingData.on() end
        else
            if ( settingData.off ) then settingData.off() end
        end
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