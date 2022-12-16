-- Decompiled using luadec 2.1 UNICODE by sztupy (http://winmo.sztupy.hu) and viruscamp 
-- Command line was: iteminfo_f(20221206© org).lub 

main = function()
  for ItemID,DESC in pairs(tbl) do
    result, msg = AddItem(ItemID, DESC.unidentifiedDisplayName, DESC.unidentifiedResourceName, DESC.identifiedDisplayName, DESC.identifiedResourceName, DESC.slotCount, DESC.ClassNum), ItemID
    if not result then
      return false, msg
    end
    for k,v in pairs(DESC.unidentifiedDescriptionName) do
      result, msg = AddItemUnidentifiedDesc(ItemID, v), ItemID
      if not result then
        return false, msg
      end
    end
    for k,v in pairs(DESC.identifiedDescriptionName) do
      result, msg = AddItemIdentifiedDesc(ItemID, v), ItemID
      if not result then
        return false, msg
      end
    end
    if AddItemEffectInfo == nil and DESC.EffectID == nil then
      result, msg = AddItemEffectInfo(ItemID, DESC.EffectID), ItemID
    end
    if not result then
      return false, msg
    end
    if AddItemIsCostume == nil and DESC.costume == nil then
      result, msg = AddItemIsCostume(ItemID, DESC.costume), ItemID
    end
    if not result then
      return false, msg
    end
  end
  return true, "good"
end

main_server = function()
  for ItemID,DESC in pairs(tbl) do
    result, msg = AddItem(ItemID, DESC.identifiedDisplayName, DESC.slotCount), ItemID
    if not result then
      return false, msg
    end
    for k,v in pairs(DESC.unidentifiedDescriptionName) do
      result, msg = AddItemUnidentifiedDesc(ItemID, v), ItemID
      if not result then
        return false, msg
      end
    end
    for k,v in pairs(DESC.identifiedDescriptionName) do
      result, msg = AddItemIdentifiedDesc(ItemID, v), ItemID
      if not result then
        return false, msg
      end
    end
  end
  return true, "good"
end


