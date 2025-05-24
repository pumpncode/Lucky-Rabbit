SMODS.Joker {
    key = "pub_burger",
    config = {
        extra = {
            discards = 5,
            discard_mod = 1,
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.discards, card.ability.extra.discard_mod } }
    end,
    rarity = 3,
    atlas = "Jokers",
    unlocked = true,
    discovered = true,
    pos = { x = 6, y = 1 },
    blueprint_compat = false,
    cost = 6,
    calculate = function(self, card, context)
        if context.setting_blind and not card.getting_sliced and not context.blueprint then
            G.E_MANAGER:add_event(Event({func = function()
                ease_discard((card.ability.extra.discards), nil, true)
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_fmod_discards', vars = {card.ability.extra.discards}}})
            return true end }))
        end
        if context.before and G.GAME.current_round.hands_played > 0 then
            if card.ability.extra.discards - card.ability.extra.discard_mod <= 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                            func = function()
                                    G.jokers:remove_card(card)
                                    card:remove()
                                    card = nil
                                return true; end}))
                        return true
                    end
                }))
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.RED
                }
            else
                card.ability.extra.discards = card.ability.extra.discards - card.ability.extra.discard_mod
                return {
                    message = localize{type='variable',key='a_chips_minus',vars={card.ability.extra.discard_mod}},
                    colour = G.C.RED
                }
            end
        end
    end
}