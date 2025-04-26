SMODS.Consumable {
    key = "clown_car",
    set = "Silly",
    config = {
        extra = {

        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.e_negative
    end,
    atlas = "Consumables",
    pos = {x = 0, y = 0 },
    cost = 5,
    use = function(self, card, context, copier)
        local used_consumable = card
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            SMODS.add_card({set = 'Joker', area = G.jokers, edition = "e_negative"})
            used_consumable:juice_up(0.3, 0.5)
            return true end }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}