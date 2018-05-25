ENT.RenderGroup = RENDERGROUP_BOTH
ENT.Base = "speeder_base"
ENT.Type = "vehicle"

ENT.PrintName = "CIS MTT"
ENT.Author = "Servius"
ENT.Category = "Star Wars Vehicles: In Development"; 
list.Set("SWVehiclesEU", ENT.PrintName, ENT);
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = false;
ENT.AdminSpawnable = false;

ENT.Vehicle = "servius_mtt";
ENT.EntModel = "models/ship_tankcis2/ship_tankcis2.mdl";
ENT.StartHealth = 1500;

if SERVER then

ENT.NextUse = {Use = CurTime(),Fire = CurTime()};
ENT.FireSound = Sound("weapons/aat_shoot.wav");


AddCSLuaFile();
function ENT:SpawnFunction(pl, tr)
	local e = ents.Create("servius_mtt");
	e:SetPos(tr.HitPos + Vector(0,0,10));
	e:SetAngles(Angle(0,pl:GetAimVector():Angle().Yaw+180,0));
	e:Spawn();
	e:Activate();
	return e;
end

function ENT:Initialize()
	self.BaseClass.Initialize(self);
	local driverPos = self:GetPos()+self:GetUp()*25+self:GetForward()*22;
	local driverAng = self:GetAngles()+Angle(0,90,0);
	self:SpawnChairs(driverPos,driverAng,false)
	
	self.ForwardSpeed = -350;
	self.BoostSpeed = -550
	self.AccelSpeed = -6;
	self.HoverMod = 0.1;
	self.StartHover = 100;

	self.Bullet = CreateBulletStructure(50,"red");
	self.WeaponDir = self:GetAngles():Forward()*-1;

	self.StandbyHoverAmount = 60;
	self.CanShoot = true;
	self.CanBack = true;
	
	self.SeatPos = {
		{self:GetPos()+self:GetUp()*50,self:GetAngles()},
		{self:GetPos()+self:GetUp()*50+self:GetRight()*50,self:GetAngles()},
		{self:GetPos()+self:GetUp()*50+self:GetRight()*-50,self:GetAngles()},
		{self:GetPos()+self:GetUp()*50+self:GetForward()*-50,self:GetAngles()},
		
		{self:GetPos()+self:GetUp()*50+self:GetRight()*50+self:GetForward()*-50,self:GetAngles()},
		{self:GetPos()+self:GetUp()*50+self:GetRight()*-50+self:GetForward()*-50,self:GetAngles()},
		{self:GetPos()+self:GetUp()*50+self:GetForward()*-100,self:GetAngles()},
		{self:GetPos()+self:GetUp()*50+self:GetRight()*50+self:GetForward()*-100,self:GetAngles()},		
	}
	self:SpawnSeats();
	
	self.ExitModifier = {x=0,y=400,z=0}
	
	self.WeaponLocations = {
		self:GetPos()+self:GetForward()*390+self:GetUp()*40+self:GetRight()*70,
		self:GetPos()+self:GetForward()*390+self:GetUp()*20+self:GetRight()*70,
		self:GetPos()+self:GetForward()*390+self:GetUp()*40+self:GetRight()*-70,
		self:GetPos()+self:GetForward()*390+self:GetUp()*20+self:GetRight()*-70,
	}
	self:SpawnWeapons();
	

end

function ENT:SpawnSeats()
	self.Seats = {};
	for k,v in pairs(self.SeatPos) do
		local e = ents.Create("prop_vehicle_prisoner_pod");
		e:SetPos(v[1]);
		e:SetAngles(v[2]+Angle(0,-90,0));
		e:SetParent(self);		
		e:SetModel("models/nova/airboat_seat.mdl");
		e:SetRenderMode(RENDERMODE_TRANSALPHA);
		e:SetColor(Color(255,255,255,0));	
		e:Spawn();
		e:Activate();
		e:SetUseType(USE_OFF);
		e:GetPhysicsObject():EnableMotion(false);
		e:GetPhysicsObject():EnableCollisions(false);
		e.Isservius_mttSeat = true;
		e.servius_mtt = self;

		self.Seats[k] = e;
	end

