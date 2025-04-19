SMODS.Consumable {
    key = "soully",
    set = "Silly",
    config = {
        extra = {
            silly_legendaries = {
                "j_fmod_steve",
                --[[
                "j_fmod_pomni",
                "j_fmod_geiru",
                "j_fmod_ransome",
                "j_fmod_loonette",
                "j_fmod_fennex_clown",
                ]]
            }
        }
    },
    atlas = "Consumables",
    pos = {x = 0, y = 2 },
    soul_pos = { x = 2, y = 2 },
    cost = 10,
    hidden = {
        soul_set = 'Silly',
        soul_rate = 0.003,
        can_repeat_soul = false
    },
    use = function(self, card, context, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            local key = pseudorandom_element(card.ability.extra.silly_legendaries, pseudoseed('soully'))
            play_sound('timpani')
            SMODS.add_card({set = 'Joker', area = G.jokers, key = key})
            return true end }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}