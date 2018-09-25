ENT.RenderGroup = RENDERGROUP_OPAQUE
ENT.Base = "fighter_base"
ENT.Type = "vehicle"
ENT.PrintName = "NTB-630 Bomber"
ENT.Author = "Liam0102, Jellyton"
ENT.Category = "Star Wars Vehicles: In Development"; 
list.Set("SWVehiclesEU", ENT.PrintName, ENT);
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.EntModel = "models/sweaw/ships/rep_ntb630_servius.mdl"
ENT.Vehicle = "ntbbomber"
ENT.Allegiance = "Republic"
ENT.StartHealth = 1500

list.Set("SWVehicles", ENT.PrintName, ENT);

if SERVER then
	ENT.FireSound = Sound("weapons/xwing_shoot.wav")

	ENT.NextUse = {
		Wings = CurTime(),
		Use = CurTime(),
		Fire = CurTime()
	}

	AddCSLuaFile()

	function ENT:SpawnFunction(pl, tr)
		local e = ents.Create("ntbbomber")
		if not IsValid(e) then return end
		e:SetPos(tr.HitPos + Vector(0, 0, 20))
		e:SetModelScale( e:GetModelScale() * 0.75, 0 )
		e:SetAngles(Angle(0, pl:EyeAngles().Yaw, 0))
		e:Spawn()
		e:Activate()

		return e
	end

	function ENT:Initialize()
		self:SetNWInt("Health", self.StartHealth)
		self:SetNWBool("InShip", false)

		self.WeaponLocations = {
			Right = self:GetPos() + self:GetForward() * 520 + self:GetRight() * 25 + self:GetUp() * 40,
			Left = self:GetPos() + self:GetForward() * 520 + self:GetRight() * -25 + self:GetUp() * 40
		}

		self.WeaponsTable = {}
		self.BoostSpeed = 900
		self.ForwardSpeed = 900
		self.UpSpeed = 600
		self.AccelSpeed = 7
		self.CanBack = false
		self.CanRoll = true
		self.CanStrafe = false
		self.CanStandby = true
		self.CanShoot = true
		self.FireDelay = 0.3
		self.OverheatAmount = 20
		self.DontOverheat = false
		self.Cooldown = 2
		self.NextBlast = 1;
		self.Bullet = CreateBulletStructure(50, "blue")

		self.ExitModifier = {
			x = 0,
			y = -400,
			z = 0
		}

		self.BaseClass.Initialize(self)
	end

	function ENT:Enter(p)
		self:SetNWBool("InShip", true)
		self.BaseClass.Enter(self, p)
	end

	function ENT:Exit(kill)
		self.IsFPV = false
		self:SetNWBool("InShip", false)
		self.BaseClass.Exit(self, kill)
	end
    
	function ENT:Think()
 
    if(self.Inflight) then
        if(IsValid(self.Pilot)) then
            if(IsValid(self.Pilot)) then 
                if(self.Pilot:KeyDown(IN_ATTACK2) and self.NextUse.FireBlast < CurTime()) then
                    self.BlastPositions = {
                        self:GetPos() + self:GetForward() * -20 + self:GetRight() * 0 + self:GetUp() * -20, //1
						self:GetPos() + self:GetForward() * -20 + self:GetRight() * 0 + self:GetUp() * -20, //2
						self:GetPos() + self:GetForward() * -20 + self:GetRight() * 0 + self:GetUp() * -20, //3
						self:GetPos() + self:GetForward() * -20 + self:GetRight() * 0 + self:GetUp() * -20, //4
						self:GetPos() + self:GetForward() * -20 + self:GetRight() * 0 + self:GetUp() * -20, //5
						self:GetPos() + self:GetForward() * -20 + self:GetRight() * 0 + self:GetUp() * -20, //6
                    }
                    self:FirentbbomberBlast(self.BlastPositions[self.NextBlast],true,0.9,600,false,20);
					self.NextBlast = self.NextBlast + 1;
					if(self.NextBlast == 7) then
						self.NextUse.FireBlast = CurTime()+5;
						self:SetNWBool("OutOfMissiles",true);
						self:SetNWInt("FireBlast",self.NextUse.FireBlast)
						self.NextBlast = 1;
					end
                end
			end
		end
		
		if(self.NextUse.FireBlast < CurTime()) then
			self:SetNWBool("OutOfMissiles",false);
		end
        self:SetNWInt("Overheat",self.Overheat);
        self:SetNWBool("Overheated",self.Overheated);
    end
    self.BaseClass.Think(self);
    end

    function ENT:FirentbbomberBlast(pos,gravity,vel,dmg,white,size,snd)
	if(self.NextUse.FireBlast < CurTime()) then
		local e = ents.Create("cannon_blast");
		
		e.Damage = dmg or 600;
		e.IsWhite = white or false;
		e.StartSize = 30;
		e.EndSize = 5;
		
		
		local sound = snd or Sound("weapons/ywing_bomb.wav");
		
		e:SetPos(pos);
		e:Spawn();
		e:Activate();
		e:Prepare(self,sound,gravity,vel);
		e:SetColor(Color(255,255,255,1));
	end
    end
