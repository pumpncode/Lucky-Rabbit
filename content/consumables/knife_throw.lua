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
        local outcomes = {}
        local destroyed_cards = {}
        for i = 1, #G.hand.highlighted do
            local k_card = G.hand.highlighted[i]
            if pseudorandom(pseudoseed('knifethrow')) < G.GAME.probabilities.normal/card.ability.extra.chance then
                table.insert(outcomes, { k_card = k_card, success = true })
            else
                table.insert(outcomes, { k_card = k_card, success = false })
                table.insert(destroyed_cards, k_card)
            end
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            for _, outcome in ipairs(outcomes) do
                local k_card = outcome.k_card
                if outcome.success then
                    local seal = SMODS.poll_seal({
                        guaranteed = true
                    })
                    k_card:juice_up(0.3, 0.5)
                    k_card:set_seal(seal)
                else
                    if k_card.ability.name == 'Glass Card' then
                        k_card:shatter()
                    else
                        k_card:start_dissolve(nil)
                    end
                end
            end
            card:juice_up(0.3, 0.5)
        return true end}))
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function()
            G.hand:unhighlight_all()
        return true end }))
        delay(0.5)
        SMODS.calculate_context({ remove_playing_cards = true, removed = destroyed_cards })
    end,
    can_use = function(self, card)
        if G.hand and #G.hand.highlighted >= 1 and #G.hand.highlighted <= card.ability.extra.cards then
            return true
        end
    end
}