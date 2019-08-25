--WIP until Missiles/Torpedoes are ready.

ENT.Base = "swvr_base"

ENT.Category = "Empire"
ENT.Class = "Bomber"

ENT.PrintName = "TIE/IT Interdictor"
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
            Model = "models/sfp_tieinterdictor/sfp_tieinterdictor.mdl",
            Health = 2500,
            Speed = 1000,
            BoostSpeed = 1700,
            VerticalSpeed = 400,
            Acceleration = 15,
            Roll = true,
            LandVector = Vector(0, 0, 0) -- Third number is up/down. 
        })

        self:AddWeaponGroup("Pilot", "ls1_cannon", {
            Delay = 0.3,
            Damage = 70,
            CanOverheat = true,
            MaxOverheat = 20,
			Tracer = "green_tracer_fx"
        })

        self:AddWeapon("Pilot", "Left", Vector(150, -20, 80))
        self:AddWeapon("Pilot", "Right", Vector(150, 20, 80))

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
            EngineSound = "vehicles/tie/tie_engine.wav",
            ViewDistance = 600,
            ViewHeight = 350
        })

        self:SetupDefaults()

        self:AddEngine(Vector(-145, 38, 120), {
            StartSize = 5,
            EndSize = 2,
            Lifetime = 10,
            Color = Color(150, 20, 20),
            Sprite = "sprites/orangecore1"
        })

        self:AddEngine(Vector(-145, -38, 120), {
            StartSize = 5,
            EndSize = 2,
            Lifetime = 10,
            Color = Color(150, 20, 20),
            Sprite = "sprites/orangecore1"
        })
        self.BaseClass.Initialize(self)
    end
end
