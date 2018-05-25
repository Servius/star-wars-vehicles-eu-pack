ENT.RenderGroup = RENDERGROUP_OPAQUE
ENT.Type = "vehicle"
ENT.Base = "fighter_base"

ENT.PrintName = "Geonosian Transport"
ENT.Author = "Servius"
ENT.Category = "Star Wars Vehicles: In Development"; 
list.Set("SWVehiclesEU", ENT.PrintName, ENT);
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = false;
ENT.AdminSpawnable = false;

ENT.EntModel = "models/ship_dooku/ship_dooku.mdl"
ENT.Vehicle = "geonosis_dooku"
ENT.StartHealth = 1500;
ENT.Allegiance = "CIS";

if SERVER then

ENT.FireSound = Sound("weapons/xwing_shoot.wav");
ENT.NextUse = {Wings = CurTime(),Use = CurTime(),Fire = CurTime(),FireMode = CurTime(),};


AddCSLuaFile();
function ENT:SpawnFunction(pl, tr)
	local e = ents.Create("geonosis_dooku");
	local spawn_height = 100; -- How high above the ground the vehicle spawns. Change if it's spawning too high, or spawning in the ground.
	e:SetPos(tr.HitPos + Vector(0,0,125));
	e:SetAngles(Angle(0,pl:GetAimVector():Angle().Yaw,0));
	e:Spawn();
	e:Activate();
	return e;
end

function ENT:Initialize()
	
	self:SetNWInt("Health",self.StartHealth);
	self.CanRoll = true;
	self.WeaponLocations = {
		Main = self:GetPos()+self:GetForward()*250+self:GetUp()*55,
	}
	self.WeaponsTable = {};
	self.BoostSpeed = 2750;
	self.ForwardSpeed = 1800;
	self.UpSpeed = 750;
	self.AccelSpeed = 10;
	self.CanStandby = true;
	self.CanBack = false;
	self.CanRoll = true;
	self.CanStrafe = false;
	self.Cooldown = 2;
	self.HasLookaround = true;
	self.CanShoot = false;
	self.Bullet = CreateBulletStructure(100,"red");
	self.FireDelay = 0.2;

	self.BaseClass.Initialize(self)
end

end

if CLIENT then
	
	ENT.EnginePos = {}
	ENT.Sounds={
		Engine=Sound("ambient/atmosphere/ambience_base.wav"),
	}
	ENT.CanFPV = true;
	
	function ENT:FlightEffects()
		local normal = (self:GetForward() * -1):GetNormalized()
		local roll = math.Rand(-90,90)
		local p = LocalPlayer()		
		local FWD = self:GetForward();
		local id = self:EntIndex();

		for k,v in pairs(self.EnginePos) do
			local heat = self.FXEmitter:Add("sprites/heatwave",v)
			heat:SetVelocity(normal)
			heat:SetDieTime(0.05)
			heat:SetStartAlpha(255)
			heat:SetEndAlpha(255)
			heat:SetStartSize(15)
			heat:SetEndSize(10)
			heat:SetRoll(roll)
			heat:SetColor(255,100,100)
			
		end
	
	end
	
	function ENT:Think()
		self.BaseClass.Think(self);
		
		local p = LocalPlayer();
		local Flying = self:GetNWBool("Flying".. self.Vehicle);
		local TakeOff = self:GetNWBool("TakeOff");
		local Land = self:GetNWBool("Land");
		if(Flying) then
			self.EnginePos = {
				self:GetPos()+self:GetForward()*-100+self:GetUp()*50,
			}

			if(!TakeOff and !Land) then
				self:FlightEffects();
			end
		end
		
		
	end
	
	hook.Add("ScoreboardShow","geonosis_dookuScoreDisable", function()
		local p = LocalPlayer();	
		local Flying = p:GetNWBool("Flyinggeonosis_dooku");
		if(Flying) then
			return false;
		end
	end)
	
	local View = {}
	local function CalcView()
		
		local p = LocalPlayer();
		local self = p:GetNetworkedEntity("geonosis_dooku", NULL)
		if(IsValid(self)) then
			local fpvPos = self:GetPos()+self:GetUp()*92.5+self:GetForward()*-47.5;
			View = SWVehicleView(self,500,200,fpvPos,true);		
			return View;
		end
	end
	hook.Add("CalcView", "geonosis_dookuView", CalcView)
	
	function geonosis_dookuReticle()
		
		local p = LocalPlayer();
		local Flying = p:GetNWBool("Flyinggeonosis_dooku");
		local self = p:GetNWEntity("geonosis_dooku");
		if(Flying and IsValid(self)) then
			SW_HUD_DrawHull(1500);
			SW_WeaponReticles(self);
			SW_HUD_DrawOverheating(self);
			
			local pos = self:GetPos()+self:GetUp()*85+self:GetForward()*-20;
			local x,y = SW_XYIn3D(pos);
			
			SW_HUD_Compass(self,x,y);
			SW_HUD_DrawSpeedometer();	
		end
	end
	hook.Add("HUDPaint", "geonosis_dookuReticle", geonosis_dookuReticle)

end