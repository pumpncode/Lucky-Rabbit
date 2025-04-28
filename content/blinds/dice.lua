SMODS.Blind {
    key = "dice",
    atlas = "Blinds",
    pos = { x = 0, y = 9 },
    discovered = true,
    boss = { min = 4 },
    boss_colour = HEX('90c7e6'),
    debuff = {
        old_prob = 1,
    },
    set_blind = function(self)
        self.debuff.old_prob = G.GAME.probabilities.normal or 1
        for k, v in pairs(G.GAME.probabilities) do
            G.GAME.probabilities[k] = 0
        end
    end,
    defeat = function (self)
        for k, v in pairs(G.GAME.probabilities) do
            G.GAME.probabilities[k] = self.debuff.old_prob
        end
    end,
    disable = function (self)
        for k, v in pairs(G.GAME.probabilities) do
            G.GAME.probabilities[k] = self.debuff.old_prob
        end
    end
}