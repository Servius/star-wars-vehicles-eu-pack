ENT.Base = "swvr_base"

ENT.Category = "Rebels"
ENT.Class = "Bomber"

ENT.PrintName = "K-wing Heavy Bomber"
ENT.Author = "Nashatok"

if SERVER then
    AddCSLuaFile()

    function ENT:SpawnFunction(ply, tr, ClassName)
        if not tr.Hit then
            return
        end

        local ent = ents.Create(ClassName)
        ent:SetPos(tr.HitPos + Vector(0, 0, 10)) -- Third number controls height. Negative equals down, postive equals up.
        ent:SetAngles(Angle(0, ply:GetAimVector():Angle().Yaw, 0))
        ent:Spawn()
        ent:Activate()

        return ent
    end

    function ENT:Initialize()
        self:Setup({
            Model = "models/sfp_kwing/sfp_kwing.mdl",
            Health = 1500,
            Speed = 1250,
            Shields = 1000,
            BoostSpeed = 2500,
            VerticalSpeed = 600,
            Acceleration = 8,
            Roll = false,
            LandVector = Vector(0, 0, 0) -- Third number is up/down. 
        })

        self:AddWeaponGroup("Pilot", "kx5_cannon", {
            Delay = 0.2,
            Damage = 50,
            CanOverheat = true,
            MaxOverheat = 20,
			Tracer = "red_tracer_fx"
        })

        self:AddWeapon("Pilot", "Left", Vector(230, -7, 165))
        self:AddWeapon("Pilot", "Right", Vector(230, 7, 165))

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
            ViewDistance = 700,
            ViewHeight = 500
        })

        self:SetupDefaults()

        self:AddEngine(Vector(-450, 0, 240), {
            StartSize = 30,
            EndSize = 10,
            Lifetime = 10,
            Color = Color(250, 100, 100),
            Sprite = "sprites/orangecore1"
        })
		self:AddEngine(Vector(-405, 162, 126), {
            StartSize = 30,
            EndSize = 10,
            Lifetime = 10,
            Color = Color(250, 100, 100),
            Sprite = "sprites/orangecore1"
        })
		self:AddEngine(Vector(-405, -162, 126), {
            StartSize = 30,
            EndSize = 10,
            Lifetime = 10,
            Color = Color(250, 100, 100),
            Sprite = "sprites/orangecore1"
        })

        self.BaseClass.Initialize(self)
    end
end
