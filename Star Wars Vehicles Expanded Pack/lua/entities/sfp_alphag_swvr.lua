ENT.Base = "swvr_base"

ENT.Category = "Empire"
ENT.Class = "Bomber"

ENT.PrintName = "Alpha-class NG-1 Star Wing"
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
            Model = "models/sfp_alphag/sfp_alphag.mdl",
            Health = 1500,
            Speed = 1000,
            Shields = 750,
            BoostSpeed = 2500,
            VerticalSpeed = 500,
            Acceleration = 8,
            Roll = false,
            LandVector = Vector(0, 0, 20) -- Third number is up/down. 
        })

        self:AddWeaponGroup("Pilot", "ls1_cannon", {
            Delay = 0.35,
            Damage = 50,
            CanOverheat = true,
			MaxOverheat = 15,
			Tracer = "green_tracer_fx"
        })

        self:AddWeapon("Pilot", "LeftB", Vector(90, -98, 45))
        self:AddWeapon("Pilot", "RightB", Vector(90, 98, 45))
        self:AddWeapon("Pilot", "LeftM", Vector(90, -107, 54))
        self:AddWeapon("Pilot", "RightM", Vector(90, 107, 54))
		self:AddWeapon("Pilot", "LeftT", Vector(78, -5, 138))
		self:AddWeapon("Pilot", "RightT", Vector(78, 5, 138))
		
		self:AddWeaponGroup("Missile", "swvr_base_missile", {
			Delay = 2,
			Damage = 40,
		})
		
		self:AddWeapon("Missile", "Left1", Vector(105, 60, 81))
		self:AddWeapon("Missile", "Right1", Vector(105, -60, 81))
		
        self:AddPilot(nil, nil, {
			FPVPos = Vector(145, 0, 115),
            Weapons = { "Pilot", "Missile"},
            ExitPos = Vector(360, 200, 60)
        })

        self.BaseClass.Initialize(self)
    end
end

if CLIENT then
    function ENT:Initialize()
        self:Setup({
            EngineSound = "vehicles/slave1_fly_loop.wav",
            ViewDistance = 700,
            ViewHeight = 350
        })

        self:SetupDefaults()

        self:AddEngine(Vector(-155, 66, 72), {
            StartSize = 20,
            EndSize = 15,
            Lifetime = 2,
            Color = Color(20, 120, 215),
            Sprite = "sprites/bluecore"
        })

        self:AddEngine(Vector(-155, -66, 72), {
            StartSize = 20,
            EndSize = 15,
            Lifetime = 2,
            Color = Color(20, 120, 215),
            Sprite = "sprites/bluecore"
        })

        self.BaseClass.Initialize(self)
    end
end
