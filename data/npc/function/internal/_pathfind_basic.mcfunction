#! DONE

# Macro Context: {id: <int>}
$tellraw @a[tag=debug] {"text":"[Task Debug] _pathfind_basic | ID: $(id)","color":"yellow"}

# 1. DISABLE REACH (Passive Mode)
# FIX: Set max_reach to 2.0 (not 0.0) so the AI thinks it CAN attack and tries to get close.
#data modify entity @s HandItems[0].components."minecraft:attack_range" set value {min_reach:0.0,max_reach:2.0,hitbox_margin:0.0}


# We set AngryAt/AngerTime (PascalCase for NBT keys)
$execute at @s run data modify entity @s angry_at set from entity @e[tag=target_$(id),distance=..64,limit=1,sort=nearest] UUID
$execute at @s if entity @e[tag=target_$(id),distance=..64] run data merge entity @s {anger_end_time:9999}
# 3. JUMP LOGIC
tag @s remove npc_jumping
$execute if score @s npc.substate matches 2 at @s if entity @s[nbt={OnGround:1b}] unless score @s npc.jump_cd matches 1.. if entity @e[tag=target_$(id)] run tag @s add npc_jumping
execute if entity @s[tag=npc_jumping] run data merge entity @s {Motion:[0.0d,0.5d,0.0d]}
execute if entity @s[tag=npc_jumping] run scoreboard players set @s npc.jump_cd 30

# 4. REACH TAGGING
$execute at @s run tag @e[tag=target_$(id),distance=..2,limit=1] add reached_$(id)