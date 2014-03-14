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
	
end

function PLAYER:Loadout()

	self.Player:RemoveAllAmmo()
	self.Player:Give( "tool_hoe" )
	self.Player:Give( "weapon_physgun" )

end

function PLAYER:Spawn()

	BaseClass.Spawn( self )
	
end

-------------------------------------------------------
--Testing some SetNetworkedInt functions down here
-------------------------------------------------------
local PLYMETA = FindMetaTable("Player")

function PLYMETA:SetMoney(amount)
	self:SetNetworkedInt( "Money", amount)
	self:SaveMoney()
end

function PLYMETA:GetMoney()
	return self:GetNetworkedInt( "Money" )
end

function PLYMETA:AddMoney(amount)
	local current_cash = self:GetMoney()
	self:SetMoney( current_cash + amount )
end

function PLYMETA:SaveMoney()
	local cash = self:GetMoney()
	self:SetPData("money", cash)
end

function PLYMETA:SaveMoneyTXT()
	file.Write(gmod.GetGamemode().Name .."/Money/".. string.gsub(self:SteamID(), ":", "_") ..".txt", self:GetMoneyString())
end

function PLYMETA:TakeMoney(amount)
	self:AddMoney(-amount)
end

player_manager.RegisterClass( "player_custom", PLAYER, "player_default" )