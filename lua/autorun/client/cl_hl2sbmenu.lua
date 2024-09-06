surface.CreateFont("HL2SBMenuFont1", {
    font = "Tahoma",
    size = 32,
    scanlines = 2,
	extended = true,
	antialias = true,
} )
surface.CreateFont("HL2SBMenuFont2", {
    font = "Tahoma",
    size = 24,
    scanlines = 2,
	extended = true,
	antialias = true,
} )
surface.CreateFont("HL2SBMenuFont3", {
    font = "HL2Generic",
    size = 48,
    scanlines = 2,
	extended = true,
	antialias = true,
} )

local Mat = Material( "hud/hl2sb/logo.png" )

local vars = {
    { "[TRANSTATION-EP1] Disable intros", "You don't need to hear all of this, you are a professional", "hl2sb_trainstation_intro" },
    { "Story NPC's are Immortal", "Disable/Enable Godmode for Story NPC's", "hl2sb_npcgodmode" },
    { "Death barriers", "Disable/Enable death barriers, pits, leeches", "hl2sb_deathpit_triggers" },
    { "Loading Zones", "Disable/Enable level switch triggers", "hl2sb_levelswitch_triggers" },
    { "Antlion spawns", "Disable/Enable antlions burrowing from the ground", "hl2sb_antlionspawn_triggers" },
}

hook.Add( "PopulateToolMenu", "HL2SB_General_Settings", function()
	spawnmenu.AddToolMenuOption( "Utilities", "HL2 Sandbox", "Settings", "#Settings", "", "", function( base )
        local ply = LocalPlayer()
		base:ClearControls()
        base:SetLabel( "" )

        function base:Paint( w, h )
            draw.RoundedBox( 0, 0, 0, w, h, Color( 27, 40, 56 ) )
            surface.SetDrawColor( 211, 92, 2 )
            surface.DrawOutlinedRect( 0, 0, w, h, 2 )
        end

        local logo = vgui.Create( "DPanel", base )
        logo:Dock( TOP )
        logo:SetSize( 0, 134 )
        function logo:Paint( w, h )
            surface.SetMaterial( Mat )
            surface.SetDrawColor( color_white )
            surface.DrawTexturedRectRotated( w/2, 134/2, 267, 134, 0 )
        end
        base:AddItem( logo )

        local help = vgui.Create( "DPanel", base )
        help:Dock( TOP )
        help:SetSize( 0, 32 )
        function help:Paint( w, h )
            draw.RoundedBox( 0, 0, h-2, w, 2, Color( 211, 92, 2 ) )
        end

        local genericSettings = vgui.Create( "DLabel", help )
        genericSettings:SetText( "Generic settings for the maps" )
        genericSettings:SetTextColor( Color( 211, 92, 2  ) )
        genericSettings:Dock( TOP )
        genericSettings:SetFont( "HL2SBMenuFont1" )
        genericSettings:SetWrap(true)
        genericSettings:SetAutoStretchVertical(true)


        base:AddItem( help )

        local permit = vgui.Create( "DPanel", base )
        permit:Dock( TOP )
        permit:SetSize( 0, 32 )
        function permit:Paint( w, h )
            local acc = ( IsValid( ply ) and ( ply:IsAdmin() or game.SinglePlayer() ) )
            draw.SimpleText( string.upper( acc and "Access Granted" or "Access Denied" ), "HL2SBMenuFont2", w/2, h/2 -4, acc and Color( 0, 255, 0 ) or Color( 255, 0, 0 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end
        base:AddItem( permit )

        for k, v in pairs( vars ) do
            local ckbx = vgui.Create( "DPanel", base )
            ckbx:SetSize( 0, 52 )
            ckbx:Dock( TOP )
            ckbx:DockMargin( 16, 16, 16, 16 )
            ckbx.Paint = nil

            local cnt = vgui.Create( "DCheckBoxLabel", ckbx )
            cnt:SetText( v[ 1 ] )
            cnt:Dock( TOP )
            cnt:SetFont( "HL2SBMenuFont1" )
            cnt.OldValue = GetConVar( v[ 3 ] ):GetInt() > 0
            cnt:SetValue( cnt.OldValue )
            cnt:SetTextColor( cnt.OldValue and Color( 0, 255, 0 ) or Color( 211, 92, 2 ) )
            cnt:SetTooltip( v[ 3 ] )
            cnt:SetWrap(true)

            if ( cnt.SetAutoStretchVertical ) then
                cnt:SetAutoStretchVertical(true)
            end

            function cnt:OnChange( val )
                if val == cnt.OldValue then return end
                local acc = ( IsValid( ply ) and ( ply:IsAdmin() or game.SinglePlayer() ) )

                if !acc then
                    cnt:SetValue( cnt.OldValue )
                    surface.PlaySound( "buttons/button10.wav" )
                else
                    cnt.OldValue = val
                    cnt:SetTextColor( val and Color( 0, 255, 0 ) or Color( 211, 92, 2 ) )
                    surface.PlaySound( "ui/buttonclickrelease.wav" )

                    net.Start( "HL2SB_MenuCommand" )
                    net.WriteString( v[ 3 ] )
                    net.WriteBool( val )
                    net.SendToServer()
                end
            end

            local lab = vgui.Create( "DLabel", ckbx )
            lab:SetText( "    "..v[ 2 ] )
            lab:SetTextColor( Color( 0, 161, 255 ) )
            lab:Dock( TOP )
            lab:SetPos( 24, 40 )
            lab:SetFont( "TargetID" )
            lab:SetWrap(true)
            lab:SetAutoStretchVertical(true)

            base:AddItem( ckbx )
        end

        local empty = vgui.Create( "DPanel", base )
        empty:SetSize( 0, 32 )
        empty.Paint = nil
        base:AddItem( empty )
	end )
end )