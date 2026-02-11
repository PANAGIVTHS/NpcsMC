# 1. DISABLE REACH (The "Follow" Trick)
# We set reach to 0. The Piglin pathfinds to attack but stands next to the target harmlessly.
data modify entity @s HandItems[0].components."minecraft:attack_range" set value {min_reach:0.0,max_reach:0.0,hitbox_margin:0.0}

# 2. ACQUIRE TARGET (phantom_path_target)
execute at @s run data modify entity @s angry_at set from entity @e[tag=phantom_path_target,distance=..64,limit=1,sort=nearest] UUID
execute at @s if entity @e[tag=phantom_path_target,distance=..64] run data merge entity @s {anger_end_time:9999}

# 4. JUMP LOGIC (Only for Substate 2)
tag @s remove phantom_jumping
execute if score @s phantom.substate matches 2 at @s if entity @s[nbt={OnGround:1b}] unless score @s phantom.jump_cd matches 1.. if entity @e[tag=phantom_path_target,distance=..3] run tag @s add phantom_jumping
execute if entity @s[tag=phantom_jumping] run data merge entity @s {Motion:[0.0d,0.5d,0.0d]}
execute if entity @s[tag=phantom_jumping] run scoreboard players set @s phantom.jump_cd 60

# 5. REACH TARGET EVENT
# Detect if the driver is within X blocks (e.g., 2) of the pathfinding target
execute at @s if entity @e[tag=phantom_path_target,distance=..2] run function phantom:internal/on_reach with storage phantom:io on_reach