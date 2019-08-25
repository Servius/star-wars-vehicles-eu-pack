ENT.Base = "swvr_base"

ENT.Category = "Empire"
ENT.Class = "Bomber"

ENT.PrintName = "Scimitar Assault Bomber"
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
            Model = "models/sfp_scimitar/sfp_scimitar.mdl",
            Health = 1500,
            Speed = 1250,
            Shields = 1000,
            BoostSpeed = 2000,
            VerticalSpeed = 400,
            Acceleration = 8,
            Roll = false,
            LandVector = Vector(0, 0, 0) -- Third number is up/down. 
        })

        self:AddWeaponGroup("Pilot", "ls1_cannon", {
            Delay = 0.35,
            Damage = 65,
            CanOverheat = true,
            MaxOverheat = 20,
			Tracer = "green_tracer_fx"
        })

        self:AddWeapon("Pilot", "Left", Vector(550, -15, 80))
        self:AddWeapon("Pilot", "Right", Vector(550, 15, 80))

        self:AddPilot(nil, nil, {
            Weapons = { "Pilot",},
            ExitPos = Vector(-200, -350, 0)
        })

        self.BaseClass.Initialize(self)
    end
end

if CLIENT then
    function ENT:Initialize()
        self:Setup({
            EngineSound = "vehicles/tie/tie_new.wav",
            ViewDistance = 800,
            ViewHeight = 450
        })

        self:SetupDefaults()

        self:AddEngine(Vector(-190, 123, 130), {
            StartSize = 10,
            EndSize = 4,
            Lifetime = 10,
            Color = Color(150, 20, 20),
            Sprite = "sprites/orangecore1"
        })
		
		self:AddEngine(Vector(-190, -123, 130), {
            StartSize = 10,
            EndSize = 4,
            Lifetime = 10,
            Color = Color(150, 20, 20),
            Sprite = "sprites/orangecore1"
        })

        self.BaseClass.Initialize(self)
    end
end
