SMODS.Consumable {
    key = "juggler",
    set = "Silly",
    config = {
        extra = {
            dollars = 3,
            increase = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars + (G.GAME.juggler_count * card.ability.extra.increase), card.ability.extra.increase } }
    end,
    atlas = "Consumables",
    pos = {x = 6, y = 0 },
    cost = 5,
    use = function(self, card, context, copier)
        local used_consumable = copier or card
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            G.GAME.juggler_count = (G.GAME.juggler_count or 0) + 1
            play_sound('timpani')
            used_consumable:juice_up(0.3, 0.5)
            ease_dollars((card.ability.extra.dollars + (G.GAME.juggler_count * card.ability.extra.increase)), true)
            return true end }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}