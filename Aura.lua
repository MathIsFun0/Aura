--- STEAMODDED HEADER
--- MOD_NAME: Aura
--- MOD_ID: Aura
--- MOD_AUTHOR: [MathIsFun_, Bard (pearl), Grassy]
--- MOD_DESCRIPTION: Adds animations to Jokers.
--- BADGE_COLOUR: 3469ab
--- VERSION: 0.0.004

AnimatedJokers = {
    j_wrathful_joker = {frames_per_row = 1, frames = 18},
    j_greedy_joker = {frames = 12},
    j_gluttenous_joker = {frames = 12},
    --j_lusty_joker = {frames = 18}, (bugged spritesheet)
    j_raised_fist = {frames_per_row = 4, frames = 14}
}

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
                loc = loc + 1
                if loc >= AnimatedJokers[k].frames then loc = 0 end
                obj.pos.x = loc%(AnimatedJokers[k].frames_per_row or AnimatedJokers[k].frames)
                obj.pos.y = math.floor(loc/(AnimatedJokers[k].frames_per_row or AnimatedJokers[k].frames))
            end
        end
    end
end