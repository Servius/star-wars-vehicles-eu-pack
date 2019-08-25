ENT.Base = "swvr_base"

ENT.Category = "Empire"
ENT.Class = "Bomber"

ENT.PrintName = "TIE M4 'Bomb'"
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
            Model = "models/sfp_tiebomb/sfp_tiebomb.mdl",
            Health = 400,
            Speed = 1250,
            BoostSpeed = 2500,
            VerticalSpeed = 600,
            Acceleration = 8,
            Roll = true,
            LandVector = Vector(0, 0, 0) -- Third number is up/down. 
        })
		
		self:AddWeaponGroup("Pilot", "ls1_cannon", {
            Delay = 0.4,
            Damage = 20,
            CanOverheat = true,
            MaxOverheat = 20,
			Tracer = "green_tracer_fx"
        })

        self:AddWeapon("Pilot", "Front", Vector(200, 0, 175))

        self:AddPilot(nil, nil, {
            Weapons = { "Pilot",},
            ExitPos = Vector(-200, -180, 80)
        })

        self.BaseClass.Initialize(self)
    end
end

if CLIENT then
    function ENT:Initialize()
        self:Setup({
            EngineSound = "vehicles/tie/tie_fly3.wav",
            ViewDistance = 600,
            ViewHeight = 350
        })

        self:SetupDefaults()

        self:AddEngine(Vector(-225, 2, 180), {
            StartSize = 20,
            EndSize = 6,
            Lifetime = 20,
            Color = Color(100, 100, 250),
            Sprite = "sprites/bluecore"
        })

        self.BaseClass.Initialize(self)
    end
end
