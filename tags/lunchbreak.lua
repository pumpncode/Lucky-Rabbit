SMODS.Tag {
    key = "lunchbreak",
    atlas = "Tags",
    pos = { x = 1, y = 0 },
    config = {
    },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.e_negative
    end,
    apply = function(self, tag, context)
        tag:yep('+', G.C.GREEN, function()
            local possible_jokers = {
                'j_gros_michel',
                'j_egg',
                'j_ice_cream',
                'j_cavendish',
                'j_turtle_bean',
                'j_diet_cola',
                'j_popcorn',
                'j_ramen',
                'j_selzer',
            }
            if G.P_CENTER_POOLS.Joker then for k, v in pairs(G.P_CENTER_POOLS.Joker) do
                if v.pools and v.pools.Food then
                    possible_jokers[#possible_jokers+1] = v.key
                end
            end
            end
            print(possible_jokers)
            local key = pseudorandom_element(possible_jokers, pseudoseed('lunchbreak')) or 'j_gros_michel'
            SMODS.add_card({set = 'Joker', key = key, edition = 'e_negative'})
            return true
        end)
        tag.triggered = true
        return true
    end
}