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
    { "[EP1] Disable Disintegration by the core", "Disable/Enable Core disintegrating.", "hl2sb_ep1_core_damage"}
}

local color_base_bg = Color( 25, 40, 55 )
local color_base_outline = Color( 210, 90, 0 )

local color_label_settingsForMaps = Color( 210, 90, 0 )

local color_access_granted = Color( 0, 255, 0 )
local color_access_denied = Color( 255, 0, 0 )

hook.Add( "PopulateToolMenu", "HL2SB_General_Settings", function()
	spawnmenu.AddToolMenuOption( "Utilities", "HL2 Sandbox", "Settings", "#Settings", "", "", function( base )
        local ply = LocalPlayer()
        if ( !IsValid( ply ) ) then return end

		base:ClearControls()
        base:SetLabel( "" )

        function base:Paint(w, h)
            surface.SetDrawColor( color_base_bg )
            surface.DrawRect( 0, 0, w, h )

            surface.SetDrawColor( color_base_outline )
            surface.DrawOutlinedRect( 0, 0, w, h )
        end

        local logoPanel = vgui.Create( "DPanel", base )
        logoPanel:Dock( TOP )
        logoPanel:SetTall(135)
        function logoPanel:Paint( w, h )
            surface.SetMaterial( Mat )
            surface.SetDrawColor( color_white )
            surface.DrawTexturedRect( 0, 0, w, h )
        end

        local hasAccessLabel = vgui.Create( "DLabel", base )
        hasAccessLabel:Dock( TOP )
        hasAccessLabel:DockMargin(6, 0, 6, 0)
        hasAccessLabel:SetText( "Access Granted" )
        hasAccessLabel:SetTextColor( color_access_granted )
        hasAccessLabel:SetFont( "HL2SBMenuFont1" )
        hasAccessLabel:SetWrap(true)
        hasAccessLabel:SetAutoStretchVertical(true)

        local bHasAccess = false
        if ( game.SinglePlayer() or ply:IsAdmin() ) then
            bHasAccess = true
        end

        if ( !bHasAccess ) then
            hasAccessLabel:SetText( "Access Denied" )
            hasAccessLabel:SetTextColor( color_access_denied )

            base:AddItem( logoPanel )
            base:AddItem( hasAccessLabel )

            return
        end

        local settingsForMaps = vgui.Create( "DLabel", base )
        settingsForMaps:Dock( TOP )
        settingsForMaps:DockMargin(6, 0, 6, 0)
        settingsForMaps:SetText( "Generic settings for the maps" )
        settingsForMaps:SetTextColor( color_label_settingsForMaps )
        settingsForMaps:SetFont( "HL2SBMenuFont2" )
        settingsForMaps:SetWrap(true)
        settingsForMaps:SetAutoStretchVertical(true)

        local scrollPanel = vgui.Create( "DScrollPanel", base )
        scrollPanel:Dock( FILL )
        scrollPanel:DockMargin(6, 0, 6, 0)

        base:AddItem( logoPanel )
        base:AddItem( hasAccessLabel )
        base:AddItem( settingsForMaps )

        for k, v in ipairs(vars) do
            local title = vgui.Create( "DLabel", scrollPanel )
            title:Dock( TOP )
            title:SetText( v[ 1 ] )
            title:SetFont( "HL2SBMenuFont1" )
            title:SetWrap(true)
            title:SetAutoStretchVertical(true)
            title:SetTextColor( color_label_settingsForMaps )
            title:SetTooltip( v[ 3 ] )

            local toggleButton = vgui.Create( "DButton", scrollPanel )
            toggleButton:Dock( TOP )
            toggleButton:SetText( GetConVar( v[ 3 ] ):GetInt() > 0 && "Enabled" || "Disabled" )
            toggleButton:SetTextColor(GetConVar( v[ 3 ] ):GetBool() && color_access_granted || color_access_denied)
            toggleButton:SetFont( "HL2SBMenuFont1" )
            toggleButton:SetTooltip( v[ 3 ] )
            toggleButton:SizeToContents()

            function toggleButton:Paint( w, h )
                surface.SetDrawColor( color_base_bg )
                surface.DrawRect( 0, 0, w, h )

                surface.SetDrawColor( color_base_outline )
                surface.DrawOutlinedRect( 0, 0, w, h )
            end

            function toggleButton:DoClick()
                local newVal = !GetConVar( v[ 3 ] ):GetBool()
                local oldVal = GetConVar( v[ 3 ] ):GetBool()

                if ( newVal == oldVal ) then return end

                if ( bHasAccess ) then
                    self:SetTextColor( val and color_access_granted or color_label_settingsForMaps )
                    surface.PlaySound( "ui/buttonclickrelease.wav" )

                    net.Start( "HL2SB_MenuCommand" )
                        net.WriteString( v[ 3 ] )
                        net.WriteBool( newVal )
                    net.SendToServer()
                else
                    surface.PlaySound( "buttons/button10.wav" )
                end

                self:SetText( newVal && "Enabled" || "Disabled" )
                self:SetTextColor( newVal && color_access_granted || color_access_denied )
            end

            local label = vgui.Create( "DLabel", scrollPanel )
            label:Dock( TOP )
            label:SetText( v[ 2 ] )
            label:SetTextColor( color_white )
            label:SetFont( "HL2SBMenuFont2" )
            label:SetWrap(true)
            label:SetAutoStretchVertical(true)

            base:AddItem( title )
            base:AddItem( toggleButton )
            base:AddItem( label )
        end

        base:AddItem( scrollPanel )
	end )
end )