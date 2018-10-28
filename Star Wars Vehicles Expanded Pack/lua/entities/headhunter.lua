ENT.Base = "swvr_base"

ENT.Category = "Republic"
ENT.Class = "Fighter"

ENT.PrintName = "Z-95 Headhunter"
ENT.Author = "Doctor Jew,Bridge"

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
            Model = "models/cloneheadhunter/rep_z95_servius.mdl",
            Health = 1500,
            Speed = 1250,
            BoostSpeed = 2500,
            VerticalSpeed = 600,
            Acceleration = 8,
            Roll = true,
        })

        self:AddWeaponGroup("Pilot", "kx5_cannon", {
            Delay = 0.2,
            Damage = 85,
            CanOverheat = true,
            MaxOverheat = 20
        })

        self:AddWeapon("Pilot", "Left", Vector(10, -350, 40))
        self:AddWeapon("Pilot", "Right", Vector(-30, 350, 40))

        self:AddPilot(nil, nil, {
            Weapons = { "Pilot" },
            ExitPos = Vector(0, -325, 100)
        })

        self.BaseClass.Initialize(self)
    end
end

if CLIENT then
    function ENT:Initialize()
        self:Setup({
            EngineSound = "ywing_engine_loop",
            ViewDistance = 800,
            ViewHeight = 200
        })

        self:SetupDefaults()

        self:AddEngine(Vector(-295, 99, 40), {
            StartSize = 20,
            EndSize = 13.5,
            Lifetime = 2.7,
            Color = Color(150, 100, 0),
            Sprite = "sprites/orangecore1"
        })

        self:AddEngine(Vector(-295, -99, 40), {
            StartSize = 20,
            EndSize = 13.5,
            Lifetime = 2.7,
            Color = Color(150, 100, 0),
            Sprite = "sprites/orangecore1"
        })

        
           
           
           
          
           
        

        
            
           
           
            
       

        self.BaseClass.Initialize(self)
    end
end
