ENT.Base = "swvr_base"

ENT.Category = "Empire"
ENT.Class = "Fighter"

ENT.PrintName = "TIE Avenger"
ENT.Author = "Nashatok"

if SERVER then
    AddCSLuaFile()

    function ENT:SpawnFunction(ply, tr, ClassName)
        if not tr.Hit then
            return
        end

        local ent = ents.Create(ClassName)
        ent:SetPos(tr.HitPos + Vector(0, 0, 30)) -- Third number controls height. Negative equals down, postive equals up.
        ent:SetAngles(Angle(0, ply:GetAimVector():Angle().Yaw, 0))
        ent:Spawn()
        ent:Activate()

        return ent
    end

    function ENT:Initialize()
        self:Setup({
            Model = "models/sfp_tieavenger/sfp_tieavenger.mdl",
            Health = 1500,
            Speed = 1250,
            Shields = 1000,
            BoostSpeed = 2500,
            VerticalSpeed = 600,
            Acceleration = 8,
            Roll = true,
            LandVector = Vector(0, 0, 0) -- Third number is up/down. 
        })

        self:AddWeaponGroup("Pilot", "ls1_cannon", {
            Delay = 0.18,
            Damage = 20,
            CanOverheat = true,
            MaxOverheat = 15,
			Tracer = "green_tracer_fx"
        })

        self:AddWeapon("Pilot", "Left", Vector(215, -105, 120))
        self:AddWeapon("Pilot", "Right", Vector(215, 105, 120))
        self:AddWeapon("Pilot", "Left2", Vector(215, -105, 55))
        self:AddWeapon("Pilot", "Right2", Vector(215, 105, 55))

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
            EngineSound = "vehicles/tie/tie_interceptor4.wav",
            ViewDistance = 600,
            ViewHeight = 350
        })

        self:SetupDefaults()

        self:AddEngine(Vector(-150, 35, 95), {
            StartSize = 8,
            EndSize = 3,
            Lifetime = 10,
            Color = Color(150, 20, 20),
            Sprite = "sprites/orangecore1"
        })
        self:AddEngine(Vector(-150, -35, 95), {
            StartSize = 8,
            EndSize = 3,
            Lifetime = 10,
            Color = Color(150, 20, 20),
            Sprite = "sprites/orangecore1"
        })
        self:AddEngine(Vector(-150, 35, 85), {
            StartSize = 8,
            EndSize = 3,
            Lifetime = 10,
            Color = Color(150, 20, 20),
            Sprite = "sprites/orangecore1"
        })
        self:AddEngine(Vector(-150, -35, 85), {
            StartSize = 8,
            EndSize = 3,
            Lifetime = 10,
            Color = Color(150, 20, 20),
            Sprite = "sprites/orangecore1"
        })

        self.BaseClass.Initialize(self)
    end
end
