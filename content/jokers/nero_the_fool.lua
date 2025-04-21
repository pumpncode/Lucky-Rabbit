SMODS.Joker{
    key = "nerothefool",
    config = {
        extra = {
            cards_played = 2,
            cards_destroyed = {},
            destroy = false
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_played } }
    end,
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = true,
    pos = { x = 5, y = 0 },
    cost = 4,
    calculate = function(self, card, context)
        if context.destroy_card and (context.cardarea == G.play or context.cardarea == 'unscored') and #context.full_hand == 2 and G.GAME.current_round.hands_played == 0 then
            return {remove = true}
       end
    end
}