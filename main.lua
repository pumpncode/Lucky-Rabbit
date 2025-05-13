FMOD = {}

-- config tab
local config = SMODS.current_mod.config

SMODS.current_mod.config_tab = function()
    return {
        n = G.UIT.ROOT,
        config = {align = "cm", padding = 0.05, emboss = 0.05, r = 0.1, colour = G.C.BLACK},
        nodes = {
            {
                n = G.UIT.R,
                config = {align = "cm", minh = 1},
                nodes = {
                    {
                        n = G.UIT.T,
                        config = {text = localize("k_fmod_config_restart"), colour = G.C.RED, scale = 0.5}
                    }
                }
            },
            {
                n = G.UIT.R,
                nodes = {
                    {
                        n = G.UIT.C,
                        nodes = {
                            create_toggle {
                                label = localize("k_fmod_config_jokers"),
                                ref_table = config,
                                ref_value = "jokers_enabled"
                            },
                            create_toggle {
                                label = localize("k_fmod_config_silly"),
                                ref_table = config,
                                ref_value = "silly_enabled"
                            },
                            create_toggle {
                                label = localize("k_fmod_config_vouchers"),
                                ref_table = config,
                                ref_value = "vouchers_enabled"
                            },
                            create_toggle {
                                label = localize("k_fmod_config_tags"),
                                ref_table = config,
                                ref_value = "tags_enabled"
                            },
                        }
                    },
                    {
                        n = G.UIT.C,
                        nodes = {
                            create_toggle {
                                label = localize("k_fmod_config_blinds"),
                                ref_table = config,
                                ref_value = "blinds_enabled"
                            },
                            create_toggle {
                                label = localize("k_fmod_config_decks"),
                                ref_table = config,
                                ref_value = "decks_enabled"
                            },
                            create_toggle {
                                label = "Enable Markings",
                                ref_table = config,
                                ref_value = "markings_enabled"
                            },
                        }
                    }
                }
            }
        }
    }
end


--Optional features
SMODS.optional_features = {
    cardareas = {
        unscored=true,
    }
}


-- file loading

