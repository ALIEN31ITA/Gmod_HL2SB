hl2sb = hl2sb or {}
hl2sb.logo = Material( "hud/hl2sb/logo.png" )

local hl2sb_getmap = game.GetMap()

do
    surface.CreateFont("hl2sbMenuFontVerySmall", {
        font = "Tahoma",
        size = 21,
        scanlines = 2,
        extended = true,
        antialias = true,
    })

    surface.CreateFont("hl2sbMenuFontSmall", {
        font = "Tahoma",
        size = 23,
        scanlines = 2,
        extended = true,
        antialias = true,
    })

    surface.CreateFont("hl2sbMenuFontMedium", {
        font = "Tahoma",
        size = 32,
        scanlines = 2,
        extended = true,
        antialias = true,
    })

    surface.CreateFont("hl2sbMenuFontLarge", {
        font = "HL2Generic",
        size = 48,
        scanlines = 2,
        extended = true,
        antialias = true,
    })
end

local color_base_bg = Color( 25, 40, 55 )
local color_base_outline = Color( 210, 90, 0 )

local color_label_settingsForMaps = Color( 210, 90, 0 )

local color_access_granted = Color( 0, 255, 0 )
local color_access_denied = Color( 255, 0, 0 )

hook.Add( "AddToolMenuCategories", "hl2sb_AddToolMenuCategories", function()
	spawnmenu.AddToolCategory( "Utilities", "HL2 Sandbox", "#HL2: Sandbox" )
end )

