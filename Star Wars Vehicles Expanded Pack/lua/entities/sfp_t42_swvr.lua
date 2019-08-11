ENT.Base = "swvr_base"

ENT.Category = "Independent"
ENT.Class = "Fighter"

ENT.PrintName = "T-42 F-Wing"
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
            Model = "models/sfp_t42/sfp_t42.mdl",
            Health = 1500,
            Speed = 1250,
            Shields = 1000,
            BoostSpeed = 2500,
            VerticalSpeed = 600,
            Acceleration = 8,
            Roll = true,
            LandVector = Vector(0, 0, 0) -- Third number is up/down. 
        })

        self:AddWeaponGroup("Pilot", "kx5_cannon", {
            Delay = 0.4,
            Damage = 50,
            CanOverheat = true,
            MaxOverheat = 20,
			Tracer = "red_tracer_fx"
        })

        self:AddWeapon("Pilot", "Left", Vector(220, -45, 85))
        self:AddWeapon("Pilot", "Right", Vector(220, 45, 85))
        self:AddWeapon("Pilot", "Left2", Vector(220, -45, 58))
        self:AddWeapon("Pilot", "Right2", Vector(220, 45, 58))

        self:AddPilot(nil, nil, {
            Weapons = { "Pilot",},
            ExitPos = Vector(-200, -150, 0)
        })

        self.BaseClass.Initialize(self)
    end
end

if CLIENT then
    function ENT:Initialize()
        self:Setup({
            EngineSound = "vehicles/xwing/xwing_fly2.wav",
            ViewDistance = 600,
            ViewHeight = 350
        })

        self:SetupDefaults()

        self:AddEngine(Vector(-270, 60, 120), {
            StartSize = 12,
            EndSize = 5,
            Lifetime = 10,
            Color = Color(150, 20, 20),
            Sprite = "sprites/orangecore1"
        })
		
		self:AddEngine(Vector(-270, -60, 120), {
            StartSize = 12,
            EndSize = 5,
            Lifetime = 10,
            Color = Color(150, 20, 20),
            Sprite = "sprites/orangecore1"
        })
		
		self:AddEngine(Vector(-270, 60, 38), {
            StartSize = 12,
            EndSize = 5,
            Lifetime = 10,
            Color = Color(150, 20, 20),
            Sprite = "sprites/orangecore1"
        })
		
		self:AddEngine(Vector(-270, -60, 38), {
            StartSize = 12,
            EndSize = 5,
            Lifetime = 10,
            Color = Color(150, 20, 20),
            Sprite = "sprites/orangecore1"
        })
		
		self:AddEngine(Vector(-270, 0, 25), {
            StartSize = 12,
            EndSize = 5,
            Lifetime = 10,
            Color = Color(150, 20, 20),
            Sprite = "sprites/orangecore1"
        })

        self.BaseClass.Initialize(self)
    end
end
