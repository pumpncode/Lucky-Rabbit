SMODS.Enhancement {
    key = "raffle_card",
    atlas = "Decks",
    pos = { x = 3, y = 0 },
    config = {
        extra = {
            chance = 5,
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.chance } }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if pseudorandom("raffle_cons") < G.GAME.probabilities.normal / card.ability.extra.chance and (#G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit) then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                local poss = {}
                for _, k in ipairs(SMODS.ConsumableType.ctype_buffer) do
                    poss[#poss+1] = k
                end
                G.E_MANAGER:add_event(Event({
                    delay = 0.3,
                    func = function()
                        SMODS.add_card( { set = pseudorandom_element(poss, pseudoseed("raffle_cons")), area = G.consumables, soulable = false })
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                }))
            end
        end
    end
}
