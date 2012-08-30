-- Look at this file to get an idea of valid inputs:
--   http://wowprogramming.com/utils/xmlbrowser/live/FrameXML/UnitPopup.lua

-- To view what any one of these items currently has, run this command:
--
-- /run for i,v in pairs(UnitPopupMenus.RAID) do print(i, "=", v) end
--
-- Notice: replace RAID with any of the items below

-- Config:
local itemsToAdd = {
  ARENAENEMY = { },
  TARGET = { },  -- e.g. "PARTY_SILENCE", "PARTY_UNSILENCE", etc
  PARTY = { },
  PLAYER = { },
  OTHERPET = { },
  SELF = { },
  CHAT_ROSTER = { },
  ADD_FRIEND_MENU = { },
  BN_FRIEND_OFFLINE = { },
  GUILD = { },
  FRIEND = { },
  EHICLE = { },
  PVP_FLAG = { },
  FRIEND_OFFLINE = { },
  LOOT_THRESHOLD = { },
  OPT_OUT_LOOT_TITLE = { },
  FOCUS = { },
  RAID_DIFFICULTY = { },
  REPORT_PLAYER = { },
  BN_REPORT = { },
  LOOT_METHOD = { },
  MOVE_TARGET_FRAME = { },
  MOVE_FOCUS_FRAME = { },
  MOVE_PLAYER_FRAME = { },
  SELECT_ROLE = { },
  GUILD_OFFLINE = { },
  BOSS = { },
  TEAM = { },
  PET = { },
  RAID = { "TRADE" },
  RAID_PLAYER = { "TRADE" },
  BN_FRIEND = { },
  DUNGEON_DIFFICULTY = { },
  RAID_TARGET_ICON = { },
  OTHERBATTLEPET = { },
}


-- Begin Addon Code:
-- Do not edit below
-- ElvUI UnitPopup Extender
local ADDON_NAME, addon = ...

if not ElvUI then return end
local E,l,v,UI = select(1,unpack(ElvUI))


do
  --UnitPopupMenus
  for popupType, items in pairs(itemsToAdd) do
    for index, newType in pairs(items) do
      -- Check to see if the list already contains it, before you add it again
      local contains = 0
      for i, v in pairs(UnitPopupMenus[popupType]) do
        if v == newType then contains=i break end
      end
      
      -- Remove the item so that it goes to the bottom
      if contains ~= 0 then
        table.remove(UnitPopupMenus[popupType], contains)
      end
      
      -- Add the new type to the bottom of the list
      table.insert(UnitPopupMenus[popupType], newType)
    end
  end
end
