SMODS.Joker{
    key = "negativejoker",
    config = {
        extra = {
            chips = 60,
            rounds = 9,
            uses = 0,
            edition = {negative = true},
            flag = false
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.rounds, card.ability.extra.rounds - card.ability.extra.uses  } }
    end,
    rarity = 1,
    atlas = "Jokers",
    unlocked = true,
    discovered = true,
    pos = { x = 6, y = 0 },
    cost = 4,
    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.flag = false
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
        if context.end_of_round and not card.ability.extra.flag then
            card.ability.extra.uses = card.ability.extra.uses + 1
            if card.ability.extra.uses == card.ability.extra.rounds then
                card:set_edition(card.ability.extra.edition)
            end
            card.ability.extra.flag = true
        end
    end
}