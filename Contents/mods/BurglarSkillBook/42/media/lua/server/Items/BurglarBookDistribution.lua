require 'Items/ProceduralDistributions'
require "Items/ItemPicker"

local sandBoxVars = SandboxVars.BurglarBook;

local spawnRateOptions = {
    [1] = 0.1,
    [2] = 0.5,
    [3] = 1,
    [4] = 2,
    [5] = 3,
}
local function getSpawnRateOptions()
    return spawnRateOptions[SandboxVars.spawnRate] or 1
end

local function getLootTable(name)
  return ProceduralDistributions.list[name] or (SuburbsDistributions["all"] and SuburbsDistributions["all"][name])
end

local function addLoot(container, item, chance)
    if not ProceduralDistributions.list[container] then return end
    

    local realSpawnRate = chance * getSpawnRateOptions()


    table.insert(getLootTable(container).items, item)
    table.insert(getLootTable(container).items, realSpawnRate)
end

Events.OnInitGlobalModData.Add(function()
    local burglarBook = "Base.BurglarBook"
    addLoot("BinDumpster", burglarBook, 8.0)
    addLoot("SchoolLockers", burglarBook, 3.0)
    addLoot("GigamartSchool", burglarBook, 1.0)
    addLoot("ClassroomDesk", burglarBook, 2.0)
    addLoot("ClassroomMisc", burglarBook, 2.0)
    addLoot("ClassroomShelves", burglarBook, 1.0)
    addLoot("BedroomDresserChild", burglarBook, 2.0)
    addLoot("BedroomDresser", burglarBook, 2.0)
    addLoot("BedroomSidetable", burglarBook, 1.0)
    addLoot("GymLockers", burglarBook, 1.0)
    addLoot("ShelfGeneric", burglarBook, 3.0)
    addLoot("MagazineRackMixed", burglarBook, 5.0)
    addLoot("MagazineRackNewspaper", burglarBook, 5.0)
    addLoot("LivingRoomShelf", burglarBook, 5.0)
    addLoot("CrateBooks", burglarBook, 7.0)
    addLoot("LibraryBooks", burglarBook, 7.0)
    addLoot("BookstoreBooks", burglarBook, 10.0)
    addLoot("PostOfficeBooks", burglarBook, 1.0)
    addLoot("BedroomSideTable", burglarBook, 9.0)
    addLoot("GarageTools", burglarBook, 1.0)
    ItemPickerJava.Parse()
end)