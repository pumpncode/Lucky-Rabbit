SMODS.Joker{
    key = "hyperfixation",
    config = {
        extra = {
            retriggers = 0,
            amt_needed = 5,
            current_amt = 0,
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { localize(G.GAME.hyperfix_card.rank, 'ranks'), localize(G.GAME.hyperfix_card.suit, 'suits_plural'),
        card.ability.extra.retriggers, G.GAME.current_round.hyperfix_card.rank, card.ability.extra.amt_needed, card.ability.extra.current_amt, colours = {G.C.SUITS[G.GAME.hyperfix_card.suit]} } }
    end,
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = true,
    pos = { x = 1, y = 1 },
    cost = 6,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.repetition then
            if context.other_card:get_id() == G.GAME.hyperfix_card.id and
            context.other_card:is_suit(G.GAME.hyperfix_card.suit) then
                if card.ability.extra.retriggers > 0 then
                    return {
                        message = localize('k_again_ex'),
                        repetitions = card.ability.extra.retriggers,
                        card = card
                    }
                end
            end
        end
        if context.individual and not context.blueprint then
            if context.other_card:get_id() == G.GAME.current_round.hyperfix_card.id then
                card.ability.extra.current_amt = card.ability.extra.current_amt + 1
                if card.ability.extra.current_amt >= card.ability.extra.amt_needed then
                    card.ability.extra.current_amt = 0
                    card.ability.extra.retriggers = card.ability.extra.retriggers + 1
                    return {
                        message = localize('k_fmod_upgraded'),
                        card = card
                    }
                end
            end
        end
    end
}