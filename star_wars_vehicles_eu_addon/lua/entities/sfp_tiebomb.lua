--HOW TO PROPERLY MAKE AN ADDITIONAL SHIP ADDON OFF OF MINE.
 
--Do not copy everything out of my addon. You don't need it. Shall explain later.
 
--Leave this stuff the same
ENT.RenderGroup = RENDERGROUP_OPAQUE;
ENT.Base = "fighter_base";
ENT.Type = "vehicle";
 
--Edit appropriatly. I'd prefer it if you left my name (Since I made the base, and this template)
ENT.PrintName = "TIE Bomb";
ENT.Author = "Liam0102, Nashatok";
 
-- Leave the same
ENT.Category = "Star Wars Vehicles: Empire"; 
list.Set("SWVehiclesEU", ENT.PrintName, ENT);
ENT.AutomaticFrameAdvance = true;
ENT.Spawnable = false;
ENT.AdminSpawnable = false;
ENT.AdminOnly = false; --Set to true for an Admin vehicle.
 
ENT.EntModel = "models/sfp_tiebomb/sfp_tiebomb.mdl" --The oath to the model you want to use.
ENT.Vehicle = "sfp_tiebomb" --The internal name for the ship. It cannot be the same as a different ship.
ENT.StartHealth = 400; --How much health they should have.
ENT.Allegiance = "Empire";
 
if SERVER then
 
ENT.FireSound = Sound("weapons/tie_shoot.wav"); -- The sound to make when firing the weapons. You do not need the sounds folder at the start
ENT.NextUse = {Wings = CurTime(),Use = CurTime(),Fire = CurTime(),}; --Leave this alone for the most part.

 
AddCSLuaFile();
function ENT:SpawnFunction(pl, tr)
    local e = ents.Create("sfp_tiebomb"); -- This should be the same name as the file
	local spawn_height = -50; -- How high above the ground the vehicle spawns. Change if it's spawning too high, or spawning in the ground.
	
    e:SetPos(tr.HitPos + Vector(0,0,spawn_height));
    e:SetAngles(Angle(0,pl:GetAimVector():Angle().Yaw,0));
    e:Spawn();
    e:Activate();
    return e;
end
 
