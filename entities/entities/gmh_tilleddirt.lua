AddCSLuaFile()

ENT.Base = "base_anim"

ENT.PrintName		= ""
ENT.Author			= ""
ENT.Contact			= ""
ENT.Purpose			= ""
ENT.Instructions	= ""

ENT.Spawnable			= true
ENT.AdminOnly			= false
ENT.Editable			= false

function ENT:Initialize()
	if ( CLIENT ) then return end
	
	self:SetModel( "models/props_junk/wood_pallet001a.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
end