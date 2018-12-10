
ENT.RenderGroup = RENDERGROUP_BOTH
ENT.Base = "speeder_base"
ENT.Type = "vehicle"

ENT.PrintName = "T-10B"
ENT.Author = "Liam0102"
ENT.Category = "Star Wars Vehicles: Rebels"; 
list.Set("SWVehiclesEU", ENT.PrintName, ENT);
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = false;
ENT.AdminSpawnable = false;

ENT.Vehicle = "t10b";
ENT.EntModel = "models/swbf3/vehicles/reb_t5b.mdl";
ENT.StartHealth = 5000;
list.Set("SWVehicles", ENT.PrintName, ENT);
if SERVER then

ENT.NextUse = {Use = CurTime(),Fire = CurTime()};
ENT.FireSound = Sound("weapons/aat_shoot.wav");


AddCSLuaFile();
function ENT:SpawnFunction(pl, tr)
	local e = ents.Create("t10b");
	e:SetPos(tr.HitPos + Vector(0,0,10));
	e:SetModelScale( e:GetModelScale() * 1.5, 0 )
	e:SetAngles(Angle(0,pl:GetAimVector():Angle().Yaw+180,0));
	e:Spawn();
	e:Activate();
	return e;
end

function ENT:Initialize()

	self.BaseClass.Initialize(self);
	local driverPos = self:GetPos()+self:GetUp()*50+self:GetForward()*0;
	local driverAng = self:GetAngles()+Angle(0,90,0);
	self:SpawnChairs(driverPos,driverAng,false);
	
	self.ForwardSpeed = -150;
	self.BoostSpeed = -200
	self.AccelSpeed = 6;
	self.HoverMod = 0.5;
	self.SpeederClass = 2;
	self.NoWobble = true;
	self.CanBack = true;
	self.StartHover = 1;
	self.Bullet = CreateBulletStructure(50,"red");
	self.FireDelay = 0.1;
	self.ExitModifier = {x=250,y=0,z=0};
	
end

function ENT:FireBlast(pos,gravity,vel,ang)
    if(self.NextUse.FireBlast < CurTime()) then
        local e = ents.Create("tank_blast");
        e:SetPos(pos);
        e:Spawn();
        e:Activate();
        e:Prepare(self,Sound("weapons/rocket_shoot.wav"),gravity,vel,ang);
        e:SetColor(Color(255,255,255,1));
		e.StartSize = 40;
	    e.EndSize = 5;
       
        self.NextUse.FireBlast = CurTime() + 3;
    end
end

function ENT:Think()
	self.BaseClass.Think(self);
	if(self.Inflight) then
		if(IsValid(self.Pilot)) then
		
		local saveangle = self.Pilot:GetAimVector():Angle()
	    local weaponangle = self:WorldToLocalAngles( saveangle )
	    local aim = weaponangle;	
		local rocketpos,rocketang = self:GetBonePosition(self:LookupBone("barrel")) 
			
		local p = aim.p*1;
		if(p <= 70 and p >= 8) then
				p = 8;
			elseif(p >= -150 and p <= -30) then
				p = -30;
		end
			
        self:ManipulateBoneAngles(self:LookupBone("cannon_part1"), Angle(0,aim.y+180,0) );
		self:ManipulateBoneAngles(self:LookupBone("cannon_part2"), Angle(0,0,-p) );
		
		if(self.Pilot:KeyDown(IN_ATTACK2)) then
				self:FireBlast(rocketpos+self:GetRight()*0+self:GetForward()*70,false,0.1,rocketang:Right()*-1000,25);
		elseif(self.Pilot:KeyDown(IN_ATTACK)) then
				self:FireWeapons();
		end
			
			self:NextThink(CurTime());
			return true;
		end
	end
	
end


function ENT:FireWeapons()

	if(self.NextUse.Fire < CurTime()) then
		
		local CannonPoss, CannonAngg = self:GetBonePosition(self:LookupBone("barrel"))
		local e = bonePoss;
		
		local WeaponPos = {
			Vector(CannonPoss)+self:GetRight()*20+self:GetForward()*0+self:GetUp()*10,
		}
		for k,v in pairs(WeaponPos) do
			tr = util.TraceLine({
				start = CannonPoss,
				endpos = CannonPoss + CannonAngg:Right()*-10000,
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

local ZAxis = Vector(0,0,1);

function ENT:PhysicsSimulate( phys, deltatime )
	self.BackPos = self:GetPos()+self:GetForward()*100;
	self.FrontPos = self:GetPos()+self:GetForward()*-145;
	self.MiddlePos = self:GetPos();
	if(self.Inflight) then
		local UP = ZAxis;
		self.RightDir = self.Entity:GetForward():Cross(UP):GetNormalized();
		self.FWDDir = self.Entity:GetForward();
		
		self:RunTraces();

		self.ExtraRoll = Angle(0,0,self.YawAccel / 4);
		if(!self.WaterTrace.Hit) then
			if(self.FrontTrace.HitPos.z >= self.BackTrace.HitPos.z) then
				self.PitchMod = Angle(math.Clamp((self.BackTrace.HitPos.z - self.FrontTrace.HitPos.z),-45,45)/3*-1,0,0)
			else
				self.PitchMod = Angle(math.Clamp(-(self.FrontTrace.HitPos.z - self.BackTrace.HitPos.z),-45,45)/3*-1,0,0)
			end
		end
	end

	self.BaseClass.PhysicsSimulate(self,phys,deltatime);	

end

end

if CLIENT then
	ENT.Sounds={
		Engine=Sound("ambient/atmosphere/ambience_base.wav"),
	}
	
	local Health = 0;
	local Target;
	local Turret;
	local Cannon;
	function ENT:Think()
		self.BaseClass.Think(self);
		local p = LocalPlayer();
		local Flying = p:GetNWBool("Flying"..self.Vehicle);
		if(Flying) then
			Health = self:GetNWInt("Health");
			Target = self:GetNWVector("Target");
		end
		
	end
    
    ENT.HasCustomCalcView = true;
	local View = {}
	function CalcView()
		
		local p = LocalPlayer();
		local self = p:GetNWEntity("t10b", NULL)
		local DriverSeat = p:GetNWEntity("DriverSeat",NULL);

		if(IsValid(self)) then
			if(IsValid(DriverSeat)) then
				local pos = self:GetPos()+LocalPlayer():GetAimVector():GetNormal()*-350+self:GetUp()*250+self:GetRight()*0;
				local face = ((self:GetPos() + Vector(0,0,150))- pos):Angle();
				    View.origin = pos;
				    View.angles = face;
				return View;
			end
		end
	end
	hook.Add("CalcView", "t10bView", CalcView)
	
	function t10bReticle()
	
		local p = LocalPlayer();
		local Flying = p:GetNWBool("Flyingt10b");
		local self = p:GetNWEntity("t10b");
		if(Flying and IsValid(self)) then		
		
			local rocketpos,rocketang = self:GetBonePosition(self:LookupBone("barrel")) 
	
	        surface.SetDrawColor( color_white )		
		
		    local WeaponPos = {
			    Vector(rocketpos),
		    }
			
			tr = util.TraceLine({
				start = rocketpos,
				endpos = rocketpos + rocketang:Right()*-10000,
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
			
			SW_Speeder_DrawHull(5000)
			SW_Speeder_DrawSpeedometer()

		end
	end
	hook.Add("HUDPaint", "t10bReticle", t10bReticle)
	
end