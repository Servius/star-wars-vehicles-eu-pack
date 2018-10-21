ENT.Base = "swvr_base"

ENT.Category = "Independent"
ENT.Class = "Fighter"

ENT.PrintName = "Kimogila Heavy Fighter"
ENT.Author = "Nashatok"

if SERVER then
  AddCSLuaFile()

  function ENT:SpawnFunction(ply, tr, ClassName)
    if not tr.Hit then
      return
    end

    local ent = ents.Create(ClassName)
    ent:SetPos(tr.HitPos + tr.HitNormal * 5)
    ent:SetAngles(Angle(0, ply:GetAimVector():Angle().Yaw, 0))
    ent:Spawn()
    ent:Activate()

    return ent
  end

  function ENT:Initialize()
    self:Setup({
      Model = "models/sfp_kimogila/sfp_kimogila.mdl",
      Health = 2500,
      Speed = 1000,
	  Shields = 1250,
      BoostSpeed = 2000,
      VerticalSpeed = 550,
      Acceleration = 6,
      Roll = false,
    })

    self:AddWeaponGroup("Pilot", "gn40_cannon", {
      Delay = 0.2,
      Damage = 30,
      Tracer = "red_tracer_fx",
      CanOverheat = true,
      MaxOverheat = 20
    })

    self:AddWeapon("Pilot", "MainR", Vector(71, 410, 147))
    self:AddWeapon("Pilot", "MainL", Vector(71, -410, 147))
    self:AddWeapon("Pilot", "LeftC", Vector(462, 36, 70))
    self:AddWeapon("Pilot", "RightC", Vector(462, -36, 70))

    self:AddPilot(nil, nil, {
      FPVPos = Vector(350, 0, 140),
      Weapons = { "Pilot",},
      ExitPos = Vector(450, 170, 20)
    })

    self.BaseClass.Initialize(self)
  end
end

if CLIENT then
  function ENT:Initialize()
    self:Setup({
      EngineSound = "vehicles/slave1_fly_loop.wav",
      ViewDistance = 500,
      ViewHeight = 300
    })

    self:SetupDefaults()

    self:AddEngine(Vector(-420, 0, 120), {
      StartSize = 150,
      EndSize = 50,
      Lifetime = 4,
      Color = Color(150, 100, 0),
      Sprite = "sprites/heatwave"
    })

    self.BaseClass.Initialize(self)
  end
end
