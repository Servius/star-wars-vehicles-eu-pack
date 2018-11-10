ENT.Base = "swvr_base"

ENT.Category = "Rebels"
ENT.Class = "Speeder"

ENT.PrintName = "T-47 Airspeeder"
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
      Model = "models/ywingredux/reb_snowspeeder_servius.mdl",
      Health = 1500,
      Speed = 1250,
      BoostSpeed = 2100,
      VerticalSpeed = 500,
      Acceleration = 7,
      Roll = false
    })

    self:AddWeaponGroup("Pilot", "rg9_cannon", {
      Delay = 0.2,
      Damage = 50,
      CanOverheat = true,
      MaxOverheat = 10,
      Tracer = "red_tracer_fx"
    })

    self:AddWeapon("Pilot", "MainR", Vector(130, 67, 30))
    self:AddWeapon("Pilot", "MainL", Vector(130, -67, 30))

    self:AddWeaponGroup("Turret", "rg9_cannon", {
      Delay = 10,
      Damage = 85,
      Tracer = "green_tracer_fx"
    })

    self:AddWeapon("Turret", "Left", Vector(130, 67, 30))
    self:AddWeapon("Turret", "Right", Vector(130, -67, 30))

    self:AddPilot(Vector(-51, 0, 25), nil, {
      FPVPos = Vector(96, 0, 88),
      Weapons = {"Pilot", "Turret"}
    })

    self:AddSeat("Back", Vector(-73, 0, 25), self:GetAngles() + Angle(0, 90, 0), {
      Visible = true,
      ExitPos = Vector(0, 35, -20),
    })

    self.BaseClass.Initialize(self)
  end
end

if CLIENT then
  function ENT:Initialize()
    self:Setup({
      Cockpit = "vgui/ywing_cockpit",
      DrawGlass = true,
      EngineSound = "vehicles/landspeeder/t47_fly2.wav",
      ViewDistance = 700,
      ViewHeight = 200
    })

    self:SetupDefaults()

    
      
      
      
      
      
    

    
      
      
      
      
      
    

    self.BaseClass.Initialize(self)
  end
end
