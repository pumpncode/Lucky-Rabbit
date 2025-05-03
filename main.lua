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
            "low_hanging_fruit",
            "nerdcubed",
            "terminal_velocity",
            "nero_the_fool",
            "jazzercise",
            "negative_joker",
            "passport",
            "blue_angel_mushroom",
            "impractical_joker",
            "ferromancy",
            "steve",
            "loonette",
            "pomni"
        },
        directory = "content/jokers/"
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
        directory = "content/vouchers/"
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
            "endless_scarf",
            "knife_throw",
            "fire_breath",
            "trapeze",
            "soully"
        },
        directory = 'content/consumables/'
    },
    blinds = {
        list = {
            "hoard",
            "tool",
            "baby",
            "priest",
            "dice",
            "light",
            "elder",
            "flux",
            "final_sword",
            "final_shield",
            "final_horn",
        },
        directory = "content/blinds/"
    },
    decks = {
        list = {
            "clown",
            "fennex",
            "harmony",
            "reaper",
            "recursive",
        },
        directory = "content/decks/"
    },
    tags = {
        list = {
            "goofy",
            "lunchbreak",
            "boost",
            "appraisal",
        },
        directory = "content/tags/"
    },
    boosters = {
        list = {
            "boosters" -- just using one file for ease of use
        },
        directory = "content/boosters/"
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

-- functions

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

local set_spritesref = Card.set_sprites
function Card:set_sprites(_center, _front)
	set_spritesref(self, _center, _front)
	if _center and _center.name == "c_fmod_soully" then
		self.children.floating_sprite = Sprite(
			self.T.x,
			self.T.y,
			self.T.w,
			self.T.h,
			G.ASSET_ATLAS[_center.atlas or _center.set],
			{ x = 2, y = 2 }
		)
		self.children.floating_sprite.role.draw_major = self
		self.children.floating_sprite.states.hover.can = false
		self.children.floating_sprite.states.click.can = false
	end
end