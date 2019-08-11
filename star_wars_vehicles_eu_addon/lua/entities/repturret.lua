ENT.RenderGroup = RENDERGROUP_BOTH
ENT.Base = "speeder_base"
ENT.Type = "vehicle"

ENT.PrintName = "Republic Anti-Personnel Turret"
ENT.Author = "Cody Evans"
--- BASE AUTHOR: Liam0102 ---
ENT.Category = "Star Wars Vehicles: Republic"
list.Set("SWVehiclesEU", ENT.PrintName, ENT);
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = false;
ENT.AdminSpawnable = false;
ENT.AutomaticFrameAdvance =  true; 

ENT.Vehicle = "RepTurret"; 
ENT.EntModel = "models/swbf3/turrets/rep_anti-personnelturret.mdl"; 


ENT.StartHealth = 10000;

list.Set("SWVehicles", ENT.PrintName, ENT);
if SERVER then

ENT.NextUse = {Use = CurTime(),Fire = CurTime()};
ENT.FireSound = Sound("vehicles/speeder_shoot.wav");


AddCSLuaFile();
function ENT:SpawnFunction(pl, tr)
	local e = ents.Create("repturret");
	e:SetPos(tr.HitPos + Vector(0,0,20));
	e:SetModelScale( e:GetModelScale() * 3, 0 )
	e:SetAngles(Angle(0,pl:GetAimVector():Angle().Yaw+0,0));
	e:Spawn();
	e:Activate();
	return e;
end

function ENT:Initialize()
	self.BaseClass.Initialize(self);
	local driverPos = self:GetPos()+self:GetUp()*50+self:GetForward()*-25+self:GetRight()*0;
	local driverAng = self:GetAngles()+Angle(0,-90,0);
	self.SpeederClass = 2;
	self:SpawnChairs(driverPos,driverAng,false)
	self.ForwardSpeed = 0;
	self.BoostSpeed = 0;
	self.AccelSpeed = 1;
	self.HoverMod = 1;
	self.CanBack = false;
	self.StartHover = 1;
	self.WeaponLocations = {}
	self.Bullet = CreateBulletStructure(400,"blue");
	self:SpawnWeapons();
	self.StandbyHoverAmount = 1;	
	self.ExitModifier = {x=0,y=200,z=0}
end

function ENT:Enter(p,driver)
    self.BaseClass.Enter(self,p,driver);
    self:Rotorwash(false);
end

function ENT:FireBlast(pos,gravity,vel,ang)
    if(self.NextUse.FireBlast < CurTime()) then
        local e = ents.Create("cannon_blast");
        e:SetPos(pos);
        e:Spawn();
        e:Activate();
        e:Prepare(self,Sound("weapons/aat_shoot.wav"),gravity,vel,ang);
        e:SetColor(Color(255,255,255,1));
		e.StartSize = 40;
	    e.EndSize = 5;
       
        self.NextUse.FireBlast = CurTime() + 3;
    end
end

local ZAxis = Vector(0,0,1);

function ENT:Think()
	self:NextThink(CurTime())
	self.BaseClass.Think(self)
	
    if(self.Inflight) then
	
        if(IsValid(self.Pilot)) then
	
	    local saveangle = self.Pilot:GetAimVector():Angle()
	    local weaponangle = self:WorldToLocalAngles( saveangle )
	    local aim = weaponangle;	
		local rocketpos,rocketang = self:GetBonePosition(self:LookupBone("turret")) 
			
		local p = aim.p*1;
		if(p >= -150 and p <= -30) then
			p = -30;
		end
			
        self:ManipulateBoneAngles(self:LookupBone("turret"), Angle(0,0,p) );
		self:ManipulateBoneAngles(self:LookupBone("base"), Angle(0,aim.y,0) );
	
	    if(self.Pilot:KeyDown(IN_ATTACK)) then
				self:FireBlast(rocketpos+self:GetRight()*-10+self:GetForward()*70,false,0.1,rocketang:Right()*1000,25);
		elseif(self.Pilot:KeyDown(IN_ATTACK2)) then
				self:FireWeapons();
		end
			lastZ = aim.z;
			self:NextThink(CurTime());
			return true;
		end
	end
