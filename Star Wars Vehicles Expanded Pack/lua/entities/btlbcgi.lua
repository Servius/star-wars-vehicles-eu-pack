ENT.Base = "swvr_base"

ENT.Category = "Republic"
ENT.Class = "Bomber"

ENT.PrintName = "BTL-B Y-Wing (CGI)"
ENT.Author = "Doctor Jew, Bridge"

if SERVER then
  AddCSLuaFile()

  function ENT:SpawnFunction(ply, tr, ClassName)
    if not tr.Hit then
      return
    end

    local ent = ents.Create(ClassName)
    ent:SetPos(tr.HitPos + Vector(0, 0, 5))
    ent:SetAngles(Angle(0, ply:GetAimVector():Angle().Yaw, 0))
    ent:Spawn()
    ent:Activate()

    return ent
  end

  function ENT:Initialize()
    self:Setup({
      Model = "models/cgiywing/rep_ywinggold_servius.mdl",
      Health = 1500,
      Speed = 1250,
      BoostSpeed = 1500,
      VerticalSpeed = 500,
      Acceleration = 7,
      Roll = true
    })

    self:AddWeaponGroup("Pilot", "rg9_cannon", {
      Delay = 0.2,
      Damage = 85,
      CanOverheat = true,
      MaxOverheat = 10,
      Tracer = "blue_tracer_fx"
    })

    self:AddWeapon("Pilot", "MainR", Vector(250, 25, 43))
    self:AddWeapon("Pilot", "MainL", Vector(250, -13, 43))

    self:AddWeaponGroup("Turret", "proton_torpedo", {
      Delay = 2,
      Damage = 100,
      Tracer = "green_tracer_fx"
    })

    self:AddWeapon("Turret", "Left", Vector(250, 25, 43))
    self:AddWeapon("Turret", "Right", Vector(250, -13, 43))

    
    self:AddPilot(nil, nil, {
      FPVPos = Vector(96, 0, 88),
      Weapons = {"Pilot", "Turret"}
    })

    self.BaseClass.Initialize(self)
  end
end

if CLIENT then
  function ENT:Initialize()
    self:Setup({
      Cockpit = "vgui/ywing_cockpit",
      DrawGlass = true,
      EngineSound = "vehicles/ywing_eng_loop2.wav",
      ViewDistance = 1000,
      ViewHeight = 200
    })

    self:SetupDefaults()

    self:AddEngine(Vector(-430, 150, 43), {
      StartSize = 50,
      EndSize = 13.5,
      Lifetime = 2.7,
      Color = Color(255, 100, 100),
      Sprite = "sprites/orangecore1"
    })

    self:AddEngine(Vector(-430, -137, 43), {
      StartSize = 50,
      EndSize = 13.5,
      Lifetime = 2.7,
      Color = Color(255, 100, 100),
      Sprite = "sprites/orangecore1"
    })

    self.BaseClass.Initialize(self)
  end
end
