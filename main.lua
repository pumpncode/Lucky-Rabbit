FMOD = {}

FM = SMODS.current_mod
fmod_config = SMODS.current_mod.config

SMODS.current_mod.config_tab = function()
    return {
        n = G.UIT.ROOT,
        config = {
            align = "tm",
            padding = 0.2,
            minw = 8,
            minh = 2,
            colour = G.C.BLACK,
            r = 0.1,
            hover = true,
            shadow = true,
            emboss = 0.05
        },
        nodes = {
            {
                n = G.UIT.R,
                config = {padding = 0, align = "cm", minh = 0.1},
                nodes = {
                    {
                        n = G.UIT.C,
                        config = {align = "c", padding = 0, minh = 0.1},
                        nodes = {
                            {
                                n = G.UIT.R,
                                config = {padding = 0, align = "cm", minh = 0},
                                nodes = {
                                    {
                                        n = G.UIT.T,
                                        config = {text = "Enable mod Jokers", scale = 0.45, colour = G.C.UI.TEXT_LIGHT}
                                    }
                                }
                            },
                            {
                                n = G.UIT.R,
                                config = {padding = 0, align = "cm", minh = 0},
                                nodes = {
                                    {
                                        n = G.UIT.T,
                                        config = {text = "Requires restart", scale = 0.35, colour = G.C.JOKER_GREY}
                                    }
                                }
                            }
                        }
                    },
                    {
                        n = G.UIT.C,
                        config = {align = "cl", padding = 0.05},
                        nodes = {
                            create_toggle {
                                col = true,
                                label = "",
                                scale = 1,
                                w = 0,
                                shadow = true,
                                ref_table = fmod_config,
                                ref_value = "enableJokers"
                            }
                        }
                    }
                }
            }
        }
    }
end

local files = {
    jokers = {
        list = {
            "fennex",
            "generator",
        },
        directory = "jokers/"
    },
    vouchers = {
        list = {

        },
        directory = "vouchers/"
    },
    silly = {
        list = {

        },
        directory = 'consumables/'
    },
    blinds = {
        list = {

        },
        directory = "blinds/"
    },
    decks = {
        list = {

        },
        directory = "decks/"
    },
    tags = {
        list = {

        },
        directory = "tags/"
    }
}

SMODS.Atlas {
    key = "Jokers",
    path = "Jokers.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "Consumables",
    path = "Consumables.png",
    px = 71,
    py = 95,
}

SMODS.Atlas({
	key = "modicon",
	path = "Fennex_Mod_Icon.png",
	px = 32,
	py = 32
})

SMODS.Atlas {
    key = "Vouchers",
    path = "Vouchers.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "Blinds",
    path = "Blinds.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "Tags",
    path = "Tags.png",
    px = 71,
    py = 95
}

--[[SMODS.Atlas {
    key = "Decks",
    path = "Decks.png",
    px = 71,
    py = 95
}]]--

local function load_files(set)
    for i = 1, #files[set].list do
        if files[set].list[i] then assert(SMODS.load_file(files[set].directory .. files[set].list[i] .. '.lua'))() end
    end
end

for k, v in pairs(files) do
    load_files(k)
end