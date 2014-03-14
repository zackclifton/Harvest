AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )
include( "player_class/player_custom.lua" )

DEFINE_BASECLASS( "gamemode_base" )

function GM:PlayerNoClip( ply, desiredState )

	ply:AddMoney(1)
	print(ply:GetMoney())
	
	if (desiredState == false) then
		return true
	else
		return ply:IsAdmin()
	end
	
end

function GM:PlayerSpawn( ply )

	player_manager.SetPlayerClass( ply, "player_custom" )
	
	BaseClass.PlayerSpawn( self, ply )
	
end


util.AddNetworkString("PlayerInfo")

local PlayerMetaTable = FindMetaTable("Player")

function PlayerMetaTable:SavePlayer()

    net.Start("PlayerInfo")
        net.WriteInt(self:GetTable().Money, 32)
    net.Send(self)
	
end