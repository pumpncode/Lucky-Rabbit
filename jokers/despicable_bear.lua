SMODS.Joker{
    key = "despicable_bear",
    config = {
        extra = {
        }
    },
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    pos = { x = 1, y = 0 },
    cost = 6,
    calculate = function(self, card, context)
        if context.before and (next(context.poker_hands['Two Pair'])) and #G.play.cards == 4 and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    card:juice_up(0.3, 0.5)
                    return true
                end,
                blocking = true
            }))
            if next(context.poker_hands['Two Pair']) then
                G.GAME.old_poker_hand = 'Two Pair'
                G.GAME.new_poker_hand = 'Four of a Kind'
            end
            context.poker_hands[G.GAME.new_poker_hand] = context.poker_hands[G.GAME.old_poker_hand]
            context.scoring_hand = G.GAME.hands[G.GAME.new_poker_hand][1]
            update_hand_text({delay = 0}, {chips = G.GAME.hands[G.GAME.new_poker_hand].chips, mult = G.GAME.hands[G.GAME.new_poker_hand].mult, handname = G.GAME.new_poker_hand})
            for k,v in pairs(G.jokers.cards) do
                if v.ability.type == 'Four of a Kind' then
                    v.force_trigger = true
                end
            end
        end
    end
}