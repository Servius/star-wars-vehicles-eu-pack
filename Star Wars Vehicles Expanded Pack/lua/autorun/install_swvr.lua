local function checkForSWVR()
	if SWVR then return end -- we're 100% good

	if CLIENT then
		Derma_Query(
			"The vehicle(s) you have installed requires Star Wars Vehicles: Redux Base. Use the button below to install it.",
			"Install Star Wars Vehicles: Redux Base !!!",
			"Workshop",
			function() gui.OpenURL("http://steamcommunity.com/workshop/filedetails/?id=866368346") end
		)
	else
		print("#################### WARNING!!! ####################")
		print("The vehicle(s) you have installed requires Star Wars Vehicles: Redux Base.")
		print("http://steamcommunity.com/workshop/filedetails/?id=866368346")
		print("####################################################")
	end
end

hook.Add("InitPostEntity", "INSTALL SWVR BASE", checkForSWVR)