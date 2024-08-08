--- STEAMODDED HEADER
--- MOD_NAME: Aura
--- MOD_ID: Aura
--- MOD_AUTHOR: [MathIsFun_, ChromaPIE, Bard, Grassy311, RattlingSnow353, Solace, RadicaAprils]
--- MOD_DESCRIPTION: Adds animations to Jokers.
--- BADGE_COLOUR: 3469ab
--- VERSION: 0.022

AnimatedJokers = {
    j_joker = { frames_per_row = 11, frames = 22 },
    j_greedy_joker = { frames = 12 },
    j_lusty_joker = { frames_per_row = 5, frames = 20 },
    j_wrathful_joker = { frames_per_row = 1, frames = 18 },
    j_gluttenous_joker = { frames = 12 },
    j_jolly = {},
    j_zany = {},
    j_mad = {},
    j_crazy = {},
    j_droll = {},
    j_sly = {},
    j_wily = {},
    j_clever = {},
    j_devious = {},
    j_crafty = {},
    j_half = {},
    j_stencil = {},
    j_four_fingers = {},
    j_mime = {},
    j_credit_card = {},
    j_ceremonial = {},
    j_banner = {},
    j_mystic_summit = {},
    j_marble = {},
    j_loyalty_cfard = {},
    j_8_ball = {},
    j_misprint = {},
    j_dusk = {},
    j_raised_fist = { frames_per_row = 4, frames = 14 },
    j_chaos = {},
    j_fibonacci = {},
    j_steel_joker = {},
    j_scary_face = {},
    j_abstract = {},
    j_delayed_grat = {},
    j_hack = { frames_per_row = 8, frames = 64 },
    j_pareidolia = {},
    j_gros_michel = {},
    j_even_steven = {},
    j_odd_todd = {},
    j_scholar = { frames_per_row = 9, frames = 45 },
    j_business = {},
    j_supernova = {},
    j_ride_the_bus = {},
    j_space = {},
    j_egg = {},
    j_burglar = {},
    j_blackboard = { frames_per_row = 9, frames = 59, individual = true },
    j_runner = {},
    j_ice_cream = {},
    j_dna = {},
    j_splash = {},
    j_blue_joker = {},
    j_sixth_sense = { frames = 13, extra = { frames = 20 } }, --todo: card destroy animation
    j_constellation = { frames_per_row = 6, frames = 60},
    j_hiker = {},
    j_faceless = { frames_per_row = 4, frames = 24 },
    j_green_joker = {},
    j_superposition = {},
    j_todo_list = { frames_per_row = 12, frames = 96 }, --todo: animate on trigger
    j_cavendish = {},
    j_card_sharp = {},
    j_red_card = { frames_per_row = 19, frames = 349 },
    j_madness = {},
    j_square = {},
    j_seance = {},
    j_riff_raff = {},
    j_vampire = {},
    j_shortcut = {},
    j_hologram = {},
    j_vagabond = { frames = 30, fps = 5 },
    j_baron = {},
    j_cloud_9 = {},
    j_rocket = {},
    j_obelisk = {},
    j_midas_mask = {},
    j_luchador = {},
    j_photograph = { frames = 48 },
    j_gift = {},
    j_turtle_bean = {},
    j_erosion = {},
    j_reserved_parking = {},
    j_mail = {},
    j_to_the_moon = { frames_per_row = 10, frames = 50},
    j_hallucination = {},
    j_fortune_teller = {},
    j_juggler = {},
    j_drunkard = {},
    j_stone = {},
    j_golden = {},
    j_lucky_cat = {},
    j_baseball = {},
    j_bull = {},
    j_diet_cola = {},
    j_trading = {},
    j_flash = {},
    j_popcorn = {},
    j_trousers = { frames = 48 },
    j_ancient = {},
    j_ramen = {},
    j_walkie_talkie = {},
    j_selzer = {},
    j_castle = { frames_per_row = 9, frames = 69, start_frame = 0, extra = { frames_per_row = 5, frames = 5, fps = 5, start_frame = 0 } },
    j_smiley = {},
    j_campfire = {},
    j_ticket = {},
    j_mr_bones = {},
    j_acrobat = {},
    j_sock_and_buskin = {},
    j_swashbuckler = {},
    j_troubadour = {},
    j_certificate = {},
    j_smeared = {},
    j_throwback = {},
    j_hanging_chad = {},
    j_rough_gem = {},
    j_bloodstone = {},
    j_arrowhead = {},
    j_onyx_agate = {},
    j_glass = {},
    j_ring_master = {},
    j_flower_pot = { frames = 24 },
    j_blueprint = { frames_per_row = 8, frames = 44, individual = true },
    j_wee = {},
    j_merry_andy = {},
    j_oops = {},
    j_idol = {},
    j_seeing_double = {},
    j_matador = {},
    j_hit_the_road = {},
    j_duo = {},
    j_trio = {},
    j_family = {},
    j_order = {},
    j_tribe = {},
    j_stuntman = {},
    j_invisible = {},
    j_brainstorm = { frames_per_row = 8, frames = 39, individual = true },
    j_satellite = {},
    j_shoot_the_moon = {},
    j_drivers_license = {},
    j_cartomancer = {},
    j_astronomer = {},
    j_burnt = {},
    j_bootstraps = {},
    j_caino = {},
    j_triboulet = {},
    j_yorick = {},
    j_chicot = {},
    j_perkeo = {}
}
AnimatedIndividuals = {}

