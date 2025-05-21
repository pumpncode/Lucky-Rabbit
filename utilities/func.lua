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

local gnb = get_new_boss
function get_new_boss()
    if G.GAME.selected_back.effect.center.key == "b_fmod_reaper" then
		local boss = tostring(LR_UTIL.random_showdown_blind('reaper'))
		if boss then G.FORCE_BOSS = boss end
	else
		G.FORCE_BOSS = nil
	end
    local gnb_val = gnb()

    G.FORCE_BOSS = nil

    return gnb_val
end

function LR_UTIL.random_showdown_blind(seed)
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
		local boss = tostring(LR_UTIL.random_showdown_blind('reaper'))
		if boss then G.FORCE_BOSS = boss end
	else
		G.FORCE_BOSS = nil
	end
	local reroll_val = reroll_ref(e)

    G.FORCE_BOSS = nil

	return reroll_val
end

function LR_UTIL.reset_hyperfix_rank()
    G.GAME.current_round.hyperfix_card.rank = 'Ace'
    local valid_hyperfix_cards = {}
    for k, v in ipairs(G.playing_cards) do
        if not SMODS.has_no_rank(v) then
            valid_hyperfix_cards[#valid_hyperfix_cards+1] = v
        end
    end
    if valid_hyperfix_cards[1] then
        local hyperfix_card = pseudorandom_element(valid_hyperfix_cards, pseudoseed('hyperfix'..G.GAME.round_resets.ante))
        while hyperfix_card.id == G.GAME.hyperfix_card.id do
            hyperfix_card = pseudorandom_element(valid_hyperfix_cards, pseudoseed('hyperfix'..G.GAME.round_resets.ante))
        end
        G.GAME.current_round.hyperfix_card.rank = hyperfix_card.base.value
        G.GAME.current_round.hyperfix_card.id = hyperfix_card.base.id
    end
end

function LR_UTIL.reset_hyperfix_full_card(type)
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

function LR_UTIL.get_food_jokers(seed)
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

function LR_UTIL.get_fmod_legendaries(seed)
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
            if LR_UTIL.has_marking(v) == 'fmod_crease_mark' then
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

function LR_UTIL.is_marking(str)
    for _, v in ipairs(LR_UTIL.ENABLED_MARKINGS) do
        if 'fmod_' .. v == str then
            return true
        end
    end
end

function LR_UTIL.has_marking(card)
    for k, v in pairs(card and card.ability or {}) do
        if LR_UTIL.is_marking(k) then
            return k, v
        end
    end
end
function LR_UTIL.set_marking(card, mark)
    local key = 'fmod_' .. mark .. '_mark'
    if card and LR_UTIL.is_marking(key) then
        -- remove existing marks before applying
        for k, _ in pairs(card.ability) do
            if LR_UTIL.is_marking(k) then
                card.ability[k] = nil
            end
        end

        SMODS.Stickers[key]:apply(card, true)
    end
end

function LR_UTIL.marking_tooltip(mark)
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