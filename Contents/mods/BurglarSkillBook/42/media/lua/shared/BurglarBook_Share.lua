BurglarBook = BurglarBook or {}
MaxDebug = false


function BurglarBook.applyMagazineTraits(player)
    local traits = player:getCharacterTraits()
        if not player:hasTrait(CharacterTrait.BURGLAR) then
            traits:add(CharacterTrait.BURGLAR)
        end
end