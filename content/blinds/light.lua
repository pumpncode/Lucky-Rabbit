SMODS.Blind {
    key = "light",
    atlas = "Blinds",
    pos = { x = 0, y = 5 },
    discovered = true,
    boss = { min = 2 },
    boss_colour = HEX('d8d5c0'),
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            for k, v in ipairs(context.scoring_hand) do
                if next(SMODS.get_enhancements(v)) and not v.debuff and not v.vampired then
                    v.vampired = true
                    v:set_ability('c_base', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                            v:juice_up()
                            v.vampired = nil
                            return true
                        end
                    }))
                end
            end
        end
    end
}