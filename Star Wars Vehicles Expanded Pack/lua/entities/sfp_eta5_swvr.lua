ENT.Base = "swvr_base"

ENT.Category = "Empire"
ENT.Class = "Interceptor"

ENT.PrintName = "ETA-5 Starfighter"
ENT.Author = "Nashatok"

if SERVER then
  AddCSLuaFile()

  function ENT:SpawnFunction(ply, tr, ClassName)
    if not tr.Hit then
      return
    end

    local ent = ents.Create(ClassName)
    ent:SetPos(tr.HitPos + Vector(0, 0, 10))
    ent:SetAngles(Angle(0, ply:GetAimVector():Angle().Yaw, 0))
    ent:Spawn()
    ent:Activate()

    return ent
  end

  function ENT:Initialize()
    self:Setup({
      Model = "models/sfp_eta5/sfp_eta5.mdl",
      Health = 1000,
      Shields = 250,
      Speed = 2000,
      BoostSpeed = 3000,
      VerticalSpeed = 550,
      Acceleration = 8,
      Roll = true
    })

    self:AddWeaponGroup("Pilot", "ls1_cannon", {
      Delay = 0.1,
      Damage = 25,
      Tracer = "green_tracer_fx",
      CanOverheat = true,
      MaxOverheat = 25,
	  Cooldown = 5,
    })

    self:AddWeapon("Pilot", "Left", Vector(260, -23, 163))
    self:AddWeapon("Pilot", "Right", Vector(260, 23, 163))

    self:AddPilot(nil, nil, {
      FPVPos = Vector(-20, 0, 185),
      Weapons = { "Pilot" },
      ExitPos = Vector(-250, 0, 20)
    })

    self.BaseClass.Initialize(self)
  end
end

if CLIENT then
  function ENT:Initialize()
    self:Setup({
      EngineSound = "vehicles/eta/eta_fly.wav",
      ViewDistance = 400,
      ViewHeight = 350
    })


    self:AddEngine(Vector(-280, 23, 187), {
      StartSize = 15,
      EndSize = 10,
      Lifetime = 1,
      Color = Color(255, 255, 255),
      Sprite = "sprites/bluecore"
    })

    self:AddEngine(Vector(-280, -23, 187), {
      StartSize = 15,
      EndSize = 10,
      Lifetime = 1,
      Color = Color(255, 255, 255),
      Sprite = "sprites/bluecore"
    })

    self.BaseClass.Initialize(self)
  end
end
