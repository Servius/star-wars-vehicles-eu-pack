ENT.Base = "swvr_base"

ENT.Category = "Independent"
ENT.Class = "Interceptor"

ENT.PrintName = "M3-A Scyk Fighter"
ENT.Author = "Nashatok"

if SERVER then
    AddCSLuaFile()

    function ENT:SpawnFunction(ply, tr, ClassName)
        if not tr.Hit then
            return
        end

        local ent = ents.Create(ClassName)
        ent:SetPos(tr.HitPos + Vector(0, 0, 5)) -- Third number controls height. Negative equals down, postive equals up.
        ent:SetAngles(Angle(0, ply:GetAimVector():Angle().Yaw, 0))
        ent:Spawn()
        ent:Activate()

        return ent
    end

    function ENT:Initialize()
        self:Setup({
            Model = "models/sfp_scyk/sfp_scyk.mdl",
            Health = 1500,
            Speed = 2000,
            Shields = 1000,
            BoostSpeed = 3500,
            VerticalSpeed = 900,
            Acceleration = 8,
            Roll = true,
            LandVector = Vector(0, 0, 0) -- Third number is up/down. 
        })

        self:AddWeaponGroup("Pilot", "gn40_cannon", {
            Delay = 0.12,
            Damage = 30,
            CanOverheat = true,
            MaxOverheat = 25,
			Tracer = "red_tracer_fx"
        })

        self:AddWeapon("Pilot", "Left", Vector(130, -60, 115))
        self:AddWeapon("Pilot", "Right", Vector(130, 60, 115))

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
            ViewDistance = 500,
            ViewHeight = 250
        })

        self:SetupDefaults()

        self:AddEngine(Vector(-275, 0, 80), {
            StartSize = 50,
            EndSize = 20,
            Lifetime = 10,
            Color = Color(150, 20, 20),
            Sprite = "sprites/heatwave"
        })

        self.BaseClass.Initialize(self)
    end
end
