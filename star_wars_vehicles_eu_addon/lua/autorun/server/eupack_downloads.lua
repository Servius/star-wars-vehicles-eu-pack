	local function AddDir(dir)
		local f, d = file.Find(dir .. '/*', 'GAME')
		
		for k, v in pairs(f) do
			resource.AddFile(dir .. '/' .. v)
		end
		
		for k, v in pairs(d) do
			AddDir(dir .. '/' .. v)
		end
	end

	--[[ Map Content ]]--

	-- Efficient Map Resource Downloads

--[[
	local mapName = game.GetMap()
	local workshopMaps = {
		[""] = ""
	}

	if workshopMaps[mapName] then
		resource.AddWorkshop(workshopMaps[mapName])
	else
		resource.AddFile("maps/" .. mapName .. ".bsp")
	end
--]]


	// Vehicle pack Models \\
	
	resource.AddWorkshop("651995095") -- Imperial Vehicle Models by Stefano and Bengane        || http://steamcommunity.com/workshop/filedetails/?id=651995095
    resource.AddWorkshop("648719328") -- CIS Vehicle Models by Stefano and Bengane             || http://steamcommunity.com/workshop/filedetails/?id=648719328
    resource.AddWorkshop("607678060") -- Star Wars Republic Ships by Stefano and Binary Space  || http://steamcommunity.com/workshop/filedetails/?id=607678060
    resource.AddWorkshop("759360399") -- Star Wars EaW Clones ships pack (Part 2) by Stefano   || http://steamcommunity.com/workshop/filedetails/?id=759360399
    resource.AddWorkshop("759350879") -- Star Wars EaW Clones Ships pack (Part 1) by Stefano   || http://steamcommunity.com/workshop/filedetails/?id=759350879
    resource.AddWorkshop("768102717") -- Star Wars : CIS Ships Pack by Akiran and thd          || http://steamcommunity.com/workshop/filedetails/?id=768102717
    resource.AddWorkshop("660180316") -- Rebel Vehicle Models by Akiran and thd                || http://steamcommunity.com/workshop/filedetails/?id=660180316
    resource.AddWorkshop("766599047") -- Star Wars : Speeders Pack by thd                      || http://steamcommunity.com/workshop/filedetails/?id=766599047
    resource.AddWorkshop("672768215") -- Republic Vehicle Models Part 1 by Stefano and Bengane ||http://steamcommunity.com/workshop/filedetails/?id=672768215
   --[[ Commented this one out. Un-comment if you want the vehicles and models to be downloaded. 
   resource.AddWorkshop("700977706") -- CGI Star Wars 666th Death Regiment by Orex             || http://steamcommunity.com/workshop/filedetails/?id=700977706
                                                                                               ||  --]]
   resource.AddWorkshop("895501418") -- Star Wars Capital Ships : Props Pack by thd and Akiran || http://steamcommunity.com/sharedfiles/filedetails/?id=895501418
   resource.AddWorkshop("893889779") -- Star Wars Ships : Props Pack by thd and Akiran         || http://steamcommunity.com/sharedfiles/filedetails/?id=893889779