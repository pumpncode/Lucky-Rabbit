SMODS.Tag {
    key = "goofy",
    atlas = "Tags",
    pos = { x = 0, y = 0 },
    min_ante = 2,
    config = {
        type = "new_blind_choice",
    },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { colours = {HEX("ff98e2")} } }
    end,
    apply = function(self, tag, context)
        if context.type == self.config.type then
            tag:yep('+', G.C.GREEN, function()
                local key = 'p_fmod_silly_mega'
                local card = SMODS.create_card({key = key})
                card.cost = 0
                card.from_tag = true
                G.FUNCS.use_card({config = {ref_table = card}})
                card:start_materialize()
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}