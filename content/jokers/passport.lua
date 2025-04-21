SMODS.Joker {
	key = 'passport',
	atlas = 'Jokers',
	pos = { x = 8, y = 0 },
	rarity = 2,
	cost = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	config = {
		extra = {
			mult = 0,
            mult_mod = 8
		}
	},
	loc_vars = function(self, info_queue, card)
        card.ability.extra.mult = 0
        for k, v in pairs(G.GAME.hands) do
            if v.played > 0 then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
            end
        end
		return {
			vars = {
				card.ability.extra.mult_mod,
                card.ability.extra.mult
			}
		}
	end,
	calculate = function(self, card, context)
        if context.joker_main then
            card.ability.extra.mult = 0
            for k, v in pairs(G.GAME.hands) do
                if v.played > 0 then
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
                end
            end
            return {
                mult = card.ability.extra.mult
            }
        end
	end
}

