
ENT.RenderGroup = RENDERGROUP_OPAQUE
ENT.Type = "vehicle"
ENT.Base = "fighter_base"

ENT.PrintName = "T-48 Airspeeder"
ENT.Author = "Liam0102, Servius"
ENT.Category = "Star Wars"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = true;
ENT.AdminSpawnable = false;

//ENT.EntModel = "models/snowspeeder/snowspeeder1.mdl"
ENT.EntModel = "models/swbf3/vehicles/reb_snowspeeder.mdl"
ENT.Vehicle = "snowspeeder_servius"
ENT.StartHealth = 1000;
ENT.Allegiance = "Rebels";

if SERVER then

ENT.FireSound = Sound("weapons/xwing_shoot.wav");
ENT.NextUse = {Wings = CurTime(),Use = CurTime(),Fire = CurTime(),FireMode = CurTime(),};


AddCSLuaFile();
function ENT:SpawnFunction(pl, tr)
	local e = ents.Create("snowspeeder_servius");
	e:SetPos(tr.HitPos + Vector(0,0,5));
	e:SetAngles(Angle(0,pl:GetAimVector():Angle().Yaw,0));
	e:Spawn();
	e:Activate();
	return e;
end

function ENT:Initialize()
	
	self:SetNWInt("Health",self.StartHealth);
	self.CanRoll = false;
	self.CanStrafe = true;
	self.WeaponLocations = {
		Right = self:GetPos()+self:GetUp()*45+self:GetForward()*170+self:GetRight()*55,
		Left = self:GetPos()+self:GetUp()*45+self:GetForward()*170+self:GetRight()*-55,
	}
	self.WeaponsTable = {};
	self:SpawnWeapons();
	self.BoostSpeed = 1500;
	self.ForwardSpeed = 850;
	self.UpSpeed = 550;
	self.AccelSpeed = 7;
	self.CanStandby = true;
	self.Bullet = CreateBulletStructure(90,"red");
	self.FireDelay = 0.3;
	self.CanShoot = true;
	self.HasLookaround = true;
	
	
	//self.PilotVisible = true;
	//self.PilotPosition = {x=0,y=45,z=40}

	self.BaseClass.Initialize(self)
end

end

if CLIENT then

	function ENT:Draw() self:DrawModel() end
	
	ENT.EnginePos = {}
	ENT.Sounds={
		Engine=Sound("vehicles/snowspeeder/snowspeeder_engine.wav"),
	}

	ENT.CanFPV = true;
	
	hook.Add("ScoreboardShow","snowspeeder_serviusScoreDisable", function()
		local p = LocalPlayer();	
		local Flying = p:GetNWBool("Flyingsnowspeeder_servius");
		if(Flying) then
			return false;
		end
	end)
	
	local View = {}
	function CalcView()
		
		local p = LocalPlayer();
		local self = p:GetNetworkedEntity("snowspeeder_servius", NULL)
		if(IsValid(self)) then
			local fpvPos = self:GetPos()+self:GetUp()*67.5+self:GetForward()*45;	
			View = SWVehicleView(self,700,200,fpvPos,true);		
			return View;
		end
	end
	hook.Add("CalcView", "snowspeeder_serviusView", CalcView)
	

	function snowspeeder_serviusReticle()
		
		local p = LocalPlayer();
		local Flying = p:GetNWBool("Flyingsnowspeeder_servius");
		local self = p:GetNWEntity("snowspeeder_servius");
		if(Flying and IsValid(self)) then
			SW_HUD_DrawHull(1000);
			SW_WeaponReticles(self);
			SW_HUD_DrawOverheating(self);
			
			local pos = self:GetPos()+self:GetUp()*60+self:GetForward()*60+self:GetRight()*-10;
			local x,y = SW_XYIn3D(pos);
			
			SW_HUD_Compass(self,x,y);
			SW_HUD_DrawSpeedometer();	
		end
	end
	hook.Add("HUDPaint", "snowspeeder_serviusReticle", snowspeeder_serviusReticle)

end