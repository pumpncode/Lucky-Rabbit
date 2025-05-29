SMODS.Joker {
    key = "pop_idol_cat",
    rarity = 2,
    atlas = "Jokers",
    config = {
        extra = {
            plus_chance = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_lucky
        return { vars = { card.ability.extra.plus_chance } }
    end,
    unlocked = true,
    discovered = true,
    pos = { x = 2, y = 1 },
    blueprint_compat = false,
    cost = 5,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, "m_lucky") then
            G.GAME.pop_idol_plus = (G.GAME.pop_idol_plus or 0) + card.ability.extra.plus_chance
            return {
                message = "+"..card.ability.extra.plus_chance,
                colour = G.C.GREEN,
                message_card = card
            }
        end
        if context.end_of_round and context.cardarea == G.jokers then
            G.GAME.pop_idol_plus = 0
            return {
                message = localize("k_reset"),
                card = card
            }
        end
    end,
}