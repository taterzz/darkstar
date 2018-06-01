-----------------------------------
-- Area: Port San d'Oria
--  NPC: Croumangue
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_San_dOria/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
end;

function onTrigger(player,npc)

    player:showText(npc,CROUMANGUE_SHOP_DIALOG);

    local stock =
    {
        0x1159,837,1,  --Grape Juice
         0x1143,6300,1, --Mushroom Soup
         0x1134,540,1,  --Roast Trout

         0x1147,270,2,  --Apple Juice
         0x11b9,468,2,  --Roast Carp
         0x11d0,1355,2, --Vegetable Soup
         0x1104,180,2,  --White Bread

         0x110c,108,3,  --Black Bread
         0x11b7,360,3,  --Boiled Crayfish
         0x119d,10,3,   --Distilled Water
         0x1167,180,3}  --Pebble Soup

showNationShop(player, dsp.nation.SANDORIA, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
