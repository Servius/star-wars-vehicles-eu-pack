ENT.RenderGroup = RENDERGROUP_BOTH
ENT.Base = "speeder_base"
ENT.Type = "vehicle"

ENT.PrintName = "Servius Speeder 3"
ENT.Author = "Liam0102"
ENT.Category = "Star Wars Vehicles: In Development"; 
list.Set("SWVehiclesEU", ENT.PrintName, ENT);
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = false;
ENT.AdminSpawnable = false;

ENT.Vehicle = "speeder_servius_3"; -- The unique name for the speeder.
ENT.EntModel = "models/speeder_03/speeder_03.mdl"; -- The path to your model

local classes = {
	"speeder_bike",
	"stap",
	"rep_tank",
	"aat",
	"speeder_servius",
	"podracer",
	"landspeeder",
	"imp_speeder",
	"speeder_servius_2",
	"speeder_servius_3",
}
function IsSWSpeeder(class)
	
	for k,v in pairs(classes) do
		if(v == class) then
			return true;
		end
	end
	return false;

end
ENT.StartHealth = 1000;
if SERVER then

ENT.NextUse = {Use = CurTime(),Fire = CurTime()};
ENT.FireSound = Sound("vehicles/speeder_shoot.wav");


AddCSLuaFile();
function ENT:SpawnFunction(pl, tr)
	local e = ents.Create("speeder_servius_3");
	e:SetPos(tr.HitPos + Vector(0,0,10));
	e:SetAngles(Angle(0,pl:GetAimVector():Angle().Yaw+180,0));
	e:Spawn();
	e:Activate();
	return e;
end

function ENT:Initialize()
	self.BaseClass.Initialize(self);
	local driverPos = self:GetPos()+self:GetUp()*19+self:GetForward()*28;
	local driverAng = self:GetAngles()+Angle(0,90,0);
	self.SeatClass = "phx_seat3"
	self:SpawnChairs(driverPos,driverAng,false)
	
	self.ForwardSpeed = -550;
	self.BoostSpeed = -850
	self.AccelSpeed = 8;
	self.HoverMod = 0.1;
	self.StartHover = 25;
	self.WeaponLocations = {
		self:GetPos()+self:GetForward()*-150+self:GetUp()*10+self:GetRight()*-6,
		self:GetPos()+self:GetForward()*-150+self:GetUp()*10+self:GetRight()*6,
	}
	self.Bullet = CreateBulletStructure(50,"red");
	self.WeaponDir = self:GetAngles():Forward()*-1;
	self:SpawnWeapons();
	self.StandbyHoverAmount = 40;
	self.CanShoot = false;

end

local ZAxis = Vector(0,0,1);

function ENT:PhysicsSimulate( phys, deltatime )
	self.BackPos = self:GetPos()+self:GetForward()*80+self:GetUp()*15
	self.FrontPos = self:GetPos()+self:GetForward()*-100+self:GetUp()*15
	self.MiddlePos = self:GetPos()+self:GetUp()*15;		
	if(self.Inflight) then
		local UP = ZAxis;
		self.RightDir = self.Entity:GetForward():Cross(UP):GetNormalized();
		self.FWDDir = self.Entity:GetForward();	
		

		self:RunTraces();

		self.ExtraRoll = Angle(0,0,self.YawAccel / 2);
		if(!self.WaterTrace.Hit) then
			if(self.FrontTrace.HitPos.z >= self.BackTrace.HitPos.z) then
				self.PitchMod = Angle(math.Clamp((self.BackTrace.HitPos.z - self.FrontTrace.HitPos.z),-45,45)/2*-1,0,0)
			else
				self.PitchMod = Angle(math.Clamp(-(self.FrontTrace.HitPos.z - self.BackTrace.HitPos.z),-45,45)/2*-1,0,0)
			end
		end
	end

	
	self.BaseClass.PhysicsSimulate(self,phys,deltatime);
end

end

if CLIENT then
	ENT.Sounds={
		Engine=Sound("landspeeder_fly.wav"),
	}
	
	local Health = 0;
	local Speed = 0;
	function ENT:Think()
		self.BaseClass.Think(self);
		local p = LocalPlayer();
		local Flying = p:GetNWBool("Flying"..self.Vehicle);
		if(Flying) then
			Health = self:GetNWInt("Health");
			Speed = self:GetNWInt("Speed");
		end
		
	end

	local View = {}
	function CalcView()
		
		local p = LocalPlayer();
		local self = p:GetNWEntity("speeder_servius_3", NULL)
		local DriverSeat = p:GetNWEntity("DriverSeat",NULL);
		local PassengerSeat = p:GetNWEntity("PassengerSeat",NULL);

		if(IsValid(self)) then

			if(IsValid(DriverSeat)) then
				if(DriverSeat:GetThirdPersonMode()) then
					local pos = self:GetPos()+self:GetForward()*270+self:GetUp()*100;
					--local face = self:GetAngles() + Angle(0,180,0);
					local face = ((self:GetPos() + Vector(0,0,100))- pos):Angle();
						View.origin = pos;
						View.angles = face;
					return View;
				end
			end
		end
	end
	hook.Add("CalcView", "speeder_servius_3View", CalcView)

	
	hook.Add( "ShouldDrawLocalPlayer", "speeder_servius_3DrawPlayerModel", function( p )
		local self = p:GetNWEntity("speeder_servius_3", NULL);
		local DriverSeat = p:GetNWEntity("DriverSeat",NULL);
		local PassengerSeat = p:GetNWEntity("PassengerSeat",NULL);
		if(IsValid(self)) then
			if(IsValid(DriverSeat)) then
				if(DriverSeat:GetThirdPersonMode()) then
					return true;
				end
			elseif(IsValid(PassengerSeat)) then
				if(PassengerSeat:GetThirdPersonMode()) then
					return true;
				end
			end
		end
	end);
	
	function speeder_servius_3Reticle()
	
		local p = LocalPlayer();
		local Flying = p:GetNWBool("Flyingspeeder_servius_3");
		local self = p:GetNWEntity("speeder_servius_3");
		if(Flying and IsValid(self)) then
			local WeaponsPos = {self:GetPos()};
			
			SW_Speeder_Reticles(self,WeaponsPos)
			SW_Speeder_DrawHull(1000)
			SW_Speeder_DrawSpeedometer()

		end
	end
	hook.Add("HUDPaint", "speeder_servius_3Reticle", speeder_servius_3Reticle)
	
	
end