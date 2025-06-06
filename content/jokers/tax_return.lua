SMODS.Joker {
	key = "tax_return",
	atlas = "Jokers",
	pos = { x = 8, y = 4 },
	rarity = 1,
	cost = 6,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	config = { extra = { dollars = 1 } },
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars,
            }
        }
	end,
	calculate = function(self, card, context)
		if context.after then
			local scored_lookup = {}
			for _, v in ipairs(context.scoring_hand) do
				scored_lookup[v] = true
			end
			local unscored_cards = {}
			for _, v in ipairs(G.play.cards) do
				if not scored_lookup[v] then
					table.insert(unscored_cards, v)
				end
			end
			if #unscored_cards > 0 then
                ease_dollars(#unscored_cards * card.ability.extra.dollars)
            end
		end
	end
}
