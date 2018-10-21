ENT.Base = "swvr_base"

ENT.Category = "CIS"
ENT.Class = "Bomber"

ENT.PrintName = "Advanced Droid Bomber"
ENT.Author = "Nashatok"

if SERVER then
    AddCSLuaFile()

    function ENT:SpawnFunction(ply, tr, ClassName)
        if not tr.Hit then
            return
        end

        local ent = ents.Create(ClassName)
        ent:SetPos(tr.HitPos + Vector(0, 0, 100)) -- Third number controls height. Negative equals down, postive equals up.
        ent:SetAngles(Angle(0, ply:GetAimVector():Angle().Yaw, 0))
        ent:Spawn()
        ent:Activate()

        return ent
    end

    function ENT:Initialize()
        self:Setup({
            Model = "models/sfp_droidbomber/sfp_droidbomber.mdl",
            Health = 1500,
            Speed = 1000,
            BoostSpeed = 2500,
            VerticalSpeed = 600,
            Acceleration = 8,
            Roll = false,
            LandVector = Vector(0, 0, 20) -- Third number is up/down. 
        })

        self:AddWeaponGroup("Pilot", "ls1_cannon", {
            Delay = 0.35,
            Damage = 50,
            CanOverheat = true,
			MaxOverheat = 15,
        })

        self:AddWeapon("Pilot", "LeftB", Vector(60, -156, 38))
        self:AddWeapon("Pilot", "RightB", Vector(60, 156, 38))
        self:AddWeapon("Pilot", "LeftT", Vector(60, -156, 54))
        self:AddWeapon("Pilot", "RightT", Vector(60, 156, 54))
		
		self:AddWeaponGroup("Missile", "swvr_base_missile", {
			Delay = 1.5,
			Damage = 40,
		})
		
		self:AddWeapon("Missile", "Left", Vector(100, 56, 50))
		self:AddWeapon("Missile", "Right", Vector(100, -56, 50))
		
        self:AddPilot(nil, nil, {
            Weapons = { "Pilot", "Missile"},
            ExitPos = Vector(260, 200, 60)
        })

        self.BaseClass.Initialize(self)
    end
end

if CLIENT then
    function ENT:Initialize()
        self:Setup({
            EngineSound = "vehicles/droid/droid_fly.wav",
            ViewDistance = 280,
            ViewHeight = 170
        })

        self:SetupDefaults()
/*
        self:AddEngine(Vector(-250, 110, 120), {
            StartSize = 30,
            EndSize = 15,
            Lifetime = 2.7,
            Color = Color(20, 120, 215),
            Sprite = "sprites/bluecore"
        })

        self:AddEngine(Vector(-250, -110, 120), {
            StartSize = 30,
            EndSize = 15,
            Lifetime = 2.7,
            Color = Color(20, 120, 215),
            Sprite = "sprites/bluecore"
        })*/

        self.BaseClass.Initialize(self)
    end
end
