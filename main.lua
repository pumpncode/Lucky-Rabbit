FMOD = {}

FM = SMODS.current_mod
fmod_config = SMODS.current_mod.config

-- file loading

local files = {
    jokers = {
        list = {
            "fennex",
            "generator",
            "terminal_velocity",
            "low_hanging_fruit"
        },
        directory = "jokers/"
    },
    vouchers = {
        list = {
            "circus",
            "showtime",
            "reroll_superfluity",
            "buffet",
            "dumpster_ritual",
            "anti_higgs_boson",
            "big_bang",
            "color_swatches",
            "fire_sale",
            "coupon",
            "extreme_couponing",
            "shopaholic"
        },
        directory = "vouchers/"
    },
    consumables = {
        list = {
            "clown_car",
            "squirt_flower",
            "pie",
            "bang_gun",
            "whoopie_cushion",
            "joy_buzzer",
            "midway_games",
        },
        directory = 'consumables/'
    },
    blinds = {
        list = {
            "hoard",
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
            "goofy",
            "appraisal",
        },
        directory = "tags/"
    },
    boosters = {
        list = {
            "boosters" -- just using one file for ease of use
        },
        directory = "boosters/"
    }
}

-- atlases

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

SMODS.Atlas {
	key = "modicon",
	path = "Fennex_Mod_Icon.png",
	px = 32,
	py = 32
}

SMODS.Atlas {
    key = "Vouchers",
    path = "Vouchers.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "Blinds",
    path = "Blinds.png",
    atlas_table = 'ANIMATION_ATLAS',
    frames = 21,
    px = 34,
    py = 34
}

SMODS.Atlas {
    key = "Tags",
    path = "Tags.png",
    px = 34,
    py = 34
}

SMODS.Atlas {
    key = "Boosters",
    path = "Booster.png",
    px = 71,
    py = 95
}

--[[SMODS.Atlas {
    key = "Decks",
    path = "Decks.png",
    px = 71,
    py = 95
}]]--

-- silly packs

SMODS.ConsumableType {
    key = 'Silly',
    primary_colour = HEX('f4d494'),
    secondary_colour = HEX('84b4cc'),
    collection_rows = { 5, 6 },
    default = 'c_fmod_pie',
    shop_rate = 0,
    cards = {
        ["c_fmod_pie"] = true,
        ["c_fmod_clown_car"] = true,
        ["c_fmod_bang_gun"] = true,
        ["c_fmod_squirt_flower"] = true,
        ["c_fmod_whoopie_cushion"] = true,
        ["c_fmod_joy_buzzer"] = true,
        ["c_fmod_midway_games"] = true,
    },
    loc_txt = {
        name = "Silly",
        collection = "Silly Cards",
        undiscovered = {
            name = "Not Discovered",
            text = {
                "Purchase or use",
                "this card in an",
                "unseeded run to",
                "learn what it does"
            }
        }
    },
}

-- load everything

local function load_files(set)
    for i = 1, #files[set].list do
        if files[set].list[i] then assert(SMODS.load_file(files[set].directory .. files[set].list[i] .. '.lua'))() end
    end
end

for k, v in pairs(files) do
    load_files(k)
end