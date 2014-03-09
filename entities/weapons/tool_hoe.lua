SWEP.PrintName = "Hoe"
SWEP.Author = "Butts"
SWEP.Instructions = "Left click dirt to til it."

SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Primary.Automatic = true

SWEP.DrawAmmo = false

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1

SWEP.Weight			= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Slot			= 0
SWEP.SlotPos			= 2
SWEP.DrawAmmo			= false
SWEP.DrawCrosshair		= true

SWEP.ViewModel			= "models/weapons/v_crowbar.mdl"
SWEP.WorldModel			= "models/weapons/w_crowbar.mdl"
SWEP.UseHands			= false

local ShootSound = Sound( "Metal.SawbladeStick" )

function SWEP:PrimaryAttack()

	-- This weapon is 'automatic'. This function call below defines
	-- the rate of fire. Here we set it to shoot every 0.5 seconds.
	self.Weapon:SetNextPrimaryFire( CurTime() + 0.2	)	

	-- Call 'ThrowChair' on self with this model
	self:TillDirt( "models/props_junk/wood_pallet001a.mdl" )
	self:EmitSound( ShootSound )

end

function SWEP:TillDirt( model_file )
	if ( CLIENT ) then return end
	
	local ent = ents.Create( "prop_physics" )
	if ( !IsValid( ent ) ) then return end
	
	ent:SetModel( model_file )
	ent:SetPos( self.Owner:EyePos() + ( self.Owner:GetAimVector() * 16 ) )
	ent:SetAngles( self.Owner:EyeAngles() )
	ent:Spawn()
	
	local phys = ent:GetPhysicsObject()
	if ( !IsValid( phys ) ) then ent:Remove() return end
	
	phys:EnableMotion( false )
	phys:EnableCollisions( true )
end