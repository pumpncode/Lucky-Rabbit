SMODS.Back {
    key = 'reaper',
    atlas = 'Decks',
    pos = { x = 3, y = 1 },
    config = {
        hands = 1,
        discards = 1,
        hand_size = 1,
        joker_slot = 1,
    },
    loc_vars = function(self, info_queue, card)
    end,
    apply = function(self, back)
        G.GAME.reaper_set = true
    end,
    calculate = function(self, back, context)
        if context.end_of_round and G.GAME.blind.boss then
            G.GAME.reaper_set = true
            return
        end
        if context.setting_blind and G.GAME.blind.boss then
            G.GAME.blind.chips = G.GAME.blind.chips * 2
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        end
    end
  }