end

if CLIENT then
	function ENT:SpawnCockpit()
		self.Cockpit = ents.CreateClientProp()
		self.Cockpit:SetModel("models/ywing/ywing_cockpit_b.mdl")
		self.Cockpit:SetPos(self:GetPos())
		self.Cockpit:SetAngles(self:GetAngles())
		self.Cockpit:Spawn()
		self.Cockpit:SetParent(self)
		self.Cockpit:SetNoDraw(true)
	end

	function ENT:Remove()
		if IsValid(self.Cockpit) then
			self.Cockpit:Remove()
		end

		self.BaseClass.Remove(self)
	end

	function ENT:Draw()
		if self.IsFPV and self:GetNWBool("InShip",false) then
			if not IsValid(self.Cockpit) then
				self:SpawnCockpit()
			else
				self.Cockpit:DrawModel()
			end
		else
			self:DrawModel()
		end
	end

	ENT.CanFPV = true
	ENT.EnginePos = {}
	ENT.ViewDistance = 800;
    ENT.ViewHeight = 200;
    ENT.FPVPos = Vector(245,0,88);

	ENT.Sounds = {
		Engine = Sound("vehicles/ywing_eng_loop.wav"),
	}

	function ENT:FlightEffects()
		local normal = -self:GetForward()
		local roll = math.Rand(-90, 90)
		local id = self:EntIndex()
		self.EnginePos = {self:GetPos() + self:GetForward() * -230 + self:GetRight() * 190 + self:GetUp() * 40, self:GetPos() + self:GetForward() * -230 + self:GetRight() * -190 + self:GetUp() * 40}

		for k, v in pairs(self.EnginePos) do
			local blue = self.FXEmitter:Add("sprites/bluecore", v)
			blue:SetVelocity(normal)
			blue:SetDieTime(0.1)
			blue:SetStartAlpha(155)
			blue:SetEndAlpha(5)
			blue:SetStartSize(45)
			blue:SetEndSize(15)
			blue:SetRoll(roll)
			blue:SetColor(250, 85, 247)
		end
	end

	function ENT:Think()
		self.BaseClass.Think(self)
		local Flying = self:GetNWBool("Flying" .. self.Vehicle)
		local TakeOff = self:GetNWBool("TakeOff")
		local Land = self:GetNWBool("Land")

		if Flying then
			if not (TakeOff or Land) then
				self:FlightEffects()
			end

			if LocalPlayer():KeyDown(IN_WALK) and self.NextView < CurTime() then
				self.IsFPV = not self.IsFPV
				self.NextView = CurTime() + 1
			end
		end
	end

	hook.Add("HUDPaint", "ntbbomberReticle", function()
		local ship = LocalPlayer():GetNWEntity("ntbbomber")

		if LocalPlayer():GetNWBool("Flyingntbbomber") and IsValid(ship) then
			SW_HUD_DrawHull(1500)
			SW_WeaponReticles(ship)
			SW_HUD_DrawOverheating(ship)
			SW_BlastIcon(ship,5)
			SW_HUD_Compass(ship, ScrW() / 2, ScrH() * 0.775)
			SW_HUD_DrawSpeedometer()
		end
	end)
end