local files = {
    jokers = {
        list = {
            "fennex",
            "despicable_bear",
            "generator",
            "countdown",
            "penny_joker",
            "nero_the_fool",
            "negative_joker",
            "impractical_joker",
            "passport",
            "ferromancy",
            "fragile_sticker",
            "hyperfixation",
            "blue_angel_mushroom",
            "low_hanging_fruit",
            "wordle",
            "nerdcubed",
            "terminal_velocity",
            "jazzercise",
            "steve",
            "pomni",
            "loonette",
        },
        directory = "content/jokers"
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
        directory = "content/vouchers"
    },
    consumables = {
        list = {
            "clown_car",
            "squirt_flower",
            "pie",
            "bang_gun",
            "whoopie_cushion",
            "joy_buzzer",
            "juggler",
            "balloons",
            "split_pants",
            "balloon_animal",
            "tightrope",
            "midway_games",
            "rodeo",
            "trapeze",
            "endless_scarf",
            "knife_throw",
            "fire_breath",
            "greasepaint",
            "unicycle",
            "cannon",
            "soully"
        },
        directory = 'content/consumables'
    },
    blinds = {
        list = {
            "hoard",
            "tool",
            "baby",
            "priest",
            "light",
            "elder",
            "dice",
            "flux",
            "final_horn",
            "final_sword",
            "final_shield",
        },
        directory = "content/blinds"
    },
    decks = {
        list = {
            "clown",
            "fennex",
            "harmony",
            "reaper",
            "recursive",
        },
        directory = "content/decks"
    },
    tags = {
        list = {
            "goofy",
            "lunchbreak",
            "boost",
            "appraisal",
        },
        directory = "content/tags"
    },
    boosters = {
        list = {
            "boosters" -- just using one file for ease of use
        },
        directory = "content/boosters"
    },
    markings = {
        list = {
            "crease_mark",
            "pinhole_mark",
            "ink_mark"
        },
        directory = "content/markings"
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

SMODS.Atlas {
    key = "Decks",
    path = "Decks.png",
    px = 71,
    py = 95
}

-- load everything

function FMOD.load_files(items, path)
    for i = 1, #items do
        assert(SMODS.load_file(path .. "/" .. items[i] .. '.lua'))()
    end
end

if config.jokers_enabled then
    FMOD.load_files(files.jokers.list, files.jokers.directory)
end

if config.silly_enabled then
    -- register silly packs
    SMODS.ConsumableType {
        key = 'Silly',
        primary_colour = HEX('f4d494'),
        secondary_colour = HEX('db8787'),
        collection_rows = { 5, 6 },
        default = 'c_fmod_pie',
        shop_rate = 0,
        cards = {
            ["c_fmod_clown_car"] = true,
            ["c_fmod_squirt_flower"] = true,
            ["c_fmod_pie"] = true,
            ["c_fmod_bang_gun"] = true,
            ["c_fmod_whoopie_cushion"] = true,
            ["c_fmod_joy_buzzer"] = true,
            ["c_fmod_juggler"] = true,
            ["c_fmod_balloons"] = true,
            ["c_fmod_split_pants"] = true,
            ["c_fmod_midway_games"] = true,
            ["c_fmod_balloon_animal"] = true,
            ["c_fmod_tightrope"] = true,
            ["c_fmod_soully"] = true,
            ["c_fmod_fire_breath"] = true,
            ["c_fmod_rodeo"] = true,
            ["c_fmod_endless_scarf"] = true,
            ["c_fmod_knife_throw"] = true,
            ["c_fmod_trapeze"] = true,
            ["c_fmod_greasepaint"] = true,
            ["c_fmod_unicycle"] = true,
            ["c_fmod_cannon"] = true,
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
    FMOD.load_files(files.consumables.list, files.consumables.directory)
    FMOD.load_files(files.boosters.list, files.boosters.directory)
end

if config.vouchers_enabled then
    FMOD.load_files(files.vouchers.list, files.vouchers.directory)
end

if config.blinds_enabled then
    FMOD.load_files(files.blinds.list, files.blinds.directory)
end

if config.decks_enabled then
    FMOD.load_files(files.decks.list, files.decks.directory)
end

if config.tags_enabled then
    FMOD.load_files(files.tags.list, files.tags.directory)
end

-- various functions and hooks

local base_calculate_joker = Card.calculate_joker
function Card.calculate_joker(self,context)
    local ret = base_calculate_joker(self, context)
    if context.joker_main then
        if self.force_trigger then
            self.force_trigger = false
            if self.ability.t_chips > 0 then
                return {
                    message = localize{type='variable',key='a_chips',vars={self.ability.t_chips}},
                    chip_mod = self.ability.t_chips
                }
            end
            if self.ability.t_mult > 0 then
                return {
                    message = localize{type='variable',key='a_mult',vars={self.ability.t_mult}},
                    mult_mod = self.ability.t_mult
                }
            end
            if self.ability.Xmult > 0 then
                return {
                    message = localize{type='variable',key='a_xmult',vars={self.ability.x_mult}},
                    colour = G.C.RED,
                    Xmult_mod = self.ability.x_mult
                }
            end
        end
    end
    return ret
end

local base_modify_hand = Blind.modify_hand
function Blind:modify_hand(cards, poker_hands, text, mult, hand_chips)
    local mult, hand_chips, modded = base_modify_hand(self, cards, poker_hands, text, mult, hand_chips)

    if G.GAME.new_poker_hand then

        G.GAME.hands[G.GAME.old_poker_hand].played = G.GAME.hands[G.GAME.old_poker_hand].played - 1
        G.GAME.hands[G.GAME.old_poker_hand].played_this_round = G.GAME.hands[G.GAME.old_poker_hand].played_this_round - 1

        G.GAME.hands[G.GAME.new_poker_hand].played = G.GAME.hands[G.GAME.new_poker_hand].played + 1
        G.GAME.hands[G.GAME.new_poker_hand].played_this_round = G.GAME.hands[G.GAME.new_poker_hand].played_this_round + 1

        G.GAME.last_hand_played = G.GAME.new_poker_hand
        set_hand_usage(G.GAME.new_poker_hand)
        G.GAME.hands[G.GAME.new_poker_hand].visible = true

        if self.name == 'The Eye' then

            if self.hands[G.GAME.old_poker_hand] then
                self.hands[G.GAME.old_poker_hand] = false
            end
            self.hands[G.GAME.new_poker_hand] = true

        elseif self.name == 'The Mouth' then

            self.only_hand = G.GAME.new_poker_hand

        end

        mult = G.GAME.hands[G.GAME.new_poker_hand].mult
        hand_chips = G.GAME.hands[G.GAME.new_poker_hand].chips
        modded = false

        G.GAME.new_poker_hand = false

    end

    return mult, hand_chips, modded
end

local gnb = get_new_boss
function FMOD.get_new_boss()
    if G.GAME.selected_back.effect.center.key == "b_fmod_reaper" then
		local boss = tostring(FMOD.random_showdown_blind('reaper'))
		if boss then G.FORCE_BOSS = boss end
	else
		G.FORCE_BOSS = nil
	end
    local gnb_val = gnb()

    G.FORCE_BOSS = nil

    return gnb_val
end

function FMOD.random_showdown_blind(seed)
    local eligible_bosses = {}
    for k, v in pairs(G.P_BLINDS) do
        if not v.boss then
        elseif v.boss.showdown then
            eligible_bosses[k] = true
        elseif not v.boss.showdown then
            eligible_bosses[k] = nil
        end
    end
    for k, v in pairs(G.GAME.banned_keys) do
        if eligible_bosses[k] then eligible_bosses[k] = nil end
    end
    local _, boss = pseudorandom_element(eligible_bosses, pseudoseed(seed or 'seed'))
    return boss
end

local reroll_ref = G.FUNCS.reroll_boss
G.FUNCS.reroll_boss = function(e)
	if G.GAME.selected_back.effect.center.key == "b_fmod_reaper" then
		local boss = tostring(FMOD.random_showdown_blind('reaper'))
		if boss then G.FORCE_BOSS = boss end
	else
		G.FORCE_BOSS = nil
	end
	local reroll_val = reroll_ref(e)

    G.FORCE_BOSS = nil

	return reroll_val
end

function FMOD.reset_hyperfix_rank()
    G.GAME.current_round.hyperfix_card.rank = 'Ace'
    local valid_hyperfix_cards = {}
    for k, v in ipairs(G.playing_cards) do
        if not SMODS.has_no_rank(v) then
            valid_hyperfix_cards[#valid_hyperfix_cards+1] = v
        end
    end
    if valid_hyperfix_cards[1] then
        local hyperfix_card = pseudorandom_element(valid_hyperfix_cards, pseudoseed('hyperfix'..G.GAME.round_resets.ante))
        G.GAME.current_round.hyperfix_card.rank = hyperfix_card.base.value
        G.GAME.current_round.hyperfix_card.id = hyperfix_card.base.id
    end
end

function FMOD.reset_hyperfix_full_card(type)
    local rank = 'Ace'
    local suit = 'Spades'
    local id = 14
    local valid_hyperfix_cards = {}
    for k, v in ipairs(G.playing_cards) do
        if not SMODS.has_no_rank(v) and not SMODS.has_no_suit(v) then
            valid_hyperfix_cards[#valid_hyperfix_cards+1] = v
        end
    end
    if valid_hyperfix_cards[1] then
        local hyperfix_card = pseudorandom_element(valid_hyperfix_cards, pseudoseed('hyperfix_'..G.GAME.round_resets.ante))
        rank = hyperfix_card.base.value
        suit = hyperfix_card.base.suit
        id = hyperfix_card.base.id
    end
    if type == 'rank' then
        return rank, id
    elseif type == 'suit' then
        return suit
    end
end

function FMOD.get_food_jokers(seed)
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
    local key = pseudorandom_element(possible_jokers, pseudoseed(seed)) or 'j_gros_michel'
    return key
end

function FMOD.get_fmod_legendaries(seed)
    local possible_jokers = {}
    if G.P_CENTER_POOLS.Joker then for k, v in pairs(G.P_CENTER_POOLS.Joker) do
        if v.pools and v.pools.Fmod_Legendary then
            possible_jokers[#possible_jokers+1] = v.key
        end
    end
    end
    local key = pseudorandom_element(possible_jokers, pseudoseed(seed)) or 'j_fmod_steve'
    return key
end

local shuffle_ref = CardArea.shuffle
function CardArea:shuffle(_seed)
    local g = shuffle_ref(self, _seed)
    if self == G.deck then
        local priorities = {}
        local others = {}
        for k, v in pairs(self.cards) do
            if FMOD.has_marking(v) == 'fmod_crease_mark' then
                table.insert(priorities, v)
            else
                table.insert(others, v)
            end
        end
        for _, card in ipairs(priorities) do
            table.insert(others, card)
        end
        self.cards = others
        self:set_ranks()
    end
    return g
end

function FMOD.is_marking(str)
    for _, v in ipairs(FMOD.ENABLED_MARKINGS) do
        if 'fmod_' .. v == str then
            return true
        end
    end
end

function FMOD.has_marking(card)
    for k, v in pairs(card and card.ability or {}) do
        if FMOD.is_marking(k) then
            return k, v
        end
    end
end
function FMOD.set_marking(card, mark)
    local key = 'fmod_' .. mark .. '_mark'
    if card and FMOD.is_marking(key) then
        -- remove existing marks before applying
        for k, _ in pairs(card.ability) do
            if FMOD.is_marking(k) then
                card.ability[k] = nil
            end
        end

        SMODS.Stickers[key]:apply(card, true)
    end
end

function FMOD.marking_tooltip(mark)
    local key = 'fmod_' .. mark .. '_mark'
    local marking = SMODS.Stickers[key]
    local vars = {}
    if not marking then return end
    if marking.loc_vars then
        local dummy_card = { ability = {} }
        marking:apply(dummy_card, true)
        vars = marking:loc_vars({}, dummy_card).vars
    end
    return {
        set = 'Other',
        key = key,
        vars = vars
    }
end

-- define marking objects

if config.markings_enabled then
    FMOD.Marking = SMODS.Sticker:extend {
        prefix_config = { key = true },
        should_apply = false,
        config = {},
        rate = 0,
        sets = {
            Default = true
        },

        draw = function(self, card)
            G.shared_stickers[self.key].role.draw_major = card
            G.shared_stickers[self.key]:draw_shader('dissolve', nil, nil, nil, card.children.center, nil, nil)
        end,

        apply = function(self, card, val)
            card.ability[self.key] = val and copy_table(self.config) or nil
        end
    }
    SMODS.current_mod.custom_collection_tabs = function()
        return {
            UIBox_button(
                {
                    button = "your_collection_fmod_markings",
                    id = "your_collection_fmod_markings",
                    label = { "Markings" },
                    minw = 5,
                    minh = 1
                }
            )
        }
    end

    local function markings_ui()
        local markings = {}
        for k, v in pairs(SMODS.Stickers) do
            if FMOD.is_marking(k) then
                markings[k] = v
            end
        end
        return SMODS.card_collection_UIBox(
            markings,
            { 5, 5 },
            {
                snap_back = true,
                hide_single_page = true,
                collapse_single_page = true,
                center = "c_base",
                h_mod = 1.03,
                back_func = "your_collection_other_gameobjects",
                modify_card = function(card, center)
                    card.ignore_pinned = true
                    center:apply(card, true)
                end
            }
        )
    end

    G.FUNCS.your_collection_fmod_markings = function()
        G.SETTINGS.paused = true
        G.FUNCS.overlay_menu {
            definition = markings_ui()
        }
    end

    local function wrap_without_markings(func)
        -- remove from SMODS.Stickers just for this call
        local removed = {}
        for k, v in pairs(SMODS.Stickers) do
            if FMOD.is_marking(k) then
                removed[k] = v
                SMODS.Stickers[k] = nil
            end
        end
        local ret = func()
        -- add them back once the UI was created
        for k, v in pairs(removed) do
            SMODS.Stickers[k] = v
        end
        return ret
    end
    -- override the creation of the 'Stickers' tab in the collection
    local stickers_ui_ref = create_UIBox_your_collection_stickers
    create_UIBox_your_collection_stickers = function()
        return wrap_without_markings(stickers_ui_ref)
    end
    -- override the creation of the 'Stickers' tab in our 'Additions' tab
    local other_objects_ref = create_UIBox_Other_GameObjects
    create_UIBox_Other_GameObjects = function()
        return wrap_without_markings(other_objects_ref)
    end

    FMOD.ENABLED_MARKINGS = {
        "crease_mark",
        "pinhole_mark",
        "ink_mark"
    }
    FMOD.load_files(files.markings.list, files.markings.directory)
end

-- PEPPERED friends of jimbo skins

SMODS.Atlas {
    key = 'peppered_diamonds_lc',
    path = 'collabs/peppered_diamonds_lc.png',
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = 'peppered_diamonds_hc',
    path = 'collabs/peppered_diamonds_hc.png',
    px = 71,
    py = 95
}


SMODS.DeckSkin {
    key = "peppered_diamonds",
    suit = "Diamonds",
    loc_txt = "PEPPERED",
    palettes = {
        {
            key = 'lc',
            ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'},
            display_ranks = {'Ace', 'King', 'Queen', 'Jack', '10'},
            pos_style = 'ranks',
            atlas = 'fmod_peppered_diamonds_lc'
        },
        {
            key = 'hc',
            ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'},
            display_ranks = {'Ace', 'King', 'Queen', 'Jack', '10'},
            pos_style = 'ranks',
            atlas = 'fmod_peppered_diamonds_hc'
        }
    },
}
