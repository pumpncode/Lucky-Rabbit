SMODS.Consumable {
    key = "soully",
    set = "Silly",
    atlas = "Consumables",
    pos = {x = 0, y = 2 },
    soul_pos = { x = 2, y = 2 },
    cost = 10,
    hidden = true,
    soul_set = "Spectral",
    use = function(self, card, context, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            local key = FMOD.get_fmod_legendaries('soully')
            play_sound('timpani')
            SMODS.add_card({set = 'Joker', area = G.jokers, key = key})
            return true end }))
        delay(0.6)
    end,
    can_use = function(self, card)
        if #G.jokers.cards < G.jokers.config.card_limit or self.area == G.jokers then
            return true
        else
            return false
        end
    end
}