ENT.Base = "swvr_base"

ENT.Category = "CIS"
ENT.Class = "Fighter"

ENT.PrintName = "Belbullab-22 Starfighter"
ENT.Author = "Servius"

if SERVER then
    AddCSLuaFile()

    function ENT:SpawnFunction(ply, tr, ClassName)
        if not tr.Hit then
            return
        end

        local ent = ents.Create(ClassName)
        ent:SetPos(tr.HitPos)
        ent:SetAngles(Angle(0, ply:GetAimVector():Angle().Yaw, 0))
        ent:Spawn()
        ent:Activate()

        return ent
    end

    function ENT:Initialize()
        self:Setup({
            Model = "models/ship_belbu/ship_belbu_servius.mdl",
            Health = 1500,
            Speed = 1250,
            Shields = 1000,
            BoostSpeed = 2500,
            VerticalSpeed = 600,
            Acceleration = 8,
            Roll = true,
        })

        self:AddWeaponGroup("Pilot", "ls1_cannon", {
            Delay = 0.2,
            Damage = 75,
            CanOverheat = true,
            MaxOverheat = 20
        })

        self:AddWeapon("Pilot", "Left", Vector(150, -75, 30))
        self:AddWeapon("Pilot", "Right", Vector(150, 75, 30))

        self:AddPilot(nil, nil, {
            Weapons = { "Pilot" },
            ExitPos = Vector(-200, -150, 0)
        })

        self.BaseClass.Initialize(self)
    end
end

if CLIENT then
    function ENT:Initialize()
        self:Setup({
            EngineSound = "vehicles/droid/droid_fly.wav",
            ViewDistance = 800,
            ViewHeight = 150
        })

        self:SetupDefaults()

        self:AddEngine(Vector(-190, 35, 0), {
            StartSize = 15,
            EndSize = 13.5,
            Lifetime = 2.7,
            Color = Color(150, 100, 0),
            Sprite = "sprites/orangecore1"
        })

        self:AddEngine(Vector(-190, -35, 0), {
            StartSize = 15,
            EndSize = 13.5,
            Lifetime = 2.7,
            Color = Color(150, 100, 0),
            Sprite = "sprites/orangecore1"
        })

        self.BaseClass.Initialize(self)
    end
end
