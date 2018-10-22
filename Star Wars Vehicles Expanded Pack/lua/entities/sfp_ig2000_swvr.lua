ENT.Base = "swvr_base"

ENT.Category = "Independent"
ENT.Class = "Fighter"

ENT.PrintName = "IG-2000 Starfighter"
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
            Model = "models/sfp_ig2000/sfp_ig2000.mdl",
            Health = 1500,
            Speed = 1250,
            Shields = 1000,
            BoostSpeed = 2500,
            VerticalSpeed = 600,
            Acceleration = 8,
            Roll = true,
            LandVector = Vector(0, 0, 0) -- Third number is up/down. 
        })

        self:AddWeaponGroup("Pilot", "ms4_cannon", {
            Delay = 0.2,
            Damage = 75,
            CanOverheat = true,
            MaxOverheat = 20,
			Tracer = "red_tracer_fx"
        })

        self:AddWeapon("Pilot", "Left", Vector(250, -90, 100))
        self:AddWeapon("Pilot", "Right", Vector(250, 90, 100))
		
		self:AddWeaponGroup("Center", "kx5_cannon",  {
			Delay = .6,
			Damage = 120,
			CanOverheat = true,
			MaxOverheat = 5,
			Cooldown = 20
		})
		
		self:AddWeapon("Ion Cannon", "Center", Vector(150, 0, 65))

        self:AddPilot(nil, nil, {
            Weapons = { "Pilot", "Center"},
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

        self:AddEngine(Vector(-245, 0, 60), {
            StartSize = 20,
            EndSize = 15,
            Lifetime = 2.7,
            Color = Color(150, 100, 0),
            Sprite = "sprites/orangecore1"
        })

        self.BaseClass.Initialize(self)
    end
end