end
	
function ENT:Exit(driver,kill)
	self.BaseClass.Exit(self,driver,kill);
end
	
function ENT:FireWeapons()

	if(self.NextUse.Fire < CurTime()) then
		
		local headPoss, headAngg = self:GetBonePosition(self:LookupBone("turret"))
		local e = bonePoss;
		
		local WeaponPos = {
			Vector(headPoss)+self:GetRight()*10+self:GetForward()*0+self:GetUp()*0,
		}
		for k,v in pairs(WeaponPos) do
			tr = util.TraceLine({
				start = headPoss,
				endpos = headPoss + headAngg:Right()*10000,
				filter = {self},
			})
			
			self.Bullet.Src		= v;
			self.Bullet.Attacker = self.Pilot or self;	
			self.Bullet.Dir = (tr.HitPos - v);

			self:FireBullets(self.Bullet)
		end
		self:EmitSound(self.FireSound, 120, math.random(90,110));
		self.NextUse.Fire = CurTime() + 0.3;
	end
end

function ENT:PhysicsSimulate( phys, deltatime )
	self.BackPos = self:GetPos()+self:GetForward()*-10+self:GetUp()*10;
	self.FrontPos = self:GetPos()+self:GetForward()*10+self:GetUp()*10;
	self.MiddlePos = self:GetPos()+self:GetUp()*10; // Middle one
	if(self.Inflight) then
		local UP = ZAxis;
		self.RightDir = self.Entity:GetRight();
		self.FWDDir = self.Entity:GetForward();
		
		self:RunTraces(); // Ignore

		self.ExtraRoll = Angle(0,0,self.YawAccel / 1*-.1);
	end
	self.BaseClass.PhysicsSimulate(self,phys,deltatime);
end

end

if CLIENT then
	ENT.Sounds={
		Engine=Sound(""),
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

	ENT.HasCustomCalcView = true;
	local View = {}
	function CalcView()
		
		local p = LocalPlayer();
		local self = p:GetNWEntity("RepTurret", NULL)
		local DriverSeat = p:GetNWEntity("DriverSeat",NULL);

		if(IsValid(self)) then
			if(IsValid(DriverSeat)) then
				local pos = self:GetPos()+LocalPlayer():GetAimVector():GetNormal()*-400+self:GetUp()*300+self:GetRight()*0;
				local face = ((self:GetPos() + Vector(0,0,250))- pos):Angle();
				    View.origin = pos;
				    View.angles = face;
				return View;
			end
		end
	end
	hook.Add("CalcView", "RepTurretView", CalcView)
	
	function RepTurretReticle()
	
		local p = LocalPlayer();
		local Flying = p:GetNWBool("FlyingRepTurret");
		local self = p:GetNWEntity("RepTurret");
		if(Flying and IsValid(self)) then		
		
			local headPoss, headAngg = self:GetBonePosition(self:LookupBone("turret"))
	
	        surface.SetDrawColor( color_white )		
		
		    local WeaponPos = {
			    Vector(headPoss),
		    }
			
			tr = util.TraceLine({
				start = headPoss,
				endpos = headPoss + headAngg:Right()*10000,
				filter = {self},
			})
			
		    local	vpos = tr.HitPos;
		    local	screen = vpos:ToScreen();
		    local x,y;
		
			 x = 0;
			 y = 0;
			for k,v in pairs(screen) do
				if(k == "x") then
					x = v;
				elseif(k == "y") then
					y = v;
				end
			end
			
		    local w = ScrW()/100*2;
		    local h = w;
		    x = x - w/2;
		    y = y - h/2;
			
			surface.SetMaterial( Material( "hud/reticle.png", "noclamp" ) )
			surface.DrawTexturedRectUV( x , y, w, h, 0, 0, 1, 1 )
			
			SW_Speeder_DrawHull(10000)

		end
	end
	hook.Add("HUDPaint", "RepTurretReticle", RepTurretReticle)
	
	
end