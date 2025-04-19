SMODS.Joker {
    key = "steve",
    config = {
        extra = {
        }
    },
    rarity = 4,
    atlas = "Jokers",
    unlocked = true,
    discovered = true,
    pos = { x = 2, y = 3 },
    soul_pos = { x = 2, y = 4 },
    cost = 10,
    calculate = function(self, card, context)
        if context.setting_blind then
            card:juice_up(0.3, 0.5)
            local key = get_food_jokers('steve')
            SMODS.add_card({set = 'Joker', key = key, edition = 'e_negative'})
            return true
        end
    end
}