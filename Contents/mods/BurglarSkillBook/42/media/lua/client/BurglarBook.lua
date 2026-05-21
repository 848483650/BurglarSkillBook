require "BurglarBook_Share"

local oISReadABookPerform = ISReadABook.perform

-- 重写 ISReadABook:perform
function ISReadABook:perform(...)
    local readType = self.item:getFullType()
    if MaxDebug then print("start") end
    if readType == "Base.BurglarBook" then
-- 向服务器发送指令
        sendClientCommand(self.character, "MaxBurglarBook", "Maxfield" , {
            magazineType = readType
        })
        ISTimedActionQueue.clear(self.character)

    if MaxDebug then print("done") end
        return
    end
    oISReadABookPerform(self, ...)
end