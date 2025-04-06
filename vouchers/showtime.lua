SMODS.Voucher {
    key = "showtime",
    atlas = "Vouchers",
    pos = { x = 0, y = 1 },
    cost = 10,
    unlocked = true,
    available = true,
    requires = {"v_fmod_circus"},
    loc_vars = function(self, info_queue, card)
        return { vars = { colours = {HEX("ff98e2")} } }
    end,
}