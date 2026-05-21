BurglarBook = BurglarBook or {}
local oISReadABookPerform = ISReadABook.perform
Player = nil
MaxDebug = false
-- 重写 ISReadABook:perform
function ISReadABook:perform(...)
    local readType = self.item:getFullType()
    if MaxDebug then print("start") end
    if readType == "Base.BurglarBook" then
        BurglarBook.applyBookTraits(self.character)

    if MaxDebug then print("done") end
        return
    end
    oISReadABookPerform(self, ...)
end



BurglarBook.OnCreatePlayer = function(playerIndex, player)
	BurglarBook.Player = player
end
Events.OnCreatePlayer.Add(BurglarBook.OnCreatePlayer)



function BurglarBook.applyBookTraits(player)
    local traits = player:getCharacterTraits()
        if not player:hasTrait(CharacterTrait.BURGLAR) then
            traits:add(CharacterTrait.BURGLAR)
        end
        player:Say(getText("IGUI_PlayerText_HaveMaster"))
end