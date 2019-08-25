ENT.Base = "swvr_base"

ENT.Category = "Rebels"
ENT.Class = "Fighter"

ENT.PrintName = "Planetary Fighter"
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
            Model = "models/sfp_planetary/sfp_planetary.mdl",
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
            Delay = 0.2,
            Damage = 50,
            CanOverheat = true,
            MaxOverheat = 20,
			Tracer = "red_tracer_fx"
        })

        self:AddWeapon("Pilot", "Left", Vector(510, -25, 185))
        self:AddWeapon("Pilot", "Right", Vector(510, 25, 185))

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
            ViewHeight = 400
        })

        self:SetupDefaults()

        self:AddEngine(Vector(-340, -50, 120), {
            StartSize = 38,
            EndSize = 8,
            Lifetime = 10,
            Color = Color(100, 100, 200),
            Sprite = "sprites/bluecore"
        })
        self:AddEngine(Vector(-340, 50, 120), {
            StartSize = 38,
            EndSize = 8,
            Lifetime = 10,
            Color = Color(100, 100, 200),
            Sprite = "sprites/bluecore"
        })
        self:AddEngine(Vector(-340, -50, 220), {
            StartSize = 38,
            EndSize = 8,
            Lifetime = 10,
            Color = Color(100, 100, 200),
            Sprite = "sprites/bluecore"
        })
        self:AddEngine(Vector(-340, 50, 220), {
            StartSize = 38,
            EndSize = 8,
            Lifetime = 10,
            Color = Color(100, 100, 200),
            Sprite = "sprites/bluecore"
        })

        self.BaseClass.Initialize(self)
    end
end
