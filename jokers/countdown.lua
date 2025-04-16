SMODS.Joker {
    key = "countdown",
    config = {
        extra = {
            rank = 13,
            mult = 15,
            xmult = 3
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.rank, card.ability.extra.mult, card.ability.extra.xmult } }
    end,
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    pos = { x = 3, y = 0 },
    cost = 5,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == card.ability.extra.rank then
                return {
					mult = card.ability.extra.mult,
                    -- if context.other_card:get_id() == 14 then
                       -- xmult = card.ability.extra.xmult,
					card = card
                }
            end
            card.ability.extra.rank = card.ability.extra.rank - 1
            if card.ability.extra.rank == 1 then
                card.ability.extra.rank = 14
            end
        end
    end
}