--- STEAMODDED HEADER
--- MOD_NAME: Aura
--- MOD_ID: Aura
--- MOD_AUTHOR: [MathIsFun_, ChromaPIE, Bard (pearl), Grassy, RattlingSnow353]
--- MOD_DESCRIPTION: Adds animations to Jokers.
--- BADGE_COLOUR: 3469ab
--- VERSION: 0.010a

AnimatedJokers = {
    j_joker = {},
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
    j_loyalty_card = {},
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
    j_scholar = {},
    j_business = {},
    j_supernova = {},
    j_ride_the_bus = {},
    j_space = {},
    j_egg = {},
    j_burglar = {},
    j_blackboard = {},
    j_runner = {},
    j_ice_cream = {},
    j_dna = {},
    j_splash = {},
    j_blue_joker = {},
    j_sixth_sense = {},
    j_constellation = {},
    j_hiker = {},
    j_faceless = { frames_per_row = 4, frames = 24 },
    j_green_joker = {},
    j_superposition = {},
    j_todo_list = {},
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
    j_vagabond = {},
    j_baron = {},
    j_cloud_9 = {},
    j_rocket = {},
    j_obelisk = {},
    j_midas_mask = {},
    j_luchador = {},
    j_photograph = {},
    j_gift = {},
    j_turtle_bean = {},
    j_erosion = {},
    j_reserved_parking = {},
    j_mail = {},
    j_to_the_moon = {},
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
    j_trousers = {},
    j_ancient = {},
    j_ramen = {},
    j_walkie_talkie = {},
    j_selzer = {},
    j_castle = {},
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
    j_blueprint = {},
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

if not SMODS["INIT"] then
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
            --joker override
            SMODS[v.set or "Joker"]:take_ownership(k, {
                atlas = k,
                pos = { x = 0, y = 0 }
            })
        else
            SMODS[v.set or "Joker"]:take_ownership(k,{},true)
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
            if v.frames then
                SMODS.Sprite:new(
                    k,
                    SMODS.findModByID('Aura').path,
                    k .. ".png",
                    v.px or 71,
                    v.py or 95,
                    "asset_atli",
                    v.frames
                ):register()
                SMODS.Jokers[k].atlas = k
                SMODS.Jokers[k].pos = { x = 0, y = 0 }
            end end
        end
    end
end

--Update animated sprites
local upd = Game.update
AnimatedJokersDT = 0

function Game:update(dt)
    upd(self,dt)
    AnimatedJokersDT = AnimatedJokersDT + dt
    if AnimatedJokersDT > 0.1 then
        AnimatedJokersDT = AnimatedJokersDT - 0.1
        for k, v in pairs(AnimatedJokers) do
            if v.frames then
                if not AnimatedJokers[k].individual then
                    local obj = G.P_CENTERS[k]
                    if obj then
                        local loc = obj.pos.y*(AnimatedJokers[k].frames_per_row or AnimatedJokers[k].frames)+obj.pos.x
                        loc = loc + 1
                        if loc >= AnimatedJokers[k].frames then loc = 0 end
                        obj.pos.x = loc%(AnimatedJokers[k].frames_per_row or AnimatedJokers[k].frames)
                        obj.pos.y = math.floor(loc/(AnimatedJokers[k].frames_per_row or AnimatedJokers[k].frames))
                    end
                end
            end
        end
        for _, v in pairs(AnimatedIndividuals) do
            local obj = v.config.center
            local anim = AnimatedJokers[v.config.center_key]
            local loc = obj.pos.y*(anim.frames_per_row or anim.frames)+obj.pos.x
            if v.animation and v.animation.target and loc ~= v.animation.target then
                loc = loc + 1
            end
            if loc >= anim.frames then loc = 0 end
            obj.pos.x = loc%(anim.frames_per_row or anim.frames)
            obj.pos.y = math.floor(loc/(anim.frames_per_row or anim.frames))
        end
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
end

local crl = Node.stop_drag
function Node:stop_drag()
    crl(self)
    if self.config and self.config.center_key == 'j_brainstorm' then
        Aura.add_individual(self)
        self.animation = {target = 0}
    end
end