hook.Add( "PopulateToolMenu", "hl2sb_PopulateToolMenu", function()
    hl2sb.logo = hl2sb.logo or Material( "hud/hl2sb/logo.png" )

    local bHasAccess = false

    spawnmenu.AddToolMenuOption( "Utilities", "HL2 Sandbox", "Current Map", "#Current Map", "", "", function(panel)
        local ply = LocalPlayer()
        if ( !IsValid( ply ) ) then return end

        if ( game.SinglePlayer() or ply:IsAdmin() ) then
            bHasAccess = true
        end

		panel:ClearControls()
		panel:Help(hl2sb.mapChapter .. hl2sb.mapTitle)

		if hl2sb_getmap == "gmhl2_coast_01" or hl2sb_getmap == "gmhl2_coast_bridge" then
			panel:Help("One time only settings")

			local HW17_B_ClearCars = panel:Button("Clear Wagons")
			function HW17_B_ClearCars:DoClick()
				net.Start("request_hl2sb_HW17_Bridge_ClearCars")
				net.SendToServer()
			end
        elseif hl2sb_getmap == "gmhl2_trainstation_02" then
            panel:Help("One time only settings")

            local PI_TS2_ClearProps = panel:Button("Clear Furniture Blocks")
            function PI_TS2_ClearProps:DoClick()
                net.Start("request_hl2sb_TRAINSTATION_02_ClearProps")
                net.SendToServer()
            end
        elseif hl2sb_getmap == "gmhl2_canals_01" then
			local CAN01_Train_1 = panel:Button("Call Razor Train")
			function CAN01_Train_1:DoClick()
				net.Start("request_hl2sb_CAN01_TrainR")
				net.SendToServer()
			end

			local CAN01_Train_2 = panel:Button("Call Civilian Train")
			panel:Help("The civilian train must stop first!")

			function CAN01_Train_2:DoClick()
				net.Start("request_hl2sb_CAN01_TrainN")
				net.SendToServer()
			end

			local CAN01_Train_1_Leave = panel:Button("Scram Civilian Train")
			function CAN01_Train_1_Leave:DoClick()
				net.Start("request_hl2sb_CAN01_TrainNGO")
				net.SendToServer()
			end
        elseif hl2sb_getmap == "gmhl2_ravenholm" or hl2sb_getmap == "gmhl2_c17_part1" then
			panel:Help("One time only settings")

			local RAVEN_KillClouds = panel:Button("Remove Clouds [FPS]")
			function RAVEN_KillClouds:DoClick()
				net.Start("request_hl2sb_RAVEN_KillClouds")
				net.SendToServer()
			end
        elseif hl2sb_getmap == "gmhl2_coast_bridge" then
			local HW17_B_Train = panel:Button("Call Train")
			function HW17_B_Train:DoClick()
				net.Start("request_hl2sb_HW17_Bridge_Train")
				net.SendToServer()
			end
        elseif hl2sb_getmap == "gmhl2_coast_09" then
			panel:Help("One time only settings")

			local HW17_C09_ClearCars = panel:Button("Clear Road")
			function HW17_C09_ClearCars:DoClick()
				net.Start("request_hl2sb_SANDTRAP_COAST_09_ClearCars")
				net.SendToServer()
			end
		end
	end )

	spawnmenu.AddToolMenuOption( "Utilities", "HL2 Sandbox", "Settings", "#Settings", "", "", function( base )
        local ply = LocalPlayer()
        if ( !IsValid( ply ) ) then return end

        if ( game.SinglePlayer() or ply:IsAdmin() ) then
            bHasAccess = true
        end

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
            surface.SetMaterial( hl2sb.logo )
            surface.SetDrawColor( color_white )
            surface.DrawTexturedRect( 0, 0, w, h )
        end

        local hasAccessLabel = vgui.Create( "DLabel", base )
        hasAccessLabel:Dock( TOP )
        hasAccessLabel:DockMargin(6, 0, 6, 0)
        hasAccessLabel:SetText( "Access Granted" )
        hasAccessLabel:SetTextColor( color_access_granted )
        hasAccessLabel:SetFont( "hl2sbMenuFontSmall" )
        hasAccessLabel:SetWrap(true)
        hasAccessLabel:SetAutoStretchVertical(true)

        if ( !bHasAccess ) then
            hasAccessLabel:SetText( "Access Denied" )
            hasAccessLabel:SetTextColor( color_access_denied )
        end

        local settingsForMaps = vgui.Create( "DLabel", base )
        settingsForMaps:Dock( TOP )
        settingsForMaps:DockMargin(6, 0, 6, 0)
        settingsForMaps:SetText( "Generic settings for the maps" )
        settingsForMaps:SetTextColor( color_label_settingsForMaps )
        settingsForMaps:SetFont( "hl2sbMenuFontMedium" )
        settingsForMaps:SetWrap(true)
        settingsForMaps:SetAutoStretchVertical(true)

        local scrollPanel = vgui.Create( "DScrollPanel", base )
        scrollPanel:Dock( FILL )
        scrollPanel:DockMargin( 6, 0, 6, 0 )

        base:AddItem( logoPanel )
        base:AddItem( hasAccessLabel )
        base:AddItem( settingsForMaps )
        base:AddItem( scrollPanel )

        local removeAllNPCs = vgui.Create( "DButton", scrollPanel )
        removeAllNPCs:Dock( TOP )
        removeAllNPCs:SetText( "Remove All NPCs" )
        removeAllNPCs:SetTextColor( color_access_granted )
        removeAllNPCs:SetFont( "hl2sbMenuFontSmall" )
        removeAllNPCs:SizeToContents()

        function removeAllNPCs:DoClick()
            if ( !bHasAccess ) then return end

            net.Start( "request_hl2sb_RemoveNPCs" )
            net.SendToServer()
        end

        removeAllNPCs.Paint = function(this, width, height)
            if ( !bHasAccess ) then
                this:SetTextColor( color_access_denied )
            else
                this:SetTextColor( color_access_granted )
            end

            surface.SetDrawColor( color_base_outline )
            surface.DrawOutlinedRect( 0, 0, width, height )
        end

        base:AddItem( removeAllNPCs )

        for k, v in pairs(hl2sb.cvars) do
            local cvar = v.value

            v.type = v.type or "checkbox"

            local title = vgui.Create( "DLabel", scrollPanel )
            title:Dock( TOP )
            title:SetText( v.menuText )
            title:SetFont( "hl2sbMenuFontMedium" )
            title:SetWrap( true )
            title:SetAutoStretchVertical( true )
            title:SetTextColor( color_white )
            title:SetTooltip( cvar:GetName() )

            base:AddItem( title )

            if v.type == "checkbox" then
                local toggleButton = vgui.Create( "DButton", scrollPanel )
                toggleButton:Dock( TOP )
                toggleButton:SetText( cvar:GetInt() > 0 && "Enabled" || "Disabled" )
                toggleButton:SetTextColor(hl2sb:IsEnabled(k) && color_access_granted || color_access_denied)
                toggleButton:SetFont( "hl2sbMenuFontSmall" )
                toggleButton:SetTooltip( cvar:GetName() )
                toggleButton:SizeToContents()

                function toggleButton:DoClick()
                    local newVal = !hl2sb:IsEnabled(k)
                    local oldVal = hl2sb:IsEnabled(k)

                    if ( newVal == oldVal ) then return end

                    if ( bHasAccess ) then
                        self:SetTextColor( newVal and color_access_granted or color_label_settingsForMaps )
                        surface.PlaySound( "ui/buttonclickrelease.wav" )

                        net.Start( "hl2sb_MenuCommand" )
                            net.WriteString( cvar:GetName() )
                            net.WriteType(newVal)
                        net.SendToServer()
                    else
                        surface.PlaySound( "buttons/button10.wav" )
                    end

                    self:SetText( newVal && "Enabled" || "Disabled" )
                    self:SetTextColor( newVal && color_access_granted || color_access_denied )
                end

                function toggleButton:Paint( width, height )
                    surface.SetDrawColor( color_base_outline )
                    surface.DrawOutlinedRect( 0, 0, width, height )
                end

                base:AddItem( toggleButton )
            elseif v.type == "slider" then
                local slider = vgui.Create( "DNumSlider", scrollPanel )
                slider:Dock( TOP )
                slider:SetText( "" )
                slider:SetMin( v.min or 0 )
                slider:SetMax( v.max or 1 )
                slider:SetDecimals( v.decimals or 0 )
                slider:SetValue( cvar:GetInt() )
                slider:SetTooltip( cvar:GetName() )

                function slider:OnValueChanged( val )
                    if ( bHasAccess ) then
                        surface.PlaySound( "ui/buttonclickrelease.wav" )

                        net.Start( "hl2sb_MenuCommand" )
                            net.WriteString( cvar:GetName() )
                            net.WriteType(val)
                        net.SendToServer()
                    else
                        surface.PlaySound( "buttons/button10.wav" )
                    end
                end

                base:AddItem( slider )
            end

            local label = vgui.Create( "DLabel", scrollPanel )
            label:Dock( TOP )
            label:SetText( v.menuDesc )
            label:SetTextColor( color_label_settingsForMaps )
            label:SetFont( "hl2sbMenuFontSmall" )
            label:SetWrap( true )
            label:SetAutoStretchVertical( true )

            base:AddItem( label )
        end
	end )

    spawnmenu.AddToolMenuOption( "Utilities", "HL2 Sandbox", "Soundtracks", "#Soundtracks", "", "", function( base )
        local ply = LocalPlayer()
        if ( !IsValid( ply ) ) then return end

        if ( game.SinglePlayer() or ply:IsAdmin() ) then
            bHasAccess = true
        end

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
            surface.SetMaterial( hl2sb.logo )
            surface.SetDrawColor( color_white )
            surface.DrawTexturedRect( 0, 0, w, h )
        end

        local musicLabel = vgui.Create( "DLabel", base )
        musicLabel:Dock( TOP )
        musicLabel:DockMargin(6, 0, 6, 0)
        musicLabel:SetText( "Soundtracks" )
        musicLabel:SetTextColor( color_label_settingsForMaps )
        musicLabel:SetFont( "hl2sbMenuFontMedium" )
        musicLabel:SetWrap(true)
        musicLabel:SetAutoStretchVertical(true)

        local buttonPanel = vgui.Create( "DPanel", base )
        buttonPanel:Dock( TOP )
        buttonPanel:DockMargin(6, 0, 6, 0)
        buttonPanel:SetTall( 55 )
        function buttonPanel:Paint( w, h )
            surface.SetDrawColor( color_base_bg )
            surface.DrawRect( 0, 0, w, h )

            surface.SetDrawColor( color_base_outline )
            surface.DrawOutlinedRect( 0, 0, w, h )
        end

        local stopAll = vgui.Create( "DButton", buttonPanel )
        stopAll:Dock( TOP )
        stopAll:SetText( "Stop All Locally" )
        stopAll:SetTextColor( color_access_granted )
        stopAll:SetFont( "hl2sbMenuFontSmall" )
        stopAll:SizeToContents()

        function stopAll:DoClick()
            for k, v in ipairs(hl2sb.soundtracks) do
                local ostPath = v[3]
                if ( file.Exists( "sound/" .. ostPath, "GAME" ) ) then
                    ply:StopSound( ostPath )
                end
            end
        end

        stopAll.Paint = nil

        local stopAllGlobal = vgui.Create( "DButton", buttonPanel )
        stopAllGlobal:Dock( TOP )
        stopAllGlobal:SetText( "Stop All Globally" )
        stopAllGlobal:SetTextColor( color_access_granted )
        stopAllGlobal:SetFont( "hl2sbMenuFontSmall" )
        stopAllGlobal:SizeToContents()

        function stopAllGlobal:DoClick()
            if ( !bHasAccess ) then return end

            net.Start( "hl2sb_MenuStopSound" )
            net.SendToServer()
        end

        stopAllGlobal.Paint = function(this, width, height)
            if ( !bHasAccess ) then
                this:SetTextColor( color_access_denied )
            else
                this:SetTextColor( color_access_granted )
            end
        end

        local scrollPanel = vgui.Create( "DScrollPanel", base )
        scrollPanel:Dock( FILL )
        scrollPanel:DockMargin( 6, 0, 6, 0 )

        base:AddItem( logoPanel )
        base:AddItem( musicLabel )
        base:AddItem( buttonPanel )
        base:AddItem( scrollPanel )

        for k, v in SortedPairsByMemberValue(hl2sb.soundtracks, 1) do
            local ostName = v[1]
            local ostDesc = v[2]
            local ostPath = v[3]

            if ( !file.Exists( "sound/" .. ostPath, "GAME" ) ) then continue end

            local title = vgui.Create( "DLabel", scrollPanel )
            title:Dock( TOP )
            title:SetText( ostName )
            title:SetFont( "hl2sbMenuFontMedium" )
            title:SetWrap( true )
            title:SetAutoStretchVertical( true )
            title:SetTextColor( color_white )

            local desc = vgui.Create( "DLabel", scrollPanel )
            desc:Dock( TOP )
            desc:SetText( ostDesc )
            desc:SetFont( "hl2sbMenuFontVerySmall" )
            desc:SetWrap( true )
            desc:SetAutoStretchVertical( true )
            desc:SetTextColor( color_label_settingsForMaps )

            local buttonsPanel = vgui.Create( "DPanel", scrollPanel )
            buttonsPanel:Dock( TOP )
            buttonsPanel:DockMargin(40, 0, 40, 0)
            buttonsPanel:SetTall( 30 )
            function buttonsPanel:Paint( w, h )
                surface.SetDrawColor( color_base_bg )
                surface.DrawRect( 0, 0, w, h )

                surface.SetDrawColor( color_base_outline )
                surface.DrawOutlinedRect( 0, 0, w, h )
            end

            local play_local = vgui.Create( "DButton", buttonsPanel )
            play_local:Dock( LEFT )
            play_local:SetText( "Play Local" )
            play_local:SetTextColor( color_access_granted )
            play_local:SetFont( "hl2sbMenuFontSmall" )
            play_local:SetTooltip( ostPath )
            play_local:SizeToContents()

            function play_local:Paint(width, height)
                if ( !file.Exists( "sound/" .. ostPath, "GAME" ) ) then
                    self:SetTextColor( color_access_denied )
                end
            end

            function play_local:DoClick()
                if ( !file.Exists( "sound/" .. ostPath, "GAME" ) ) then return end

                timer.Simple( 0, function()
                    RunConsoleCommand("play", ostPath)
                end)
            end

            local play_global = vgui.Create( "DButton", buttonsPanel )
            play_global:Dock( RIGHT )
            play_global:SetText( "Play Global" )
            play_global:SetTextColor( color_access_granted )
            play_global:SetFont( "hl2sbMenuFontSmall" )
            play_global:SetTooltip( ostPath )
            play_global:SizeToContents()

            function play_global:Paint(width, height)
                if ( !file.Exists( "sound/" .. ostPath, "GAME" ) or !bHasAccess ) then
                    self:SetTextColor( color_access_denied )
                else
                    self:SetTextColor( color_access_granted )
                end
            end

            function play_global:DoClick()
                if ( !file.Exists( "sound/" .. ostPath, "GAME" ) or !bHasAccess ) then return end

                net.Start( "hl2sb_MenuPlaySound" )
                    net.WriteString( ostPath )
                net.SendToServer()
            end

            base:AddItem( title )
            base:AddItem( buttonsPanel )
            base:AddItem( desc )
        end
    end )
end )