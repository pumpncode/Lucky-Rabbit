SMODS.Joker {
    key = "ghost_trick",
    config = {
        extra = {
            odds = 5
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
    end,
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = true,
    pos = { x = 0, y = 2 },
    cost = 4,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
			if not context.other_card.ghost_tricked then
				context.other_card.ghost_tricked = true
				local c = context.other_card
				G.E_MANAGER:add_event(Event({
					func = function()
						if c then
							c.ghost_tricked = nil
						end
						return true
					end,
				}))
			else
				if pseudorandom(pseudoseed('ghost_trick')) < G.GAME.probabilities.normal/card.ability.extra.odds and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = (function()
                            local new_card = SMODS.create_card({set="Spectral", area=G.consumeables, key_append="gtrick"})
                            new_card:add_to_deck()
                            G.consumeables:emplace(new_card)
                            G.GAME.consumeable_buffer = 0
                            return true
                        end)
                    }))
                    return {
                        message = localize('k_plus_spectral'),
                        colour = G.C.SECONDARY_SET.Spectral,
                        card = card
                    }
                end
			end
		end
    end
}