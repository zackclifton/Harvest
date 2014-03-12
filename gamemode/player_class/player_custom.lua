AddCSLuaFile()

DEFINE_BASECLASS( "player_default" )

local PLAYER = {} 

--
-- See gamemodes/base/player_class/player_default.lua for all overridable variables
--
PLAYER.WalkSpeed 			= 200
PLAYER.RunSpeed				= 500
PLAYER.Money = 5

function PLAYER:SetupDataTables()

	BaseClass.SetupDataTables( self )
	self.Player:NetworkVar( "Int", 0, "Cash" )
	self.Player:NetworkVar( "Int", 1, "Stamina" )
	
end

function PLAYER:Loadout()

	self.Player:RemoveAllAmmo()
	self.Player:Give( "tool_hoe" )
	self.Player:Give( "weapon_physgun" )

end

function PLAYER:Spawn()

	BaseClass.Spawn( self )
	self.Player:SetCash(self.Player:GetCash() + 1)
	self.Money = self.Money + 1
	self.Player:SetStamina(100)

	print(self.Money)
	
end

player_manager.RegisterClass( "player_custom", PLAYER, "player_default" )