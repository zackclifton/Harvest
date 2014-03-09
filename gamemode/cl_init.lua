include( "shared.lua" )

-- Define our own font!
surface.CreateFont( "Harvest", {
	font = "Nyala",
	size = 35,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = false,
} )

function GM:HUDShouldDraw( name )
	if ( name == "CHudHealth" or name == "CHudBattery" ) then -- Disable the default health / battery on the HUD
		return false
	end
	return true
end

function GM:HUDPaint()
	client = client or LocalPlayer() -- Store the owner of the HUD into the "client" variable
	if (client:Alive()) then
		local text = string.format( "Health: %i", client:Health()) -- Collect data from the owner of the HUD
		if ( client:Health() > 30 ) then -- Draw the health text in red if it's at or below 30, otherwise draw it in white
			draw.DrawText( text, "Harvest", ScrW() * 0.05, ScrH() * 0.05, Color( 255,255,255,255 ), TEXT_ALIGN_LEFT )
		else
			draw.DrawText( text, "Harvest", ScrW() * 0.05, ScrH() * 0.05, Color( 255,100,100,255 ), TEXT_ALIGN_LEFT )
		end
	end
end