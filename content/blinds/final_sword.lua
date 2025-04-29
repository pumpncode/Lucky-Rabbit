SMODS.Blind {
    key = "final_sword",
    atlas = "Blinds",
    pos = { x = 0, y = 13 },
    discovered = true,
    boss = { showdown = true, min = 8 },
    boss_colour = HEX('becacc'),
    debuff = {
        hand = {}
    },
    set_blind = function(self)
        local _handname, _played, _order = 'High Card', -1, 100
            for k, v in pairs(G.GAME.hands) do
                if v.played > _played or (v.played == _played and _order > v.order) then 
                    _played = v.played
                    _handname = k
                end
            end
        G.GAME.current_round.most_played_poker_hand = _handname
        G.GAME.blind.debuff.hand = G.GAME.current_round.most_played_poker_hand
    end,
    loc_vars = function(self)
        return { vars = { localize(G.GAME.current_round.most_played_poker_hand, 'poker_hands') } }
    end,
    collection_loc_vars = function(self)
        return { vars = { localize('ph_most_played') } }
    end
}

