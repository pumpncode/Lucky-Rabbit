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
                    "a {C:attention}Voucher{} to the next shop",
                    "{C:inactive,s:0.8}(#2# remaining)"
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