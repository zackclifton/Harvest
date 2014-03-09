AddCSLuaFile()

DEFINE_BASECLASS( "player_default" )

local PLAYER = {} 

--
-- See gamemodes/base/player_class/player_default.lua for all overridable variables
--
PLAYER.WalkSpeed 			= 200
PLAYER.RunSpeed				= 300

function PLAYER:SetupDataTables()

	BaseClass.SetupDataTables( self )
	self:NetworkVar( "Int", 0, "Cash" );
	
end

function PLAYER:Loadout()

	self.Player:RemoveAllAmmo()
	
	self.Player:GiveAmmo( 256,	"Pistol", 		true )
	self.Player:Give( "weapon_pistol" )

end

function PLAYER:Spawn()

	BaseClass.Spawn( self )
	print(self:GetCash())

end

player_manager.RegisterClass( "player_custom", PLAYER, "player_default" )