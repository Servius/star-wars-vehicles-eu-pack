

ENT.RenderGroup = RENDERGROUP_BOTH
ENT.Base = "fighter_base"
ENT.Type = "vehicle"

ENT.PrintName = "Umbaran Fighter"
ENT.Author = "Servius"
ENT.Category = "Star Wars Vehicles: Neutral"; 
list.Set("SWVehiclesEU", ENT.PrintName, ENT);
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = false;
ENT.AdminSpawnable = false;

ENT.EntModel = "models/ship_umbaran3/ship_umbaran3.mdl"
ENT.Vehicle = "vulture_servius"
ENT.StartHealth = 1500;
ENT.Allegiance = "CIS";

if SERVER then

ENT.FireSound = Sound("weapons/tie_shoot.wav");
ENT.NextUse = {Wings = CurTime(),Use = CurTime(),Fire = CurTime(),};

AddCSLuaFile();
function ENT:SpawnFunction(pl, tr)
	local e = ents.Create("vulture_servius");
	e:SetPos(tr.HitPos + Vector(0,0,10));
	e:SetAngles(Angle(0,pl:GetAimVector():Angle().Yaw,0));
	e:Spawn();
	e:Activate();
	return e;
end

function ENT:Initialize()

	self:SetNWInt("Health",self.StartHealth);
	
	self.WeaponLocations = {	
		BottomLeft = self:GetPos()+self:GetRight()*-200+self:GetUp()*24+self:GetForward()*500,
		BottomRight = self:GetPos()+self:GetRight()*200+self:GetUp()*24+self:GetForward()*500,
		TopLeft = self:GetPos()+self:GetRight()*-200+self:GetUp()*150+self:GetForward()*500,
		TopRight = self:GetPos()+self:GetRight()*200+self:GetUp()*150+self:GetForward()*500,
	}
	self.WeaponsTable = {};
	self.BoostSpeed = 2500;
	self.ForwardSpeed = 1400;
	self.UpSpeed = 500;
	self.AccelSpeed = 8;
	self.CanRoll = true;
	self.CanShoot = true;
	self.Bullet = CreateBulletStructure(30,"red");
	self.CanStandby = true;
	
	self.AlternateFire = true -- Set this to true if you want weapons to fire in sequence (You'll need to set the firegroups below)
	self.FireGroup = {"BottomLeft","TopRight","TopLeft","BottomRight"} -- In this example, the weapon positions set above will fire with Left and TopLeft at the same time. And Right and TopRight at the same time.
	
	self.BaseClass.Initialize(self);
end


end

if CLIENT then

	function ENT:Draw() self:DrawModel() end
	
	ENT.EnginePos = {}
	ENT.Sounds={
		Engine=Sound("vehicles/droid/droid_fly.wav"),
	}
	ENT.CanFPV = false;
	
	local Health = 0;
	local Overheat = 0;
	local Overheated = false;
	function ENT:Think()
		
		self.BaseClass.Think(self);
		
		local p = LocalPlayer();
		local IsFlying = p:GetNWBool("Flying"..self.Vehicle);
		local IsDriver = p:GetNWEntity(self.Vehicle) == self.Entity;
		if(IsFlying and IsDriver) then
			Health = self:GetNWInt("Health");
			Overheat = self:GetNWInt("Overheat");
			Overheated = self:GetNWBool("Overheated");
		end
	end
	
	local View = {}
	local function CalcView()
		
		local p = LocalPlayer();
		local self = p:GetNetworkedEntity("vulture_servius", NULL)

		if(IsValid(self)) then
			View = SWVehicleView(self,700,200,self:GetPos());
			return View;
		end
	end
	hook.Add("CalcView", "vulture_serviusView", CalcView)
	
	function vulture_serviusReticle()
		
		local p = LocalPlayer();
		local Flying = p:GetNWBool("Flyingvulture_servius");
		local self = p:GetNWEntity("vulture_servius");
		if(Flying and IsValid(self)) then
			SW_HUD_DrawHull(500);
			SW_WeaponReticles(self);
			SW_HUD_DrawOverheating(self);
	
			SW_HUD_Compass(self);
			SW_HUD_DrawSpeedometer();
		end
	end
	hook.Add("HUDPaint", "vulture_serviusReticle", vulture_serviusReticle)

end