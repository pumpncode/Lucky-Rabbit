FMOD = {}

FM = SMODS.current_mod
fmod_config = SMODS.current_mod.config

-- file loading

local files = {
    jokers = {
        list = {
            "fennex",
            "generator",
            "terminal_velocity"
        },
        directory = "jokers/"
    },
    vouchers = {
        list = {

        },
        directory = "vouchers/"
    },
    consumables = {
        list = {
            "pie",
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
            "appraisal"
        },
        directory = "tags/"
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
    cards = {
        ["c_fmod_pie"] = true,
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