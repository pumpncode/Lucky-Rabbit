SMODS.Enhancement:take_ownership('m_steel',
    {
        loc_vars = function(self, info_queue, card)
            if #SMODS.find_card('j_fmod_ferromancy') > 0 then
                return {
                    vars = { '$' .. card.ability.h_dollars },
                    key = 'm_gold'
                }
            else
                return {
                    vars = { card.ability.h_x_mult },
                }
            end
        end,
        update = function(self, card, dt)
            if #SMODS.find_card('j_fmod_ferromancy') > 0 then
                card.ability.h_x_mult = 0
                card.ability.h_dollars = 5
            else
                card.ability.h_x_mult = 1.5
            end
        end
    },
    true
)

SMODS.Enhancement:take_ownership('m_gold',
    {
        loc_vars = function(self, info_queue, card)
            if #SMODS.find_card('j_fmod_ferromancy') > 0 then
                return {
                    vars = { card.ability.h_x_mult },
                    key = 'm_steel'
                }
            else
                return {
                    vars = { '$' .. card.ability.h_dollars },
                }
            end
        end,
        update = function(self, card, dt)
            if #SMODS.find_card('j_fmod_ferromancy') > 0 then
                card.ability.h_x_mult = 2
                card.ability.h_dollars = 0
            else
                card.ability.h_x_mult = 1
                card.ability.h_dollars = 3
            end
        end
    },
    true
)

SMODS.Joker {
    key = "ferromancy",
    config = {
        extra = {
            xmult = 2,
            money = 5,
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.money } }
    end,
    rarity = 3,
    atlas = "Jokers",
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    pos = { x = 9, y = 0 },
    cost = 8,
}