Aura = {}
Aura.LayeredCards = {}
function Aura.add_individual(card)
    if not card.animated then
        AnimatedIndividuals[#AnimatedIndividuals+1] = card
        card.animated = true
        local center_copy = {}
        for k, v in pairs(card.config.center) do
            center_copy[k] = v
        end
        center_copy.pos = {x = card.config.center.pos.x, y = card.config.center.pos.y}
        card.config.center = center_copy
        card:set_sprites(card.config.center)
    end
end

if SMODS.Atlas then
    --Register all Jokers/Sprites
    for i = 1, 150 do
        local k = G.P_CENTER_POOLS.Joker[i].key
        local v = AnimatedJokers[k]
        if v and v.frames then
            --sprite
            SMODS.Atlas {
                key = k,
                path = k .. ".png",
                px = v.px or 71,
                py = v.py or 95
            }
            if v.extra then
                SMODS.Atlas {
                    key = k.."_extra",
                    path = k .. "_extra.png",
                    px = v.px or 71,
                    py = v.py or 95
                }
            end
            --joker override
            SMODS[v.set or "Joker"]:take_ownership(k, {
                atlas = k,
                pos = { x = 0, y = 0, extra = v.extra and {x = 0, y = 0, atlas = "aura_"..k.."_extra"} },
            })
        else
            SMODS[v and v.set or "Joker"]:take_ownership(k,{},true)
        end
    end
else
    local init = SMODS["INIT"]
    function init.Aura()
        --0.9.8 compat by @ChromaPIE
        --Register all Jokers/Sprites
        for i = 1, 150 do
            local k = G.P_CENTER_POOLS.Joker[i].key
            local v = AnimatedJokers[k]
            if v then
            --joker override
            SMODS[v.set or "Joker"]:take_ownership(k):register()
            --sprite
            --todo: add extra layer, waiting unitl 0.9.8 compat is fixed
            if v.frames then
                SMODS.Sprite:new(
                    k,
                    SMODS.findModByID('Aura').path,
                    k .. ".png",
                    v.px or 71,
                    v.py or 95,
                    "asset_atli"
                ):register()
                SMODS.Jokers[k].atlas = k
                SMODS.Jokers[k].pos = { x = 0, y = 0 }
                if v.extra then
                    SMODS.Sprite:new(
                        k .. "_extra",
                        SMODS.findModByID('Aura').path,
                        k .. "_extra.png",
                        v.px or 71,
                        v.py or 95,
                        "asset_atli"
                    ):register()
                    SMODS.Jokers[k].pos.extra = { x = 0, y = 0, atlas = k .. "_extra"}
                end
            end end
        end
    end
end

--Update animated sprites
local upd = Game.update

function Aura.update_frame(dt, k, obj, jkr)
    if AnimatedJokers[k] and obj and (AnimatedJokers[k].frames or AnimatedJokers[k].individual) then
        local next_frame = false
        local next_frame_extra = false
        local anim = AnimatedJokers[k]
        if anim.individual then
            if jkr then
                if not jkr.animation then jkr.animation = {} end
                if not jkr.animation.t then jkr.animation.t = 0 end
                jkr.animation.t = jkr.animation.t + dt
                if jkr.animation.t > 1/(jkr.animation.fps or 10) then
                    jkr.animation.t = jkr.animation.t - 1/(jkr.animation.fps or 10)
                    next_frame = true
                end
                if jkr.animation.extra then
                    if not jkr.animation.extra.t then jkr.animation.extra.t = 0 end
                    jkr.animation.extra.t = jkr.animation.extra.t + dt
                    if jkr.animation.extra.t > 1/(jkr.animation.extra.fps or 10) then
                        jkr.animation.extra.t = jkr.animation.extra.t - 1/(jkr.animation.extra.fps or 10)
                        next_frame_extra = true
                    end
                end
            end
        else
            if not anim.t then anim.t = 0 end
            anim.t = anim.t + dt
            if anim.t > 1/(anim.fps or 10) then
                anim.t = anim.t - 1/(anim.fps or 10)
                next_frame = true
            end
            if anim.extra then
                if not anim.extra.t then anim.extra.t = 0 end
                anim.extra.t = anim.extra.t + dt
                if anim.extra.t > 1/(anim.extra.fps or 10) then
                    anim.extra.t = anim.extra.t - 1/(anim.extra.fps or 10)
                    next_frame_extra = true
                end
            end
        end
        if next_frame then
            local loc = obj.pos.y*(anim.frames_per_row or anim.frames)+obj.pos.x
            if (not anim.individual) or (jkr and jkr.animation.target and loc ~= jkr.animation.target) then
                loc = loc + 1
            end
            if loc >= anim.frames then loc = anim.start_frame or 0 end
            obj.pos.x = loc%(anim.frames_per_row or anim.frames)
            obj.pos.y = math.floor(loc/(anim.frames_per_row or anim.frames))
        end
        if next_frame_extra then
            local loc = obj.pos.extra.y*(anim.extra.frames_per_row or anim.extra.frames)+obj.pos.extra.x
            if (not anim.individual) or (jkr and jkr.animation.extra and jkr.animation.extra.target and loc ~= jkr.animation.extra.target) then
                loc = loc + 1
            end
            if loc >= anim.extra.frames then loc = anim.extra.start_frame or 0 end
            obj.pos.extra.x = loc%(anim.extra.frames_per_row or anim.extra.frames)
            obj.pos.extra.y = math.floor(loc/(anim.extra.frames_per_row or anim.extra.frames))
        end
    end
end

function Game:update(dt)
    upd(self,dt)
    for k, v in pairs(AnimatedJokers) do
        Aura.update_frame(dt, k, G.P_CENTERS[k])
    end
    for _, v in pairs(AnimatedIndividuals) do
        Aura.update_frame(dt, v.config.center_key, v.config.center, v)
    end
end

--On Click/Release Animations
local ccl = Node.set_offset
function Node:set_offset(x,y)
    ccl(self,x,y)
    if y == "Click" and self.config and self.config.center_key == 'j_brainstorm' and (G.shop_jokers and self.area ~= G.shop_jokers or true) then
        Aura.add_individual(self)
        self.animation = {target = 5}
    end
    if y == "Click" and self.config and self.config.center_key == 'j_blueprint' and (G.shop_jokers and self.area ~= G.shop_jokers or true) then
        Aura.add_individual(self)
        self.animation = {target = 16}
    end
end

local crl = Node.stop_drag
function Node:stop_drag()
    crl(self)
    if self.config and (self.config.center_key == 'j_brainstorm' or self.config.center_key == 'j_blueprint') then
        Aura.add_individual(self)
        self.animation = {target = 0}
    end
end

--Sprite setting for multiple layers
local css = Card.set_sprites
function Card:set_sprites(c, f)
    css(self, c,f)
    if self.config.center and self.config.center.pos and self.config.center.pos.extra and self.config.center.pos.extra.atlas then
        if not self.children.front then
            self.children.front = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS[self.config.center.pos.extra.atlas], self.config.card.pos)
            self.children.front.states.hover = self.states.hover
            self.children.front.states.click = self.states.click
            self.children.front.states.drag = self.states.drag
            self.children.front.states.collide.can = false
            self.children.front:set_role({major = self, role_type = 'Glued', draw_major = self})
        else
            self.children.front:set_sprite_pos(self.config.center.pos.extra)
        end
    end
