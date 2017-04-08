local function EUPlug( )

print("Star Wars Vehicles EU Collection Changelog 1.1")
print("===MOST RECENT UPDATE===")
print("- 20 new ships added.")
print("NOTICE: If you are interested in developing this addon feel free to take a look at the git repository located here:")
print("https://github.com/Servius/star-wars-vehicles-eu-pack")
print("I'd love the opportunity to work with any of you talented peeps out there -Servius")
print("SERVER OWNERS:")
print("I am adding an autorun downloads.lua for this addon. Instead of having required items it will only require the actual base pack. Everything else will be auto-downloaded. If you dont want to use a pack of ships comment it out.")
end
hook.Add("PlayerInitialSpawn", "EUUpdates", EUPlug)