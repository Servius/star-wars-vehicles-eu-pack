local function EUPlug( )

print("Star Wars Vehicles EU Collection Changelog 1.0")
print("===MOST RECENT UPDATE===")
print("- Added this on spawn console message to help inform people what has changed with this addon.")
print("- Added support for both ship packs made by thd 4/1/2017")
print("- Added a third category for the new batch of ships. Due to the amount of vehicles I would like have more input on what the mechanics for these ships should be before moved to the final section.")
print("NOTICE: If you are interested in developing this addon feel free to take a look at the git repository located here:")
print("https://github.com/Servius/star-wars-vehicles-eu-pack")
print("I'd love the opportunity to work with any of you talented peeps out there -Servius")
print("SERVER OWNERS:")
print("I am adding an autorun downloads.lua for this addon. Instead of having required items it will only require the actual base pack. Everything else will be auto downloaded. If you dont want to use a pack of ships comment it out.")
end
hook.Add("PlayerInitialSpawn", "EUUpdates", EUPlug)