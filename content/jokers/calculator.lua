SMODS.Joker {
    key = "calculator",
    config = {
        extra = {
            xmult = 1,
            inactive_hands = 0,
        }
    },
    loc_vars = function(self, info_queue, card)
        if card.ability.extra.inactive_hands > 0 then
            local hands_left = card.ability.extra.inactive_hands
            return { vars = { "Inactive for " .. hands_left .. " hand(s)" } }
        else
            return { vars = { "Active" } }
        end
    end,
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = true,
    pos = { x = 7, y = 1 },
    cost = 4,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.joker_main then
			local first_card = context.scoring_hand[1]
            local last_card = context.scoring_hand[#context.scoring_hand]
            if first_card ~= last_card then
                if card.ability.extra.inactive_hands > 0 then
                    card.ability.extra.inactive_hands = card.ability.extra.inactive_hands - 1
                else
                    local function adjusted_id(card)
                        local id = card:get_id()
                        if id >= 11 and id <= 13 then
                            return 10
                        elseif id == 14 then
                            return 11
                        else
                            return id
                        end
                    end
                    card.ability.extra.xmult = adjusted_id(first_card) - adjusted_id(last_card)
                    if card.ability.extra.xmult > 0 then
                        card.ability.extra.inactive_hands = card.ability.extra.xmult
                        return {
                            xmult = card.ability.extra.xmult
                        }
                    else
                        card.ability.extra.xmult = 0
                    end
                end
            end
		end
    end
}