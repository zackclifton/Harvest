AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )

DEFINE_BASECLASS( "gamemode_base" )

function GM:PlayerNoClip( ply, desiredState )

	if (desiredState == false) then
		return true
	else
		return ply:IsAdmin()
	end
	
end

function GM:PlayerSpawn( ply )

	player_manager.SetPlayerClass( ply, "player_custom" )
	
	BaseClass.PlayerSpawn( self, ply )
	
end -- NORTH AMERICA 