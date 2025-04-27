SMODS.Back {
    key = 'harmony',
    atlas = 'Decks',
    pos = { x = 2, y = 1 },
    unlocked = true,
    discovered = true,
    config = {
        discards = -2
    },
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.3,
            func = function()
                local rank = pseudorandom_element(SMODS.Ranks, pseudoseed('harmony')) or 'Ace'
                local suit = pseudorandom_element(SMODS.Suits, pseudoseed('harmony')) or 'Spades'
                for i = 1, #G.playing_cards do
                    SMODS.change_base(G.playing_cards[i], suit.key, rank.key)
                end
                return true
            end
        }))
    end
}