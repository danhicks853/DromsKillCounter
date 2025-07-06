local addonName, DTKC = ...

local frame = CreateFrame("Frame", "DromsTrashKillCountFrame", UIParent)
frame:SetSize(80, 30)
frame:SetPoint("CENTER", UIParent, "CENTER", 0, 200)
frame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", edgeFile = nil, tile = true, tileSize = 16, edgeSize = 16})
frame:SetBackdropColor(0,0,0,0.6)
frame:EnableMouse(true)
frame:Show()
local label = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
label:SetPoint("BOTTOM", frame, "TOP", 0, 6)
label:SetText("Kills")
local text = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
text:SetPoint("CENTER", frame, "CENTER", 0, 2)
text:SetText("0")
frame:SetMovable(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", function(self) self:StartMoving() end)
frame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
local trashCount = 0

frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")

frame:SetScript("OnEvent", function(self, event, ...)
    if event == "COMBAT_LOG_EVENT_UNFILTERED" then
        local timestamp, subevent, hideCaster, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags = ...
        if subevent == "UNIT_DIED" then
            trashCount = trashCount + 1
            text:SetText(tostring(trashCount))
        end
    end
    if event == "ZONE_CHANGED_NEW_AREA" then
        trashCount = 0
        text:SetText(tostring(trashCount))
    end
    if event == "PLAYER_ENTERING_WORLD" then
        trashCount = 0
        text:SetText(tostring(trashCount))
    end
end)

frame:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
    if trashCount > 1 and trashCount < 20 then 
        GameTooltip:SetText("DOUBLE KILL")
    elseif trashCount > 20 and trashCount < 40 then
        GameTooltip:SetText("TRIPLE KILL")
    elseif trashCount > 40 and trashCount < 60 then
        GameTooltip:SetText("MULTI KILL")
    elseif trashCount > 60 and trashCount < 80 then 
        GameTooltip:SetText("ULTRA KILL")
    elseif trashCount > 80 and trashCount < 100 then
        GameTooltip:SetText("M-M-M-MONSTER KILL")
    elseif trashCount > 100 then
        GameTooltip:SetText("GODLIKE")
    end
    GameTooltip:Show()
end)

frame:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)