end
local cd = Card.draw
function Card:draw(layer)
    if self.config and self.config.center and self.config.center.pos and self.config.center.pos.extra and self.config.center.pos.extra.atlas then self:set_sprites() end
    cd(self,layer)
end

--Castle
function Aura.castle_suit_num(suit)
    if (suit == "Spades") then return 0 end
    if (suit == "Hearts") then return 5 end
    if (suit == "Clubs") then return 10 end
    if (suit == "Diamonds") then return 15 end
    if (suit == "Moons") then return 25 end
    if (suit == "Stars") then return 30 end
    return 20
end
local rcc = reset_castle_card
function reset_castle_card(dont_reset)
    if not dont_reset then rcc() end
    local new_suit = G.GAME.current_round.castle_card.suit or 'Spades'
    local anim_offset = Aura.castle_suit_num(new_suit)
    AnimatedJokers.j_castle.extra.frames = anim_offset+5
    AnimatedJokers.j_castle.extra.start_frame = anim_offset
    G.P_CENTERS["j_castle"].pos.extra.y = anim_offset/5
    if (new_suit == "Moons" or new_suit == "Stars") then
        if AnimatedJokers.j_castle.start_frame == 0 then
            AnimatedJokers.j_castle.start_frame = 72
            AnimatedJokers.j_castle.frames = 94
            G.P_CENTERS["j_castle"].pos.y = 8
        end
    else
        if AnimatedJokers.j_castle.start_frame == 72 then
            AnimatedJokers.j_castle.start_frame = 0
            AnimatedJokers.j_castle.frames = 69
            G.P_CENTERS["j_castle"].pos.y = 0
        end
    end
