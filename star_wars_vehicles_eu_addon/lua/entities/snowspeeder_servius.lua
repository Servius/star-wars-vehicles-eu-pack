
ENT.RenderGroup = RENDERGROUP_OPAQUE
ENT.Type = "vehicle"
ENT.Base = "fighter_base"

ENT.PrintName = "T-48 Airspeeder"
ENT.Author = "Liam0102, Servius"
ENT.Category = "Star Wars Vehicles: Neutral"; 
list.Set("SWVehiclesEU", ENT.PrintName, ENT);
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = false;
ENT.AdminSpawnable = false;

--ENT.EntModel = "models/snowspeeder/snowspeeder1.mdl"
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
		Right = self:GetPos()+self:GetUp()*40+self:GetForward()*170+self:GetRight()*70,
		Left = self:GetPos()+self:GetUp()*40+self:GetForward()*170+self:GetRight()*-70,
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
	self.GunnerSeat = {}
	
	--self.PilotVisible = true;
	--self.PilotPosition = {x=0,y=45,z=40}

	self.BaseClass.Initialize(self)
	self.GunnerPosition = {
			x = 0,
			y = 300,
			z = 60
		}
end
	function ENT:SpawnTurret()
		local e = ents.Create("prop_physics")
		e:SetPos(self:GetPos() + self:GetUp() * 114 + self:GetForward() * 242)
		e:SetAngles(self:GetAngles())
		e:SetModel("models/ywing/ywing_btlb_guns.mdl")
		e:SetParent(self.TurretGuard)
		e:Spawn()
		e:Activate()
		e:GetPhysicsObject():EnableCollisions(false)
		e:GetPhysicsObject():EnableMotion(false)
		self.Turret = e
		self:SetNWEntity("Turret", e)
	end
	
	function ENT:SpawnGunnerSeat()
		local e = ents.Create("prop_vehicle_prisoner_pod")
		e:SetPos(v[1])
		e:SetAngles(v[2])
		e:SetParent(self)
		e:SetModel("models/nova/airboat_seat.mdl")
		e:SetRenderMode(RENDERMODE_TRANSALPHA)
		e:SetColor(Color(255, 255, 255, 0))
		e:Spawn()
		e:Activate()
		e:SetThirdPersonMode(false)
		e:GetPhysicsObject():EnableMotion(false)
		e:GetPhysicsObject():EnableCollisions(false)
		e:SetUseType(USE_OFF)
		self.GunnerSeat[k] = e
		self:SetNWEntity("GunnerSeat", e)
		e.IsBackGunnerSeat = true
	end
	function ENT:SpawnGunner(pos)
		if (IsValid(self.BackGunner)) then
			local e = ents.Create("prop_physics")
			e:SetModel(self.BackGunner:GetModel())
			e:SetPos(pos)
			local ang = self:GetAngles()

			if (self.GunnerAngle) then
				ang = self:GetAngles() + self.GunnerAngle
			end

			e:SetAngles(ang)
			e:SetParent(self)
			e:SetNoDraw(true)
			e:Spawn()
			e:Activate()
			local anim = "sit_rollercoaster"

			if (self.GunnerAnim) then
				anim = self.GunnerAnim
			end

			e:SetSequence(e:LookupSequence(anim))
			self.GunnerAvatar = e
			self:SetNWEntity("GunnerAvatar", e)
		end
	end

	function ENT:Use(p)
		if (not self.Inflight) then
			if (not p:KeyDown(IN_WALK)) then
				self:Enter(p)
			else
				self:GunnerEnter(p)
			end
		else
			if (p ~= self.Pilot) then
				self:GunnerEnter(p)
			end
		end
	end

	function ENT:FireBack(angPos)
		if (self.NextUse.Fire < CurTime()) then
			self.GunnerBullet.Attacker = self.BackGunner
			self.GunnerBullet.Src = v:GetPos()
			self.GunnerBullet.Dir = angPos
			v:FireBullets(self.GunnerBullet)

			self:EmitSound(self.FireSound, 100, math.random(80, 120))
			self.NextUse.Fire = CurTime() + 0.2
		end
	end
	function ENT:GunnerEnter(p, back)
		if (p == self.Pilot) then return end
		if (p == self.BackGunner) then return end

		if (self.NextUse.Use < CurTime()) then
			if not (back and IsValid(self.BackGunner)) then
				p:SetNWBool("BackGunner", true)
				self.BackGunner = p
				p:EnterVehicle(self.GunnerSeat[1])
				self:SetNWEntity(self.Vehicle .. "Gunner", p)
				local pos = self:GetPos() + self:GetRight() * self.GunnerPosition.x + self:GetForward() * self.GunnerPosition.y + self:GetUp() * self.GunnerPosition.z
				self:SpawnGunner(pos)
			end

			p:SetNWEntity(self.Vehicle, self)
			self.NextUse.Use = CurTime() + 1
		end
	end

	function ENT:GunnerExit(back, p)
		if not back and IsValid(self.BackGunner) then
			self.BackGunner:SetNWBool("BackGunner", false)
			self:SetNWEntity(self.Vehicle .. "Gunner", NULL)
			self.BackGunner = NULL
		end

		if (IsValid(self.PilotAvatar)) then
			self.GunnerAvatar:Remove()
			self:SetNWEntity("GunnerAvatar", NULL)
		end

		p:SetPos(self:GetPos() + self:GetForward() * -300 + self:GetUp() * 50)
		p:SetNWEntity(self.Vehicle, NULL)
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