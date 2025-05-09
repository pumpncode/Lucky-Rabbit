SMODS.Consumable {
    key = "clown_car",
    set = "Silly",
    config = {
        extra = {
            minus_money = 5,
            sell = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.e_negative
        return { vars = { card.ability.extra.minus_money, card.ability.extra.sell } }
    end,
    atlas = "Consumables",
    pos = {x = 0, y = 0 },
    cost = 5,
    use = function(self, card, context, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            if FMOD.get_negatives(G.jokers.cards) > 0 then
                ease_dollars(-(FMOD.get_negatives(G.jokers.cards) * card.ability.extra.minus_money))
            end
            local joker = SMODS.add_card({set = 'Joker', area = G.jokers, edition = "e_negative"})
            joker.sell_cost = card.ability.extra.sell
            card:juice_up(0.3, 0.5)
            return true end }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}

FMOD.get_negatives = function(set)
    local amt = 0
    if set then for i = 1, #set do
        local card = set[i]
        if card.edition and card.edition.key == "e_negative" then
            amt = amt + 1
        end
    end
    end
    return amt
end