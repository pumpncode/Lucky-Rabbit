SMODS.Blind {
    key = "hoard",
    atlas = "Blinds",
    pos = { x = 0, y = 0 },
    discovered = true,
    boss = { min = 1 },
    boss_colour = HEX('963f39'),
    stay_flipped = function(self, area, card)
        if not card:is_face() and area == G.hand then
            return true
        end
    end
}