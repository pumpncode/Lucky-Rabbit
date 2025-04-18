return {
    descriptions = {
        Joker = {
            j_fmod_generator = {
                name = "Generator",
                text = {
                        "Retrigger all {C:attention}played cards{},",
                        "{C:red}destroys{} {C:attention}leftmost{} consumable",
                        "at beginning of round",
                        "{C:red}Self destructs{} if no consumables",
                        "can be destroyed"
                },
            },
            j_fmod_fennex = {
                name = "Fennex",
                text = {
                    "Every {C:attention}#1#{} rerolls, add",
                    "a {C:attention}Voucher{} to the shop",
                    "{C:inactive,s:0.8}(#2# remaining)"
                }
            },
            j_fmod_terminal_velocity = {
                name = "Terminal Velocity",
                text = {
                    "Played {C:attention}Wild Cards{} permanently",
                    "gain {X:mult,C:white}X#1#{} Mult"
                }
            },
            j_fmod_low_hanging_fruit = {
                name = "Low Hanging Fruit",
                text = {
                    "Each played {C:attention}6{} or {C:attention}9",
			        "gives {C:mult}+#2#{} Mult and",
			        "{C:chips}+#1#{} Chips when scored"
                }
            },
            j_fmod_nerdcubed = {
                name = "Nerdcubed",
                text = {
                    "Each played {C:attention}3{}",
			        "is retriggered {C:attention}3{} times"
                }
            },
            j_fmod_penny_joker = {
                name = "Penny Joker",
                text = {
                    "Gains {C:chips}+2 Chips{} for",
			        "every card scored.",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
                }
            },
            j_fmod_countdown = {
                name = "Countdown",
                text = {
                    "The next {C:attention}#1#{} scored gives",
			        "{C:mult}+#2#{} Mult, and decreases rank once.",
                    "When an {C:attention}#3#{} is scored, gain {X:mult,C:white}X#4#{}",
                    "Mult and reset to a {C:attention}King{}"
                }
            },
            j_fmod_despicable_bear = {
                name = "Despicable Bear",
                text = {
                    "Played {C:attention}Two Pair{} hands are",
                    "considered {C:attention}Four of a Kind{}",
                    "if played with exactly {C:attention}4{} cards",
                }
            },
            j_fmod_nerothefool = {
                name = "Nero the Fool",
                text = {
                    "If {C:attention}first hand{} of round",
                    "has exactly {C:attention}2{} cards,",
                    "destroy them"
                }
            },
            j_fmod_negativejoker = {
                name = "Negative Joker",
                text = {
                    "{C:chips}+#1#{} Chips, becomes",
                    "{C:attention}Negative{} after {C:attention}#2#{} rounds",
                    "{C:inactive}(Rounds left: {C:attention}#3#{C:inactive})",
                }
            },
            j_fmod_passport = {
                name = "Passport",
                text = {
                    "{C:mult}+#1#{} Mult per unique",
                    "{C:attention}Poker Hand{} played",
                    "{C:inactive}(Currently: {C:mult}+#2#{C:inactive} Mult)",
                }
            }
        },
        Tag = {
            tag_fmod_appraisal = {
                name = "Appraisal Tag",
                text = {
                    "Gives {C:money}$#1#{} for each {C:attention}Enhanced",
                    "{C:attention}Card{} in your full deck",
                    "{C:inactive}(Will give {C:money}$#2#{C:inactive})"
                }
            },
            tag_fmod_goofy = {
                name = "Goofy Tag",
                text = {
                    "Gives a free",
                    "{V:1}Mega Silly Pack{}"
                }
            }
        },
        Blind = {
            bl_fmod_hoard = {
                name = "The Hoard",
                text = {
                    "All number cards",
                    "are drawn face down"
                }
            }
        },
        Back = {
            b_fmod_recursive = {
                name = "Recursive Deck",
                text = {
                    "{C:attention}Joker{}, {C:tarot}Tarot{}, {C:planet}Planet{},",
                    "and {C:spectral}Spectral{} cards may",
                    "appear multiple times",
                }
            },
            b_fmod_fennex = {
                name = "Fennex Deck",
                text = {
                    "Start run with the {C:attention}Fennex{} Joker,",
                    "{C:legendary}Fennex Mod{C:attention} Jokers{} are {X:green,C:white}3X{}",
                    "more likely to appear"
                }
            },
            b_fmod_clown = {
                name = "Clown Deck",
                text = {
                    "Start run with the",
                    "{V:1}#1#{} Voucher"
                }
            }
        },
        Silly = {
            c_fmod_pie = {
                name = "Pie",
                text = {
                    "Select {C:attention}#1#{} cards, copy the {C:attention}rank",
                    "of the {C:attention}left{} card onto the {C:attention}right{}",
                    "card"
                }
            },
            c_fmod_clown_car = {
                name = "Clown Car",
                text = {
                    "Create a random {C:dark_edition}Negative{}",
                    "{C:attention}Joker card"
                }
            },
            c_fmod_bang_gun = {
                name = "Bang Gun",
                text = {
                    "Select {C:attention}#1#{} cards, copy the {C:attention}suit",
                    "of the {C:attention}left{} card onto the {C:attention}right{}",
                    "card"
                }
            },
            c_fmod_squirt_flower = {
                name = "Squirt Flower",
                text = {
                    "Select {C:attention}#1#{} cards, copy the {C:attention}seal",
                    "of the {C:attention}left{} card onto the {C:attention}right{}",
                    "card"
                }
            },
            c_fmod_whoopie_cushion = {
                name = "Whoopie Cushion",
                text = {
                    "Select {C:attention}#1#{} cards, copy the {C:attention}Enhancement",
                    "of the {C:attention}left{} card onto the {C:attention}right{} card"
                }
            },
            c_fmod_joy_buzzer = {
                name = "Joy Buzzer",
                text = {
                    "Select {C:attention}#1#{} cards, copy the {C:dark_edition}Edition",
                    "of the {C:attention}left{} card onto the {C:attention}right{} card"
                }
            },
            c_fmod_midway_games = {
                name = "Midway Games",
                text = {
                    "Gives a {C:attention}Standard Tag{},",
                    "{C:tarot}Charm Tag{}, {C:planet}Meteor Tag{},",
                    "or {C:inactive}Buffoon Tag{}"
                }
            },
            c_fmod_juggler = {
                name = "Juggler",
                text = {
                    "Gain {C:money}$#1#{}. Increases",
                    "by +{C:money}$#2#{} each time",
                    "a Juggler card is",
                    "used in this run"
                }
            },
            c_fmod_balloons = {
                name = "Balloons",
                text = {
                    "Doubles the total {C:chips}Chip value{}",
                    "of every card held in hand"
                }
            },
            c_fmod_split_pants = {
                name = "Split Pants",
                text = {
                    "Decreases rank of",
                    "up to {C:attention}#1#{} selected",
                    "cards by {C:attention}1",
                }
            }
        },
        Voucher = {
            v_fmod_circus = {
                name = "Circus",
                text = {
                    "{V:1}Silly Cards{} can",
                    "be purchased",
                    "in the {C:attention}shop{}"
                }
            },
            v_fmod_showtime = {
                name = "Showtime",
                text = {
                    "{V:1}Silly Cards{} may",
                    "appear in any of",
                    "the {C:tarot}Arcana{} packs"
                }
            },
            v_fmod_reroll_superfluity = {
                name = "Reroll Superfluity",
                text = {
                    "Rerolls only increase",
                    "in price {C:attention}every",
                    "{C:attention}other{} reroll"
                }
            },
            v_fmod_buffet = {
                name = "Buffet",
                text = {
                    "Permanently gain yet",
                    "another {C:blue}+#1#{}",
                    "hands per round"
                }
            },
            v_fmod_dumpster_ritual = {
                name = "Dumpster Ritual",
                text = {
                    "Permanently gain",
                    "yet another {C:red}+#1#{}",
                    "discards each round"
                }
            },
            v_fmod_anti_higgs_boson = {
                name = "Anti-Higgs Boson",
                text = {
                    "Additional {C:dark_edition}+1{} Joker Slot",
                    "{C:inactive}Blank{} and {C:dark_edition}Antimatter{}",
                    "vouchers are reintroduced",
                    " into the voucher pool"
                }
            },
            v_fmod_big_bang = {
                name = "Big Bang",
                text = {
                    "{C:attention}-#1#{} Ante,",
                    "{C:attention}-#2#{} hand size"
                }
            },
            v_fmod_color_swatches = {
                name = "Color Swatches",
                text = {
                    "Permanently gain",
                    "yet another",
                    "{C:attention}+#1#{} hand size"
                }
            },
            v_fmod_fire_sale = {
                name = "Fire Sale",
                text = {
                    "{C:attention}+#1#{} card slot,",
                    "{C:attention}+#2#{} pack slot",
                    "available in shop",
                }
            },
            v_fmod_coupon = {
                name = "Coupon",
                text = {
                    "{C:attention}+#1#{} consumable slot"
                }
            },
            v_fmod_extreme_couponing = {
                name = "Extreme Couponing",
                text = {
                    "{C:attention}+#1#{} additional consumable slot"
                }
            },
            v_fmod_shopaholic = {
                name = "Shopaholic",
                text = {
                    "Add a {C:attention}free{}",
                    "extra {C:attention}booster",
                    "{C:attention}pack{} to the shop"
                }
            }
        },
        Other = {
            p_fmod_silly_small = {
                name = "Silly Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {V:1}Silly{} cards to",
                    "be used immediately"
                }
            },
            p_fmod_silly_small_2 = {
                name = "Silly Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {V:1}Silly{} cards to",
                    "be used immediately"
                }
            },
            p_fmod_silly_small_3 = {
                name = "Silly Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {V:1}Silly{} cards to",
                    "be used immediately"
                }
            },
            p_fmod_silly_small_4 = {
                name = "Silly Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {V:1}Silly{} cards to",
                    "be used immediately"
                }
            },
            p_fmod_silly_jumbo = {
                name = "Jumbo Silly Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {V:1}Silly{} cards to",
                    "be used immediately"
                }
            },
            p_fmod_silly_jumbo_2 = {
                name = "Jumbo Silly Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {V:1}Silly{} cards to",
                    "be used immediately"
                }
            },
            p_fmod_silly_mega = {
                name = "Mega Silly Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {V:1}Silly{} cards to",
                    "be used immediately"
                }
            },
            p_fmod_silly_mega_2 = {
                name = "Mega Silly Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {V:1}Silly{} cards to",
                    "be used immediately"
                }
            },
        }
    },
    misc = {
        dictionary = {
            k_fmod_fuel = "Fueled!",
            k_fmod_drained = "Drained!",
            k_fmod_sillypack = "Silly Pack",
        }
    }
}