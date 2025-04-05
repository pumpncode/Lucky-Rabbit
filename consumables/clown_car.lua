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
    cost = 3,
    use = function(self, card, context, copier)
        local used_consumable = copier or card
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            local joker = SMODS.create_card({set = 'Joker', area = G.jokers, edition = "e_negative"})
            joker:add_to_deck()
            G.jokers:emplace(joker)
            used_consumable:juice_up(0.3, 0.5)
            return true end }))
        delay(0.6)
    end,
    can_use = function(self, card)
        if #G.jokers.cards < G.jokers.config.card_limit or context.cardarea == G.jokers then
            return true
        else
            return false
        end
    end
}