end

hook.Add("PlayerEnteredVehicle","servius_mttSeatEnter", function(p,v)
	if(IsValid(v) and IsValid(p)) then
		if(v.IsMTTSeat) then
			p:SetNetworkedEntity("servius_mtt",v:GetParent());
		end
	end
end);

hook.Add("PlayerLeaveVehicle", "servius_mttSeatExit", function(p,v)
	if(IsValid(p) and IsValid(v)) then
		if(v.Isservius_mttSeat) then
			local e = v.servius_mtt;
			if(IsValid(e)) then
				p:SetPos(e:GetPos() + e:GetRight()*e.ExitModifier.x + e:GetForward() * e.ExitModifier.y + e:GetUp() * e.ExitModifier.z);
			end
			p:SetNetworkedEntity("servius_mtt",NULL);
		end
	end
end);

function ENT:PassengerEnter(p)
	if(self.NextUse.Use > CurTime()) then return end;
	for k,v in pairs(self.Seats) do
		if(v:GetPassenger(1) == NULL) then
			p:EnterVehicle(v);
			return;			
		end
	end
end


function ENT:Use(p)
	if(not self.Inflight) then
		if(!p:KeyDown(IN_WALK)) then
			self:Enter(p,true);
		else
			self:PassengerEnter(p);
		end
	else
		if(p != self.Pilot) then
			self:PassengerEnter(p);
		end
	end
end

local ZAxis = Vector(0,0,1);

function ENT:PhysicsSimulate( phys, deltatime )
	self.BackPos = self:GetPos()+self:GetUp()*15+self:GetForward()*-290
	self.FrontPos = self:GetPos()+self:GetUp()*15+self:GetForward()*290
	self.MiddlePos = self:GetPos()+self:GetUp()*15;		

	if(self.Inflight) then
		local UP = ZAxis;
		self.RightDir = self.Entity:GetRight()*-1;
		self.FWDDir = self.Entity:GetForward();	
		

		self:RunTraces();

		self.ExtraRoll = Angle(0,0,self.YawAccel / 4 * -1);
		if(!self.WaterTrace.Hit) then
			if(self.FrontTrace.HitPos.z >= self.BackTrace.HitPos.z) then
				self.PitchMod = Angle(math.Clamp((self.BackTrace.HitPos.z - self.FrontTrace.HitPos.z),-45,45)/2*1,0,0)
			else
				self.PitchMod = Angle(math.Clamp(-(self.FrontTrace.HitPos.z - self.BackTrace.HitPos.z),-45,45)/2*1,0,0)
			end
		end
	end

	
	self.BaseClass.PhysicsSimulate(self,phys,deltatime);
end

end

if CLIENT then
	ENT.Sounds={
		Engine=Sound("vehicles/stap/stap_engine.wav"),
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
		local self = p:GetNWEntity("servius_mtt", NULL)
		local DriverSeat = p:GetNWEntity("DriverSeat",NULL);
		local PassengerSeat = p:GetNWEntity("PassengerSeat",NULL);

		if(IsValid(self)) then

			--if(IsValid(DriverSeat)) then
				local pos = self:GetPos()+self:GetForward()*870+self:GetUp()*200;
				--local face = self:GetAngles() + Angle(0,180,0);
				local face = ((self:GetPos() + Vector(0,0,0))- pos):Angle();
					View.origin = pos;
					View.angles = face;
				return View;
			--end
		end
	end
	hook.Add("CalcView", "servius_mttView", CalcView)

	function servius_mttReticle()
	
		local p = LocalPlayer();
		local Flying = p:GetNWBool("Flyingservius_mtt");
		local self = p:GetNWEntity("servius_mtt");
		if(Flying and IsValid(self)) then
			local WeaponsPos = {self:GetPos()};
			
			SW_Speeder_Reticles(self,WeaponsPos)
			SW_Speeder_DrawHull(1500)
			SW_Speeder_DrawSpeedometer()

		end
	end
	hook.Add("HUDPaint", "servius_mttReticle", servius_mttReticle)
	
	
end