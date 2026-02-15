#! DONE
#TODO maybe make into a task
# 1. RESTORE REACH
#data modify entity @s HandItems[0].components."minecraft:attack_range" set value {min_reach:0.0,max_reach:4.0,hitbox_margin:1.0}
tellraw @a[tag=debug] {"text":"combat","color":"yellow"}

# 2. RESTORE SPEED
$attribute @s minecraft:movement_speed base set $(base_speed)

# 3. AGGRO LOGIC (target_ID)
# Look for the specific target tagged with this NPC's ID
$execute at @s run data modify entity @s angry_at set from entity @e[tag=target_$(id),distance=..32,limit=1,sort=nearest] UUID
$execute at @s if entity @e[tag=target_$(id),distance=..32] run data merge entity @s {anger_end_time:9999}

#TODO maybe these should be variables
$execute at @s if score @s npc.state matches 3 run execute if entity @e[tag=target_$(id),distance=4..32] run attribute @s minecraft:movement_speed base set 0.38

# 4. JUMP LOGIC
tag @s remove npc_jumping
$execute at @s if entity @s[nbt={OnGround:1b}] unless score @s npc.jump_cd matches 1.. if entity @e[tag=target_$(id),distance=..3] run tag @s add npc_jumping
execute if entity @s[tag=npc_jumping] run data merge entity @s {Motion:[0.0d,0.5d,0.0d]}
execute if entity @s[tag=npc_jumping] run scoreboard players set @s npc.jump_cd 60