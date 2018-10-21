ENT.Base = "swvr_base"

ENT.Category = "Independent"
ENT.Class = "Transport"

ENT.PrintName = "Hover Transport TC9"
ENT.Author = "Servius"

if SERVER then
    AddCSLuaFile()

    function ENT:SpawnFunction(ply, tr, ClassName)
        if not tr.Hit then
            return
        end

        local ent = ents.Create(ClassName)
        ent:SetPos(tr.HitPos + Vector(0, 0, 200)) -- Third number controls height. Negative equals down, postive equals up.
        ent:SetAngles(Angle(0, ply:GetAimVector():Angle().Yaw, 0))
        ent:Spawn()
        ent:Activate()

        return ent
    end

    function ENT:Initialize()
        self:Setup({
            Model = "models/jk3/merccarrier.mdl",
            Health = 1500,
            Speed = 1250,
            Shields = 1000,
            BoostSpeed = 2500,
            VerticalSpeed = 600,
            Acceleration = 8,
            Roll = true,
        })

        self:AddWeaponGroup("Pilot", "kx5_cannon_red", {
            Delay = 0.2,
            Damage = 75,
            CanOverheat = true,
            MaxOverheat = 20
        })

        self:AddWeapon("Pilot", "Left", Vector(450, -135, 110)) -- distance from center, left right, up down.
        self:AddWeapon("Pilot", "Right", Vector(450, 139, 110))



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

    self:AddEngine(Vector(-465, 50, 190), { -- distance from center, left right, up down.
      StartSize = 40,
      EndSize = 13.5,
      Lifetime = 10,
      Color = Color(150, 100, 0),
      Sprite = "sprites/orangecore1"
    })


    self:AddEngine(Vector(-465, -50, 190), {
      StartSize = 40,
      EndSize = 13.5,
      Lifetime = 10,
      Color = Color(150, 100, 0),
      Sprite = "sprites/orangecore1"
    })

        self.BaseClass.Initialize(self)
    end
end
