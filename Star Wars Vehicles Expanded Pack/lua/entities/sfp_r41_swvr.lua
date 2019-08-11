ENT.Base = "swvr_base"

ENT.Category = "Rebels"
ENT.Class = "Fighter"

ENT.PrintName = "R-41 Starchaser"
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
            Model = "models/sfp_r41/sfp_r41.mdl",
            Health = 1500,
            Speed = 1250,
            Shields = 1000,
            BoostSpeed = 3000,
            VerticalSpeed = 600,
            Acceleration = 8,
            Roll = true,
            LandVector = Vector(0, 0, 0) -- Third number is up/down. 
        })

        self:AddWeaponGroup("Pilot", "kx5_cannon", {
            Delay = 0.2,
            Damage = 40,
            CanOverheat = true,
            MaxOverheat = 20,
			Tracer = "red_tracer_fx"
        })

        self:AddWeapon("Pilot", "Left", Vector(200, -85, 40))
        self:AddWeapon("Pilot", "Right", Vector(200, 87, 40))
		
        self:AddWeaponGroup("Ion", "kx5_cannon", {
            Delay = 0.2,
            Damage = 40,
            CanOverheat = true,
            MaxOverheat = 20,
			Ion = true,
			Tracer = "blue_tracer_fx"
        })

        self:AddWeapon("Ion", "Left2", Vector(0, -215, 12))
        self:AddWeapon("Ion", "Right2", Vector(0, 215, 12))

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
            EngineSound = "vehicles/xwing/xwing_fly2.wav",
            ViewDistance = 550,
            ViewHeight = 300
        })

        self:SetupDefaults()

        self:AddEngine(Vector(-270, 25, 41), {
            StartSize = 18,
            EndSize = 5,
            Lifetime = 10,
            Color = Color(150, 20, 20),
            Sprite = "sprites/orangecore1"
        })
        self:AddEngine(Vector(-270, -30, 41), {
            StartSize = 18,
            EndSize = 5,
            Lifetime = 10,
            Color = Color(150, 20, 20),
            Sprite = "sprites/orangecore1"
        })
        self:AddEngine(Vector(-258, 70, 63), {
            StartSize = 15,
            EndSize = 5,
            Lifetime = 10,
            Color = Color(150, 20, 20),
            Sprite = "sprites/orangecore1"
        })
        self:AddEngine(Vector(-258, -73, 63), {
            StartSize = 15,
            EndSize = 5,
            Lifetime = 10,
            Color = Color(150, 20, 20),
            Sprite = "sprites/orangecore1"
        })

        self.BaseClass.Initialize(self)
    end
end
