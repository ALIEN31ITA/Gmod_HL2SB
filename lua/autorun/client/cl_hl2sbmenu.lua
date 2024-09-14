hl2sb = hl2sb or {}

surface.CreateFont("hl2sbMenuFont1", {
    font = "Tahoma",
    size = 32,
    scanlines = 2,
	extended = true,
	antialias = true,
})

surface.CreateFont("hl2sbMenuFont2", {
    font = "Tahoma",
    size = 24,
    scanlines = 2,
	extended = true,
	antialias = true,
})

surface.CreateFont("hl2sbMenuFont3", {
    font = "HL2Generic",
    size = 48,
    scanlines = 2,
	extended = true,
	antialias = true,
})

local Mat = Material( "hud/hl2sb/logo.png" )

local color_base_bg = Color( 25, 40, 55 )
local color_base_outline = Color( 210, 90, 0 )

local color_label_settingsForMaps = Color( 210, 90, 0 )

local color_access_granted = Color( 0, 255, 0 )
local color_access_denied = Color( 255, 0, 0 )

hook.Add( "PopulateToolMenu", "hl2sb_General_Settings", function()
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
        hasAccessLabel:SetFont( "hl2sbMenuFont1" )
        hasAccessLabel:SetWrap(true)
        hasAccessLabel:SetAutoStretchVertical(true)

        local bHasAccess = false
        if ( game.SinglePlayer() or ply:IsAdmin() ) then
            bHasAccess = true
        end

        if ( !bHasAccess ) then
            hasAccessLabel:SetText( "Access Denied" )
            hasAccessLabel:SetTextColor( color_access_denied )
        end

        local settingsForMaps = vgui.Create( "DLabel", base )
        settingsForMaps:Dock( TOP )
        settingsForMaps:DockMargin(6, 0, 6, 0)
        settingsForMaps:SetText( "Generic settings for the maps" )
        settingsForMaps:SetTextColor( color_label_settingsForMaps )
        settingsForMaps:SetFont( "hl2sbMenuFont2" )
        settingsForMaps:SetWrap(true)
        settingsForMaps:SetAutoStretchVertical(true)

        local scrollPanel = vgui.Create( "DScrollPanel", base )
        scrollPanel:Dock( FILL )
        scrollPanel:DockMargin( 6, 0, 6, 0 )

        base:AddItem( logoPanel )
        base:AddItem( hasAccessLabel )
        base:AddItem( settingsForMaps )
        base:AddItem( scrollPanel )

        for k, v in pairs(hl2sb.cvars) do
            local cvar = v.value

            local title = vgui.Create( "DLabel", scrollPanel )
            title:Dock( TOP )
            title:SetText( v.menuText )
            title:SetFont( "hl2sbMenuFont1" )
            title:SetWrap(true)
            title:SetAutoStretchVertical(true)
            title:SetTextColor( color_white )
            title:SetTooltip( cvar:GetName() )

            local toggleButton = vgui.Create( "DButton", scrollPanel )
            toggleButton:Dock( TOP )
            toggleButton:SetText( cvar:GetInt() > 0 && "Enabled" || "Disabled" )
            toggleButton:SetTextColor(cvar:GetBool() && color_access_granted || color_access_denied)
            toggleButton:SetFont( "hl2sbMenuFont1" )
            toggleButton:SetTooltip( cvar:GetName() )
            toggleButton:SizeToContents()

            function toggleButton:DoClick()
                local newVal = !cvar:GetBool()
                local oldVal = cvar:GetBool()

                if ( newVal == oldVal ) then return end

                if ( bHasAccess ) then
                    self:SetTextColor( newVal and color_access_granted or color_label_settingsForMaps )
                    surface.PlaySound( "ui/buttonclickrelease.wav" )

                    net.Start( "hl2sb_MenuCommand" )
                        net.WriteString( cvar:GetName() )
                        net.WriteBool( newVal )
                    net.SendToServer()
                else
                    surface.PlaySound( "buttons/button10.wav" )
                end

                self:SetText( newVal && "Enabled" || "Disabled" )
                self:SetTextColor( newVal && color_access_granted || color_access_denied )
            end

            function toggleButton:Paint(width, height)
                surface.SetDrawColor( color_base_outline )
                surface.DrawOutlinedRect( 0, 0, width, height )
            end

            local label = vgui.Create( "DLabel", scrollPanel )
            label:Dock( TOP )
            label:SetText( v.menuDesc )
            label:SetTextColor( color_label_settingsForMaps )
            label:SetFont( "hl2sbMenuFont2" )
            label:SetWrap(true)
            label:SetAutoStretchVertical(true)

            base:AddItem( title )
            base:AddItem( toggleButton )
            base:AddItem( label )
        end
	end )
end )