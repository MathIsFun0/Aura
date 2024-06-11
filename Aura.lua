--- STEAMODDED HEADER
--- MOD_NAME: Aura
--- MOD_ID: Aura
--- MOD_AUTHOR: [MathIsFun_, Bard (pearl), Grassy, RattlingSnow353]
--- MOD_DESCRIPTION: Adds animations to Jokers.
--- BADGE_COLOUR: 3469ab
--- VERSION: 0.008a

AnimatedJokers = {
    j_wrathful_joker = {frames_per_row = 1, frames = 18},
    j_greedy_joker = {frames = 12},
    j_gluttenous_joker = {frames = 12},
    j_lusty_joker = {frames_per_row = 5, frames = 20},
    j_raised_fist = {frames_per_row = 4, frames = 14},
    j_faceless = {frames_per_row = 4, frames = 24},
    j_flower_pot = {frames = 24},
    j_red_card = {frames_per_row = 19, frames = 349},
}
if not SMODS["INIT"] then
    --Register all Jokers/Sprites
    for k, v in pairs(AnimatedJokers) do
        --sprite
        SMODS.Atlas{
            key = k,
            path = k..".png",
            px = v.px or 71,
            py = v.py or 95
        }
        --joker override
        SMODS[v.set or "Joker"]:take_ownership(k, {
            atlas = k,
            pos = {x = 0, y = 0}
        })
    end
else
    local init = SMODS["INIT"]
    function init.Aura()
        --0.9.8 compat by @ChromaPIE
        --Register all Jokers/Sprites
        for k, v in pairs(AnimatedJokers) do
            --sprite
            SMODS.Sprite:new(
                k,
                SMODS.findModByID('Aura').path,
                k .. ".png",
                v.px or 71,
                v.py or 95,
                "asset_atli",
                v.frames
            ):register()
            --joker override
            SMODS[v.set or "Joker"]:take_ownership(k):register()
            SMODS.Jokers[k].atlas = k
            SMODS.Jokers[k].pos = { x = 0, y = 0 }
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
            local obj = G.P_CENTERS[k]
            if obj then
                local loc = obj.pos.y*(AnimatedJokers[k].frames_per_row or AnimatedJokers[k].frames)+obj.pos.x
                loc = loc + (k == "j_joker" and 3 or 1)
                if loc >= AnimatedJokers[k].frames then loc = 0 end
                obj.pos.x = loc%(AnimatedJokers[k].frames_per_row or AnimatedJokers[k].frames)
                obj.pos.y = math.floor(loc/(AnimatedJokers[k].frames_per_row or AnimatedJokers[k].frames))
            end
        end
    end
end