end
local gsr = Game.start_run
function Game:start_run(args)
    --don't mess up on save load
    gsr(self,args)
    reset_castle_card(true)
end

--On trigger effects
local cj = Card.calculate_joker
function Card:calculate_joker(context)
    local ret1, ret2 = cj(self, context)

    --Blackboard
    if self.ability.name == "Blackboard" and context.cardarea == G.jokers and context.joker_main then
        local black_suits, all_cards = 0, 0
        for k, v in ipairs(G.hand.cards) do
            all_cards = all_cards + 1
            if v:is_suit('Clubs', nil, true) or v:is_suit('Spades', nil, true) then
                black_suits = black_suits + 1
            end
        end
        if black_suits == all_cards then
            --triggered
            G.E_MANAGER:add_event(Event({
                func = (function()
                    Aura.add_individual(self)
                    self.animation = {target = 0}
                    self.config.center.pos.x = 1 --start on second frame
                    return true
                end)
            }))
        end
    end

    return ret1, ret2
end

--There's a bug with this function in 0.9.8 that screws up the joker pool
--So we just override it to fix our problems
if SMODS.injectJokers then
    function SMODS.injectJokers()
        local minId = table_length(G.P_CENTER_POOLS['Joker']) + 1
        local id = 0
        local i = 0
        local joker = nil
        for k, slug in ipairs(SMODS.BUFFERS.Jokers) do
            joker = SMODS.Jokers[slug]
            if joker.order then
                id = joker.order
            else
                i = i + 1
                id = i + minId
            end
            local joker_obj = {
                discovered = joker.discovered,
                name = joker.name,
                set = "Joker",
                unlocked = joker.unlocked,
                order = id,
                key = joker.slug,
                pos = joker.pos,
                config = joker.config,
                rarity = joker.rarity,
                blueprint_compat = joker.blueprint_compat,
                eternal_compat = joker.eternal_compat,
                effect = joker.effect,
                cost = joker.cost,
                cost_mult = 1.0,
                atlas = joker.atlas or nil,
                mod_name = joker.mod_name,
                badge_colour = joker.badge_colour,
                soul_pos = joker.soul_pos,
                -- * currently unsupported
                no_pool_flag = joker.no_pool_flag,
                yes_pool_flag = joker.yes_pool_flag,
                unlock_condition = joker.unlock_condition,
                enhancement_gate = joker.enhancement_gate,
                start_alerted = joker.start_alerted
            }
            for _i, sprite in ipairs(SMODS.Sprites) do
                if sprite.name == joker_obj.key then
                    joker_obj.atlas = sprite.name
                end
            end
    
            -- Now we replace the others
            G.P_CENTERS[slug] = joker_obj
            if not joker.taken_ownership then
                table.insert(G.P_CENTER_POOLS['Joker'], joker_obj)
                table.insert(G.P_JOKER_RARITY_POOLS[joker_obj.rarity], joker_obj)
            else
                for kk, v in ipairs(G.P_CENTER_POOLS['Joker']) do
                    if v.key == slug then G.P_CENTER_POOLS['Joker'][kk] = joker_obj end
                end
                if joker_obj.rarity == joker.rarity_original then
                    for kk, v in ipairs(G.P_JOKER_RARITY_POOLS[joker_obj.rarity]) do
                        if v.key == slug then G.P_JOKER_RARITY_POOLS[joker_obj.rarity][kk] = joker_obj end
                    end
                else
                    table.insert(G.P_JOKER_RARITY_POOLS[joker_obj.rarity], joker_obj)
                    local j
                    for kk, v in ipairs(G.P_JOKER_RARITY_POOLS[joker.rarity_original]) do
                        if v.key == slug then j = kk end
                    end
                    table.remove(G.P_JOKER_RARITY_POOLS[joker.rarity_original], j)
                end
            end
            -- Setup Localize text
            G.localization.descriptions["Joker"][slug] = joker.loc_txt
    
            sendInfoMessage("Registered Joker " .. joker.name .. " with the slug " .. joker.slug .. " at ID " .. id .. ".")
        end
    end
end
