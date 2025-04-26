SMODS.Consumable {
    key = "knife_throw",
    set = "Silly",
    atlas = "Consumables",
    config = {
        extra = {
            chance = 2,
            cards = 3
        }
    },
    pos = {x = 8, y = 1 },
    cost = 3,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards } }
    end,
    use = function(self, card, context, copier)
        local used_consumable = copier or card
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            for i = 1, #G.hand.highlighted do
                local k_card = G.hand.highlighted[i]
                if pseudorandom(pseudoseed('knifethrow')) < G.GAME.probabilities.normal/card.ability.extra.chance then
                    local seal = SMODS.poll_seal({
                        guaranteed = true
                    })
                    k_card:set_seal(seal)
                else
                    if k_card.ability.name == 'Glass Card' then
                        k_card:shatter()
                    else
                        k_card:start_dissolve(nil)
                    end
                end
            end
            G.hand:unhighlight_all()
            used_consumable:juice_up(0.3, 0.5)
        return true end}))
        delay(0.5)
    end,
    can_use = function(self, card)
        if G.hand and #G.hand.highlighted >= 1 and #G.hand.highlighted <= card.ability.extra.cards then
            return true
        end
    end
}