ENT.Base = "swvr_base"

ENT.Category = "CIS"
ENT.Class = "Fighter"

ENT.PrintName = "Vulture-class starfighter"
ENT.Author = "Servius"

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
            Model = "models/ship_vulture/vulture_yellow_servius.mdl",
            Health = 1500,
            Speed = 1250,
            Shields = 1000,
            BoostSpeed = 2500,
            VerticalSpeed = 600,
            Acceleration = 8,
            Roll = true,
            LandVector = Vector(0, 0, 60) -- Third number is up/down. 
        })

        self:AddWeaponGroup("Pilot", "ls1_cannon", {
            Delay = 0.2,
            Damage = 75,
            CanOverheat = true,
            MaxOverheat = 20
        })

        self:AddWeapon("Pilot", "BottomLeft", Vector(150, -75, 30))
        self:AddWeapon("Pilot", "BottomRight", Vector(150, 75, 30))
        self:AddWeapon("Pilot", "TopLeft", Vector(150, -75, 30))
        self:AddWeapon("Pilot", "TopRight", Vector(150, 75, 30))

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


        self.BaseClass.Initialize(self)
    end
end
