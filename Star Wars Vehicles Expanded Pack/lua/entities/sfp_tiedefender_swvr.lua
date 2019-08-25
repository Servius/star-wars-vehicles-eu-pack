ENT.Base = "swvr_base"

ENT.Category = "Empire"
ENT.Class = "Fighter"

ENT.PrintName = "TIE/D 'Defender'"
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
            Model = "models/sfp_tiedefender/sfp_tiedefender.mdl",
            Health = 2000,
            Speed = 1500,
            Shields = 500,
            BoostSpeed = 3000,
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

        self:AddWeapon("Pilot", "Right", Vector(195, -80, 95))
        self:AddWeapon("Pilot", "Left", Vector(195, 80, 95))
        self:AddWeapon("Pilot", "Right2", Vector(195, -120, 160))
        self:AddWeapon("Pilot", "Left2", Vector(195, 120, 160))
		
        self:AddWeaponGroup("Ion", "ls1_cannon", {
            Delay = 0.2,
            Damage = 50,
            CanOverheat = true,
            MaxOverheat = 20,
			Tracer = "blue_tracer_fx"
        })

        self:AddWeapon("Ion", "LeftT", Vector(195, -40, 300))
        self:AddWeapon("Ion", "RightT", Vector(195, 40, 300))

        self:AddPilot(nil, nil, {
            Weapons = { "Pilot", "Ion"},
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

        self:AddEngine(Vector(-95, 0, 208), {
            StartSize = 3,
            EndSize = 1,
            Lifetime = 10,
            Color = Color(150, 20, 20),
            Sprite = "sprites/orangecore1"
        })
        self:AddEngine(Vector(-95, 20, 173), {
            StartSize = 3,
            EndSize = 1,
            Lifetime = 10,
            Color = Color(150, 20, 20),
            Sprite = "sprites/orangecore1"
        })
        self:AddEngine(Vector(-95, -20, 173), {
            StartSize = 3,
            EndSize = 1,
            Lifetime = 10,
            Color = Color(150, 20, 20),
            Sprite = "sprites/orangecore1"
        })

        self.BaseClass.Initialize(self)
    end
end
