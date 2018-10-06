ENT.RenderGroup = RENDERGROUP_BOTH
ENT.Base = "w40walker_base"
ENT.Type = "vehicle"

ENT.PrintName = "AT-TSB"
ENT.Author = "Cody Evans"
--- BASE AUTHOR: Liam0102 ---
ENT.Category = "Star Wars"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = false;
ENT.AdminSpawnable = false;
ENT.AutomaticFrameAdvance =  true; 
ENT.Allegiance = "Neutral"

ENT.Vehicle = "W40KSentinel"; 
ENT.EntModel = "models/helios/sentinel/wsent.mdl"; 

list.Set("SWVehicles", ENT.PrintName, ENT);
ENT.StartHealth = 4000;

if SERVER then

ENT.NextUse = {Use = CurTime(),Fire = CurTime(),Flamethrower = CurTime()};
ENT.FlamethrowerSound = Sound("ambient/fire/ignite.wav");
ENT.LaserSound = Sound("ambient/fire/ignite.wav");


AddCSLuaFile();
function ENT:SpawnFunction(pl, tr)
	local e = ents.Create("w40ksentinel");
	e:SetPos(tr.HitPos + Vector(0,0,20));
	e:SetModelScale( e:GetModelScale() * 1.2, 0 )
	e:SetAngles(Angle(0,pl:GetAimVector():Angle().Yaw+0,0));
	e:Spawn();
	e:Activate();
	return e;
end

function ENT:Initialize()
	self.BaseClass.Initialize(self);
	local driverPos = self:GetPos()+self:GetUp()*180+self:GetForward()*-10+self:GetRight()*0;
	local driverAng = self:GetAngles()+Angle(0,-90,0);
	self.SpeederClass = 2;
	self:SpawnChairs(driverPos,driverAng,false)
	self.ForwardSpeed = 110;
	self.BoostSpeed = 110;
	self.AccelSpeed = 10;
	self.HoverMod = 10;
	self.CanBack = false;
	self.CanFire = false;
	self.StartHover = 10;
	self.StandbyHoverAmount = 10;	
	self.ExitModifier = {x=0,y=200,z=0}
end

function ENT:Enter(p,driver)
    self.BaseClass.Enter(self,p,driver);
    self:Rotorwash(false);
end

local ZAxis = Vector(0,0,1);

function ENT:Think()
	self:NextThink(CurTime())
	self.BaseClass.Think(self)
	
    if(self.Inflight) then
	    if self:GetNWInt("Speed") >= 0 and self:GetNWInt("Speed") < 10 then
			self:ResetSequence( self:LookupSequence( "walking" ) );
			self:SetPlaybackRate( 1.0 )
	    elseif self:GetNWInt("Speed")  >= 10 and self:GetNWInt("Speed") < 30 then
			self:ResetSequence( self:LookupSequence( "walking" ) );
			self:SetPlaybackRate( 1.3 )
	    elseif self:GetNWInt("Speed")  >= 30 and self:GetNWInt("Speed") < 70 then
			self:ResetSequence( self:LookupSequence( "walking" ) );
			self:SetPlaybackRate( 1.6 )
	    elseif self:GetNWInt("Speed")  >= 70 and self:GetNWInt("Speed") < 110 then
			self:ResetSequence( self:LookupSequence( "walking" ) );
			self:SetPlaybackRate( 1.9 )
	    end
	
	    if self:GetNWInt("Speed") <= 0 then
		    self:SetSequence( self:LookupSequence( "walking" ) );
			self:ResetSequenceInfo()
		    self:SetPlaybackRate( 0 );
	    end
	
        if(IsValid(self.Pilot)) then
		
	    local aimvector = self.Pilot:GetAimVector():Angle():Forward()*1000
	    local saveangle = self.Pilot:GetAimVector():Angle()
	    local weaponangle = self:WorldToLocalAngles( saveangle )
	    local aim = weaponangle;	
		local flamepos,flameang = self:GetBonePosition(self:LookupBone("Cannon")) 
			
		local p = aim.p*1;
		if(p >= -150 and p <= -30) then
			p = -30;
		end
			
		self:ManipulateBoneAngles(self:LookupBone("tete_2"), Angle(0,-aim.z,-aim.y) );

		if(self.Pilot:KeyDown(IN_ATTACK)) then
			self:FireFlamethrower(flamepos+self:GetRight()*0+self:GetForward()*0,true,0.1,aimvector);
		end
			lastZ = aim.z;
			self:NextThink(CurTime());
			return true;
		end
	end
end

function ENT:FireFlamethrower(pos,gravity,vel,ang)
    if(self.NextUse.Flamethrower < CurTime()) then
        local e = ents.Create("sentinelflame");
        e:SetPos(pos);
        e:Spawn();
        e:Activate();
        e:Prepare(self,Sound("ambient/fire/mtov_flame2.wav"),gravity,vel,ang);
        e:SetColor(Color(255,255,255,1));
		
		self:EmitSound(self.FlamethrowerSound, 70, math.random(40,80));
        self.NextUse.Flamethrower = CurTime() + 0.1;
    end
end
	
function ENT:Exit(driver,kill)
	self.BaseClass.Exit(self,driver,kill);
	self:SetSequence( self:LookupSequence( "walking" ) );
	self:ResetSequenceInfo()
	self:SetPlaybackRate( 0 )
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
		Engine=Sound("w40ksentinel/sentinel_walk.wav"),
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
		local self = p:GetNWEntity("W40KSentinel", NULL)
		local DriverSeat = p:GetNWEntity("DriverSeat",NULL);

		if(IsValid(self)) then
			if(IsValid(DriverSeat)) then
				local pos = self:GetPos()+LocalPlayer():GetAimVector():GetNormal()*-250+self:GetUp()*350+self:GetRight()*0;
				local face = ((self:GetPos() + Vector(0,0,300))- pos):Angle();
				    View.origin = pos;
				    View.angles = face;
				return View;
			end
		end
	end
	hook.Add("CalcView", "W40KSentinelView", CalcView)
	
	function W40KSentinelReticle()
	
		local p = LocalPlayer();
		local Flying = p:GetNWBool("FlyingW40KSentinel");
		local self = p:GetNWEntity("W40KSentinel");
		if(Flying and IsValid(self)) then		
		
			local headPoss, headAngg = self:GetBonePosition(self:LookupBone("tete_2"))
	
	        surface.SetDrawColor( color_white )		
		
		    local WeaponPos = {
			    Vector(headPoss),
		    }
			
			tr = util.TraceLine({
				start = headPoss,
				endpos = headPoss + p:GetAimVector():Angle():Forward()*600,
				filter = {self,p},
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
			
			W40WALKER_Speeder_DrawHull(4000)

		end
	end
	hook.Add("HUDPaint", "W40KSentinelReticle", W40KSentinelReticle)
	
	
end