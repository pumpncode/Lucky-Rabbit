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
        }
    },
    misc = {
        dictionary = {
            k_fmod_fuel = "Fueled!",
            k_fmod_drained = "Drained!",
        }
    }
}