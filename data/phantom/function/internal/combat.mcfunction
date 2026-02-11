# 1. DECREASE COOLDOWN (Always runs)
scoreboard players remove @s[scores={phantom.jump_cd=1..}] phantom.jump_cd 1

# 2. CHECK PVP STATE
# If PvP is NOT 1 (Off), we must FORCE CALM the piglin every tick.
# This prevents Vanilla AI from getting angry if you punch it.
execute unless score @s phantom.pvp_mode matches 1 run data merge entity @s {anger_end_time:0,angry_at:[I;0,0,0,0]}

# Stop here if PvP is Off (We just calmed it, no need to run aggro logic)
execute unless score @s phantom.pvp_mode matches 1 run return 0

# ==============================================================================
# PVP LOGIC (Only runs if State = 1)
# ==============================================================================

# 3. AGGRO LOGIC (Force them to chase the target)
execute at @s run data modify entity @s angry_at set from entity @e[tag=phantom_target,distance=..32,limit=1,sort=nearest] UUID
execute at @s if entity @e[tag=phantom_target,distance=..32] run data merge entity @s {anger_end_time:9999}

# 4. JUMP LOGIC (The Fluid Chain)

# Step A: Reset tag
tag @s remove phantom_jumping

# Step B: Check Jump Conditions
execute at @s if entity @s[nbt={OnGround:1b}] unless score @s phantom.jump_cd matches 1.. if entity @e[tag=phantom_target,distance=..3] run tag @s add phantom_jumping

# Step C: Apply Motion (Only if tagged)
execute if entity @s[tag=phantom_jumping] run data merge entity @s {Motion:[0.0d,0.5d,0.0d]}

# Step D: Reset Cooldown (Only if tagged)
execute if entity @s[tag=phantom_jumping] run scoreboard players set @s phantom.jump_cd 60