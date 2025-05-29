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
                local selected = ""
                local passed = false
                local tries = 50
                while tries > 0 and not passed do -- modified from a cryptid function, could easily be absolute garbage
                    tries = tries - 1
                    passed = false
                    local key = pseudorandom_element(G.P_CENTER_POOLS.Consumeables, pseudoseed("raffle_cons")).key
                    selected = G.P_CENTERS[key]
                    if not (selected["hidden"] or (G.GAME and G.GAME["hidden"] and G.GAME["hidden"][selected]) or false) then
                        passed = true
                    end
                    if passed or tries <= 0 then
                        if tries <= 0 then
                            selected = "c_strength"
                        else
                            selected = selected
                        end
                    end
                end
                G.E_MANAGER:add_event(Event({
                    delay = 0.3,
                    func = function()
                        SMODS.add_card( { area = G.consumeables, soulable = false, key = selected.key })
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                }))
            end
        end
    end
}