function ENT:Initialize()
 
 
    self:SetNWInt("Health",self.StartHealth); -- Set the ship health, to the start health as made earlier
   
    --The locations of the weapons (Where we shoot out of), local to the ship. These largely just take a lot of tinkering.
    self.WeaponLocations = {
        Right = self:GetPos() + self:GetForward() * 345 + self:GetRight() * 20 + self:GetUp() * 20,
        Left = self:GetPos() + self:GetForward() * 345 + self:GetRight() * -20 + self:GetUp() * 20,
    }
    self.WeaponsTable = {}; -- IGNORE. Needed to give players their weapons back
    self.BoostSpeed = 2800; -- The speed we go when holding SHIFT
    self.ForwardSpeed = 600; -- The forward speed 
    self.UpSpeed = 300; -- Up/Down Speed
    self.AccelSpeed = 16; -- How fast we get to our previously set speeds
    self.CanBack = true; -- Can we move backwards? Set to true if you want this.
	self.CanRoll = true; -- Set to true if you want the ship to roll, false if not
	self.CanStrafe = false; -- Set to true if you want the ship to strafe, false if not. You cannot have roll and strafe at the same time
	self.CanStandby = true; -- Set to true if you want the ship to hover when not inflight
	self.CanShoot = false; -- Set to true if you want the ship to be able to shoot, false if not
	
	self.ExitModifier = {x=0,y=-225,z=50}

	self.FireDelay = 0.05
	self.AlternateFire = true -- Set this to true if you want weapons to fire in sequence (You'll need to set the firegroups below)
	self.FireGroup = {"Left","Right","FarLeft","FarRight"} -- In this example, the weapon positions set above will fire with Left and TopLeft at the same time. And Right and TopRight at the same time.
	self.OverheatAmount = 50 --The amount a ship can fire consecutively without overheating. 50 is standard.
	self.DontOverheat = false; -- Set this to true if you don't want the weapons to ever overheat. Mostly only appropriate on Admin vehicles.
	self.MaxIonShots = 20; -- The amount of Ion shots a vehicle can take before being disabled. 20 is the default.
	
	self.LandOffset = Vector(0,0,0); -- Change the last 0 if you're vehicle is having trouble landing properly. (Make it larger)
 

    self.Bullet = CreateBulletStructure(30,"green",false); -- The first number is bullet damage, the second colour. green and red are the only options. (Set to blue for ion shot, the damage will be halved but ships will be disabled after consecutive hits). The final one is for splash damage. Set to true if you don't want splashdamage.
	
    self.BaseClass.Initialize(self); -- Ignore, needed to work
end
 
end
 
if CLIENT then

	ENT.CanFPV = false; -- Set to true if you want FPV
    ENT.EnginePos = {}
    ENT.Sounds={
        --Engine=Sound("ambient/atmosphere/ambience_base.wav"),
        Engine=Sound("vehicles/tie/tie_advanced.wav"), -- This is the flight sound. These can get complicated, so I'd use the ones I've already put in the addon
    }

function ENT:Think()

	local p = LocalPlayer();
	local Flying = self:GetNWBool("Flying"..self.Vehicle);
	if(Flying) then
		self:Effects(); --Call the effects when the ship is flying.
	end
	self.BaseClass.Think(self)
end

function ENT:Effects()
	local normal = (self:GetForward() * -1):GetNormalized() -- More or less the direction. You can leave this for the most part (If it's going the opposite way, then change it 1 not -1)
	local roll = math.Rand(-90,90) -- Random roll so the effect isn't completely static (Useful for heatwave type)
	local p = LocalPlayer()	-- Player (duh)
	local id = self:EntIndex(); --Need this later on.
	
	--Get the engine pos the same way you get weapon pos
	self.EnginePos = {
		self:GetPos()+self:GetForward()*-80+self:GetUp()*177+self:GetRight()*-43,
		self:GetPos()+self:GetForward()*-80+self:GetUp()*177+self:GetRight()*41,
	}
	
	self.EnginePos2 = {
		self:GetPos()+self:GetForward()*-223+self:GetUp()*179+self:GetRight()*-3,
	}
	
	for k,v in pairs(self.EnginePos) do
	
		local red = self.FXEmitter:Add("sprites/orangecore1",v) -- This is where you add the effect. The ones I use are either the current or "sprites/bluecore"
		red:SetVelocity(normal) --Set direction we made earlier
		red:SetDieTime(0.03) --How quick the particle dies. Make it larger if you want the effect to hang around
		red:SetStartAlpha(255) -- Self explanitory. How visible it is.
		red:SetEndAlpha(100) -- How visible it is at the end
		red:SetStartSize(4) -- Start size. Just play around to find the right size.
		red:SetEndSize(3) -- End size
		red:SetRoll(roll) -- They see me rollin. (They hatin')
		red:SetColor(255,60,0) -- Set the colour in RGB. This is more of an overlay colour effect and doesn't change the material source.

		local dynlight = DynamicLight(id + 4096 * k); -- Create the "glow"
		dynlight.Pos = v; -- Position from the table
 		dynlight.Brightness = 1; -- Brightness, Don't go above 10. It's blinding
		dynlight.Size = 100; -- How far it reaches
		dynlight.Decay = 1024; -- Not really sure what this does, but I leave it in
		dynlight.R = 255; -- Colour R
		dynlight.G = 69; -- Colour G
		dynlight.B = 0; -- Colour B
		dynlight.DieTime = CurTime()+1; -- When the light should die
	end

	for k,v in pairs(self.EnginePos2) do
	
		local red = self.FXEmitter:Add("sprites/bluecore",v) -- This is where you add the effect. The ones I use are either the current or "sprites/bluecore"
		red:SetVelocity(normal) --Set direction we made earlier
		red:SetDieTime(0.05) --How quick the particle dies. Make it larger if you want the effect to hang around
		red:SetStartAlpha(255) -- Self explanitory. How visible it is.
		red:SetEndAlpha(100) -- How visible it is at the end
		red:SetStartSize(25) -- Start size. Just play around to find the right size.
		red:SetEndSize(3) -- End size
		red:SetRoll(roll) -- They see me rollin. (They hatin')
		red:SetColor(100,100,200) -- Set the colour in RGB. This is more of an overlay colour effect and doesn't change the material source.

		local dynlight = DynamicLight(id + 4096 * k); -- Create the "glow"
		dynlight.Pos = v; -- Position from the table
 		dynlight.Brightness = 4; -- Brightness, Don't go above 10. It's blinding
		dynlight.Size = 100; -- How far it reaches
		dynlight.Decay = 1024; -- Not really sure what this does, but I leave it in
		dynlight.R = 100; -- Colour R
		dynlight.G = 100; -- Colour G
		dynlight.B = 200; -- Colour B
		dynlight.DieTime = CurTime()+1; -- When the light should die
	end
end
 
    --This is where we set how the player sees the ship when flying
    local View = {}
    local function CalcView()      
		
		local p = LocalPlayer();
		local self = p:GetNetworkedEntity("sfp_tiebomb", NULL)
		if(IsValid(self)) then
			local fpvPos = self:GetPos(); -- This is the position of the first person view if you have it
			View = SWVehicleView(self,750,400,fpvPos);		-- 700 is distance from vehicle, 200 is the height.
			return View;
		end
    end
    hook.Add("CalcView", "sfp_tiebombview", CalcView) -- This is very important. Make sure the middle arguement is unique. In this case the ship name + view
 
	local function sfp_tiebombReticle()
		
		local p = LocalPlayer();
		local Flying = p:GetNWBool("Flyingsfp_tiebomb");
		local self = p:GetNWEntity("sfp_tiebomb");
		if(Flying and IsValid(self)) then
			SW_HUD_DrawHull(400); -- Replace 1000 with the starthealth at the top
			SW_WeaponReticles(self);
			SW_HUD_DrawOverheating(self);
			SW_BlastIcon(self,10);
			SW_HUD_Compass(self); -- Draw the compass/radar
			SW_HUD_DrawSpeedometer(); -- Draw the speedometer
		end
	end
    hook.Add("HUDPaint", "sfp_tiebombReticle", sfp_tiebombReticle) -- Here you need to make the middle argument something unique again. I've set it as what the function is called. Could be anything. And the final arguement should be the function just made.
 
end
 
/*
Put this file in lua/entities/
Then package up the addon like normal and upload.
Now you need to set your addon on the upload page, to require my addon.
This way the only thing in your addon is the unique files, and should I make any changes to fighter_base and the sounds etc. you'll get those changes.
 
Make sure this is the only file in lua/entities/
 
*/