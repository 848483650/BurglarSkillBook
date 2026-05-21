require "BurglarBook_Share"

local function onClientCommand(module, command, player, args)
    if module ~= "MaxBurglarBook" then return end
    if command ~= "ApplyBurglar" then return end
    if MaxDebug then print("Server Recive") end
    BurglarBook.applyMagazineTraits(player)
end

Events.OnClientCommand.Add(onClientCommand)