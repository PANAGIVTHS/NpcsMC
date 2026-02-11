# 1. RESTORE REACH
# Reset to 4.0 so it can hit the target.
data modify entity @s HandItems[0].components."minecraft:attack_range" set value {min_reach:0.0,max_reach:4.0,hitbox_margin:1.0}

# 2. RESTORE SPEED
attribute @s minecraft:movement_speed base set 0.23

# 3. AGGRO LOGIC (phantom_target)
# Uses the tag set by your 'set_target' command.
execute at @s run data modify entity @s angry_at set from entity @e[tag=phantom_target,distance=..32,limit=1,sort=nearest] UUID
execute at @s if entity @e[tag=phantom_target,distance=..32] run data merge entity @s {anger_end_time:9999}

# 4. JUMP LOGIC
tag @s remove phantom_jumping
execute at @s if entity @s[nbt={OnGround:1b}] unless score @s phantom.jump_cd matches 1.. if entity @e[tag=phantom_target,distance=..3] run tag @s add phantom_jumping
execute if entity @s[tag=phantom_jumping] run data merge entity @s {Motion:[0.0d,0.5d,0.0d]}
execute if entity @s[tag=phantom_jumping] run scoreboard players set @s phantom.jump_cd 60