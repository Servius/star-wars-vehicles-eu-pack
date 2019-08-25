ENT.Base = "swvr_base"

ENT.Category = "Empire"
ENT.Class = "Interceptor"

ENT.PrintName = "TIE M5 'Booster'						"
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
            Model = "models/sfp_tiebooster/sfp_tiebooster.mdl",
            Health = 1500,
            Speed = 2500,
            BoostSpeed = 5000,
            VerticalSpeed = 600,
            Acceleration = 8,
            Roll = true,
            LandVector = Vector(0, 0, 0) -- Third number is up/down. 
        })

        self:AddWeaponGroup("Pilot", "ls1_cannon", {
            Delay = 0.2,
            Damage = 50,
            CanOverheat = true,
            MaxOverheat = 20,
			Tracer = "green_tracer_fx"
        })

        self:AddWeapon("Pilot", "Left", Vector(50, -15, 145))
        self:AddWeapon("Pilot", "Right", Vector(50, 15, 145))

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
            EngineSound = "vehicles/tie/tie_new.wav",
            ViewDistance = 600,
            ViewHeight = 350
        })

        self:SetupDefaults()

        self:AddEngine(Vector(-200, 2, 180), {
            StartSize = 15,
            EndSize = 6,
            Lifetime = 20,
            Color = Color(100, 100, 250),
            Sprite = "sprites/bluecore"
        })

        self.BaseClass.Initialize(self)
    end
end
