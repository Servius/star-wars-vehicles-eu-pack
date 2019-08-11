ENT.RenderGroup = RENDERGROUP_BOTH
ENT.Base = "fighter_base"
ENT.Type = "vehicle"

ENT.PrintName = "Clone Wars Z-95 Headhunter"
ENT.Author = "Liam0102 + Jelly"
ENT.Category = "Star Wars Vehicles: Republic"
list.Set("SWVehiclesEU", ENT.PrintName, ENT);
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = false;
ENT.AdminSpawnable = false;

ENT.EntModel = "models/sweaw/ships/rep_z95_servius.mdl"
ENT.Vehicle = "cloneheadhunter"
ENT.StartHealth = 2200;
ENT.HasLookaround = true
if SERVER then

ENT.FireSound = Sound("weapons/xwing_shoot.wav");
ENT.NextUse = {Wings = CurTime(),Use = CurTime(),Fire = CurTime(),};


AddCSLuaFile();
function ENT:SpawnFunction(pl, tr)
	local e = ents.Create("cloneheadhunter");
	e:SetPos(tr.HitPos + Vector(0,0,0));
	e:SetAngles(Angle(0,pl:GetAimVector():Angle().Yaw,0));
	e:Spawn();
	e:Activate();
	return e;
end

function ENT:Initialize()


	self:SetNWInt("Health",self.StartHealth);
	
	self.WeaponLocations = {
		Left = self:GetPos()+self:GetForward()*-10+self:GetRight()*-330.5+self:GetUp()*64,
		Right = self:GetPos()+self:GetForward()*-10+self:GetRight()*330.5+self:GetUp()*64,
	}
	self.WeaponsTable = {};
	self.BoostSpeed = 3000;
	self.ForwardSpeed = 5000;
	self.UpSpeed = 500;
	self.AccelSpeed = 50;
	self.CanStandby = true;
	self.CanBack = true;
	self.CanRoll = true;
	self.CanStrafe = false;
	self.Cooldown = 2;
	self.CanShoot = true;
	self.Bullet = CreateBulletStructure(75,"blue");
	self.FireDelay = 0.0002;
	self.AlternateFire = true;
	self.FireGroup = {"Left","Right",};
	self.HasWings = false;

	//self.ExitModifier = {x=0,y=-325,z=100};

	self.BaseClass.Initialize(self);
end

end

if CLIENT then
	
	ENT.CanFPV = false;
	ENT.Sounds={
		Engine=Sound("vehicles/ywing_eng_loop.wav"),
	}
	
	function ENT:FlightEffects()
		local normal = (self:GetForward() * -1):GetNormalized()
		local roll = math.Rand(-90,90)
		local p = LocalPlayer()		
		local FWD = self:GetForward();
		local id = self:EntIndex();

		for k,v in pairs(self.EnginePos) do
			
			local blue = self.FXEmitter:Add("sprites/orangecore1",v+FWD*-3)
			blue:SetVelocity(normal)
			blue:SetDieTime(FrameTime()*1.25)
			blue:SetStartAlpha(255)
			blue:SetEndAlpha(255)
			blue:SetStartSize(30)
			blue:SetEndSize(10)
			blue:SetRoll(roll)
			blue:SetColor(255,255,255)
			
			local dynlight = DynamicLight(id + 4096 * k);
			dynlight.Pos = v+FWD*-5;
			dynlight.Brightness = 5;
			dynlight.Size = 300;
			dynlight.Decay = 1024;
			dynlight.R = 100;
			dynlight.G = 100;
			dynlight.B = 255;
			dynlight.DieTime = CurTime()+1;
			
		end
	
	end
	
	function ENT:Think()
		local Flying = self:GetNWBool("Flying"..self.Vehicle);
		if(Flying) then
			self.EnginePos = {
				self:GetPos()+self:GetForward()*-295+self:GetUp()*40+self:GetRight()*98.5,
				self:GetPos()+self:GetForward()*-295+self:GetUp()*40+self:GetRight()*-98.5,
			}
			self:FlightEffects();
		end
		self.BaseClass.Think(self);
	end
	
	ENT.ViewDistance = 875;
    ENT.ViewHeight = 200;
	
	function HeadhunterReticle()
		
		local p = LocalPlayer();
		local Flying = p:GetNWBool("Flyingcloneheadhunter");
		local self = p:GetNWEntity("cloneheadhunter");
		if(Flying and IsValid(self)) then
			SW_HUD_DrawHull(2200);
			SW_WeaponReticles(self);
			SW_HUD_DrawOverheating(self);
			SW_HUD_Compass(self);
			SW_HUD_DrawSpeedometer();
		end
	end
	hook.Add("HUDPaint", "cloneheadhunterReticle", cloneheadhunterReticle)

end
