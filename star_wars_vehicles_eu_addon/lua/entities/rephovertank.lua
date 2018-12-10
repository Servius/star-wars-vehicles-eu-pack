ENT.RenderGroup = RENDERGROUP_BOTH
ENT.Base = "speeder_base"
ENT.Type = "vehicle"

ENT.PrintName = "TX-160"
ENT.Author = "Liam0102"
ENT.Category = "Star Wars Vehicles: Republic"
list.Set("SWVehiclesEU", ENT.PrintName, ENT);
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = false;
ENT.AdminSpawnable = false;

ENT.Vehicle = "RepHovertank";
ENT.EntModel = "models/swbf3/vehicles/rep_hover_tank.mdl";
ENT.StartHealth = 5000;

if SERVER then

ENT.NextUse = {Use = CurTime(),Fire = CurTime(),FireLeftBlast = CurTime(),FireRightBlast = CurTime()};
ENT.FireSound = Sound("weapons/xwing_shoot.wav");


AddCSLuaFile();
function ENT:SpawnFunction(pl, tr)
	local e = ents.Create("RepHovertank");
	e:SetPos(tr.HitPos + Vector(0,0,10));
	e:SetAngles(Angle(0,pl:GetAimVector():Angle().Yaw,0));
	e:Spawn();
	e:Activate();
	return e;
end

function ENT:Initialize()
	self.BaseClass.Initialize(self);
	local driverPos = self:GetPos()+self:GetUp()*25+self:GetForward()*22;
	local driverAng = self:GetAngles()+Angle(0,-90,0);
	self:SpawnChairs(driverPos,driverAng,false)
	
	self.ForwardSpeed = 250;
	self.BoostSpeed = 350
	self.AccelSpeed = 6;
	self.HoverMod = 0.1;
	self.SpeederClass = 2;
	self.StartHover = 30;

	self.Bullet = CreateBulletStructure(70,"green",false);
	self.WeaponDir = self:GetAngles():Forward()*-1;
	self.FireDelay = 0.1;

	self.StandbyHoverAmount = 10;
	self.CanBack = true;
	
	self.ExitModifier = {x=0,y=400,z=0}
	self.WeaponLocations = {}
	self:SpawnWeapons();
end

local ZAxis = Vector(0,0,1);

function ENT:FireLeftBlast(pos,gravity,vel,ang,dmg,white,size,snd)
	if(self.NextUse.FireLeftBlast < CurTime()) then
		local e = ents.Create("cannon_blast");
	
	e.Damage = dmg or 1000;
	e.IsWhite = white or false;
	e.StartSize = 15;
	e.EndSize = 5;
	
	local sound = snd or Sound("weapons/stinger_fire1.wav");
	
	e:SetPos(pos);
	e:Spawn();
	e:Activate();
	e:Prepare(self,sound,gravity,vel,ang);
	e:SetColor(Color(255,255,255,1));
		
		self.NextUse.FireLeftBlast = CurTime() + 2;
	end	
end

function ENT:FireRightBlast(pos,gravity,vel,ang,dmg,white,size,snd)
	if(self.NextUse.FireRightBlast < CurTime()) then
		local e = ents.Create("cannon_blast");
	
	e.Damage = dmg or 1000;
	e.IsWhite = white or false;
	e.StartSize = 15;
	e.EndSize = 5;
	
	local sound = snd or Sound("weapons/stinger_fire1.wav");
	
	e:SetPos(pos);
	e:Spawn();
	e:Activate();
	e:Prepare(self,sound,gravity,vel,ang);
	e:SetColor(Color(255,255,255,1));
		
		self.NextUse.FireRightBlast = CurTime() + 2;
	end	
end

function ENT:Think()
	self.BaseClass.Think(self);
	if(self.Inflight) then
		if(IsValid(self.Pilot)) then
		
		local saveangle = self.Pilot:GetAimVector():Angle()
	    local weaponangle = self:WorldToLocalAngles( saveangle )
	    local aim = weaponangle;	
		local TurretApos,TurretAang = self:GetBonePosition(self:LookupBone("turretA")) 
		local TurretBpos,TurretBang = self:GetBonePosition(self:LookupBone("turretB")) 
			
		local p = aim.p*1;
		local c = aim.p*1;
		if(p <= 70 and p >= 2) then
				p = 2;
			elseif(p >= -150 and p <= -30) then
				p = -30;
		end
		if(c <= 70 and c >= 25) then
				c = 25;
			elseif(c >= -150 and c <= -30) then
				c = -30;
		end
			
        self:ManipulateBoneAngles(self:LookupBone("turretA"), Angle(0,0,p) );
		self:ManipulateBoneAngles(self:LookupBone("turretB"), Angle(0,0,p) );
		self:ManipulateBoneAngles(self:LookupBone("cannon_part1"), Angle(aim.z,aim.y,c) );
		
		if(self.Pilot:KeyDown(IN_ATTACK2)) then
			self:FireLeftBlast(TurretBpos+self:GetRight()*-10+self:GetForward()*30+self:GetUp()*20,false,0.1,TurretBang:Right()*1000,25);
			self:FireRightBlast(TurretApos+self:GetRight()*10+self:GetForward()*30+self:GetUp()*20,false,0.1,TurretAang:Right()*1000,25);
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
		
		local CannonPoss, CannonAngg = self:GetBonePosition(self:LookupBone("cannon_part2"))
		local e = bonePoss;
		
		local WeaponPos = {
			Vector(CannonPoss)+self:GetRight()*0+self:GetForward()*10+self:GetUp()*15,
		}
		for k,v in pairs(WeaponPos) do
			tr = util.TraceLine({
				start = CannonPoss,
				endpos = CannonPoss + CannonAngg:Right()*10000,
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
	self.BackPos = self:GetPos()+self:GetUp()*15+self:GetForward()*-290
	self.FrontPos = self:GetPos()+self:GetUp()*15+self:GetForward()*290
	self.MiddlePos = self:GetPos()+self:GetUp()*15;		

	if(self.Inflight) then
		local UP = ZAxis;
		self.RightDir = self.Entity:GetForward():Cross(UP):GetNormalized();
		self.FWDDir = self.Entity:GetForward();	
		
		if(self.Pilot:KeyDown(IN_JUMP)) then
			self.Right = -100;
		elseif(self.Pilot:KeyDown(IN_WALK)) then
			self.Right = 100;
		else
			self.Right = 0;
		end

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
		Engine=Sound("ambient/atmosphere/ambience_base.wav"),
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
		local self = p:GetNWEntity("RepHovertank", NULL)
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
	hook.Add("CalcView", "RepHovertankView", CalcView)
	
	function RepHovertankReticle()
	
		local p = LocalPlayer();
		local Flying = p:GetNWBool("FlyingRepHovertank");
		local self = p:GetNWEntity("RepHovertank");
		if(Flying and IsValid(self)) then		
		
			local CannonPoss, CannonAngg = self:GetBonePosition(self:LookupBone("cannon_part2"))
	
	        surface.SetDrawColor( color_white )		
		
		    local WeaponPos = {
			    Vector(CannonPoss),
		    }
			
			local tr = util.TraceLine({
				start = CannonPoss,
				endpos = CannonPoss + CannonAngg:Right()*10000,
				filter = {self},
			});
			
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
	hook.Add("HUDPaint", "RepHovertankReticle", RepHovertankReticle)

end
