# Macro Context: {id: <int>}

# 1. DISABLE REACH (Passive Mode)
# FIX: Set max_reach to 2.0 (not 0.0) so the AI thinks it CAN attack and tries to get close.
#data modify entity @s HandItems[0].components."minecraft:attack_range" set value {min_reach:0.0,max_reach:2.0,hitbox_margin:0.0}

# 2. ACQUIRE TARGET
# We set 'HurtBy' to trick the AI into thinking it was attacked (Crucial for Zombified Piglins).
$execute at @s run data modify entity @s HurtBy set from entity @e[tag=phantom_target_$(id),distance=..64,limit=1,sort=nearest] UUID

# We set AngryAt/AngerTime (PascalCase for NBT keys)
$execute at @s run data modify entity @s AngryAt set from entity @e[tag=phantom_target_$(id),distance=..64,limit=1,sort=nearest] UUID
$execute at @s if entity @e[tag=phantom_target_$(id),distance=..64] run data merge entity @s {AngerTime:9999}

# 3. JUMP LOGIC
tag @s remove phantom_jumping
$execute if score @s phantom.substate matches 2 at @s if entity @s[nbt={OnGround:1b}] unless score @s phantom.jump_cd matches 1.. if entity @e[tag=phantom_target_$(id),distance=..3] run tag @s add phantom_jumping
execute if entity @s[tag=phantom_jumping] run data merge entity @s {Motion:[0.0d,0.5d,0.0d]}
execute if entity @s[tag=phantom_jumping] run scoreboard players set @s phantom.jump_cd 60

# 4. REACH TAGGING
$execute at @s run tag @e[tag=phantom_target_$(id),distance=..2,limit=1] add reached_$(id)