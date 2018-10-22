ENT.Base = "swvr_base"

ENT.Category = "Independent"
ENT.Class = "Transport"

ENT.PrintName = "Komrk-class"
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
      Model = "models/sfp_gauntlet/sfp_gauntlet.mdl",
      Health = 2500,
      Shields = 1250,
      Speed = 2000,
      BoostSpeed = 3000,
      VerticalSpeed = 550,
      Acceleration = 8,
      Roll = true
    })

    self:AddWeaponGroup("Pilot", "proj_cannon", {
      Delay = 0.3,
      Damage = 75,
      CanOverheat = true,
      MaxOverheat = 20,
	  Sound = "weapons/slave_shoot"
    })

    self:AddWeapon("Pilot", "Left", Vector(150, -40, 170))
    self:AddWeapon("Pilot", "Right", Vector(150, 40, 170))

    self:AddPilot(nil, nil, {
      FPVPos = Vector(-200, 0, 230),
      Weapons = { "Pilot" },
      ExitPos = Vector(-650, 0, 20)
    })
	self:AddSeat("Passenger", Vector(-180, 15, 150), self:GetAngles() + Angle(0, 0, 0), {
            visible = false,
            exitpos = Vector(0, 35, 20),
        })
	self:AddSeat("Passenger2", Vector(-180, -15, 150), self:GetAngles() + Angle(0, 180, 0), {
            visible = false,
            exitpos = Vector(0, 35, 20),
        })
	self:AddSeat("Passenger3", Vector(-160, 15, 150), self:GetAngles() + Angle(0, 0, 0), {
            visible = false,
            exitpos = Vector(0, 35, 20),
        })
	self:AddSeat("Passenger4", Vector(-160, -15, 150), self:GetAngles() + Angle(0, 180, 0), {
            visible = false,
            exitpos = Vector(0, 35, 20),
        })
	self:AddSeat("Passenger5", Vector(-140, 15, 150), self:GetAngles() + Angle(0, 0, 0), {
            visible = false,
            exitpos = Vector(0, 35, 20),
        })
	self:AddSeat("Passenger6", Vector(-140, -15, 150), self:GetAngles() + Angle(0, 180, 0), {
            visible = false,
            exitpos = Vector(0, 35, 20),
        })
	self:AddSeat("Passenger7", Vector(-120, 15, 150), self:GetAngles() + Angle(0, 0, 0), {
            visible = false,
            exitpos = Vector(0, 35, 20),
        })
	self:AddSeat("Passenger8", Vector(-120, -15, 150), self:GetAngles() + Angle(0, 180, 0), {
            visible = false,
            exitpos = Vector(0, 35, 20),
        })
    self.BaseClass.Initialize(self)
  end
end

if CLIENT then
  function ENT:Initialize()
    self:Setup({
      EngineSound = "vehicles/landspeeder/t47_fly2.wav",
      ViewDistance = 800,
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
