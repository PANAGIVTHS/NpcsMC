# 1. DECREASE COOLDOWN (Always runs so it's ready when you toggle on)
scoreboard players remove @s[scores={phantom.jump_cd=1..}] phantom.jump_cd 1

# 2. CHECK PVP STATE
# If PvP is OFF (0), we stop here. The Piglin won't get Angry and won't Jump.
execute unless score @s phantom.pvp_mode matches 1 run return 0

# ==============================================================================
# EVERYTHING BELOW THIS LINE ONLY RUNS IF ATTACK IS ON (State 1)
# ==============================================================================

# 3. AGGRO LOGIC (Force them to chase the target)
# We set the target UUID and force AngerTime so it doesn't lose interest.
execute at @s run data modify entity @s angry_at set from entity @e[tag=phantom_target,distance=..32,limit=1,sort=nearest] UUID
execute at @s if entity @e[tag=phantom_target,distance=..32] run data merge entity @s {AngerTime:9999}

# 4. JUMP LOGIC (The Fluid Chain)

# Step A: Reset the jump tag
tag @s remove phantom_jumping

# Step B: Check Conditions for Jump
# (PvP is confirmed ON above) AND (On Ground) AND (Cooldown is 0 or null) AND (Target is close)
# If true, we tag it as 'phantom_jumping'
execute at @s if entity @s[nbt={OnGround:1b}] unless score @s phantom.jump_cd matches 1.. if entity @e[tag=phantom_target,distance=..3] run tag @s add phantom_jumping

# Step C: Apply Motion (Only if tagged)
execute if entity @s[tag=phantom_jumping] run data merge entity @s {Motion:[0.0d,0.5d,0.0d]}

# Step D: Reset Cooldown (Only if tagged)
execute if entity @s[tag=phantom_jumping] run scoreboard players set @s phantom.jump_cd 60