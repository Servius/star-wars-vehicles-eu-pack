ENT.Base = "swvr_base"

ENT.Category = "Empire"
ENT.Class = "Fighter"

ENT.PrintName = "TIE M1 'Bizarro'"
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
            Model = "models/sfp_tiebizarro/sfp_tiebizarro.mdl",
            Health = 1500,
            Speed = 1250,
            Shields = 1000,
            BoostSpeed = 2500,
            VerticalSpeed = 600,
            Acceleration = 8,
            Roll = false,
            LandVector = Vector(0, 0, 0) -- Third number is up/down. 
        })

        self:AddWeaponGroup("Pilot", "ms4_cannon", {
            Delay = 1,
            Damage = 250,
            CanOverheat = false,
            MaxOverheat = 10,
			Tracer = "green_tracer_fx"
        })

        self:AddWeapon("Pilot", "Main", Vector(130, -130, 180))

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

        self:AddEngine(Vector(-245, 0, 60), {
            StartSize = 1,
            EndSize = 10,
            Lifetime = 10,
            Color = Color(150, 20, 20),
            Sprite = "sprites/orangecore1"
        })

        self.BaseClass.Initialize(self)
    end
end
