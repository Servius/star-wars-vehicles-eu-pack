ENT.Base = "swvr_base"

ENT.Category = "CIS"
ENT.Class = "Transport"

ENT.PrintName = "Punworcca 116 Transport"
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
            Model = "models/ship_dooku/ship_dooku_servius.mdl",
            Health = 1500,
            Speed = 1250,
            Shields = 1000,
            BoostSpeed = 2500,
            VerticalSpeed = 600,
            Acceleration = 8,
            Roll = true,
        })

        self:AddWeaponGroup("Pilot", "ls1_cannon", {
        })



        self:AddPilot(nil, nil, {
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
