#! DONE
# 1. DECREASE JUMP COOLDOWN (Global)
tellraw @a[tag=debug] {"text":"logic","color":"yellow"}
scoreboard players remove @s[scores={npc.jump_cd=1..}] npc.jump_cd 1

# 2. STATE MACHINE

# STATE 0: IDLE
execute if score @s npc.state matches 0 run attribute @s minecraft:movement_speed base set 0
execute if score @s npc.state matches 0 run data merge entity @s {anger_end_time:0,angry_at:[I;0,0,0,0]}

# STATE 1: FREEROAM
$execute if score @s npc.state matches 1 run attribute @s minecraft:movement_speed base set $(base_speed)
execute if score @s npc.state matches 1 run data merge entity @s {anger_end_time:-1L,angry_at:[I;0,2,0,0]}

# STATE 2: TASK SYSTEM
# We pass the ID to the runner so it knows which task to fetch.
execute if score @s npc.state matches 2 run attribute @s minecraft:movement_speed base set 0.3
$execute if score @s npc.state matches 2 run function npc:internal/task {id:$(id)}
# STATE 3: ATTACK (PvP Mode)
# IMPORTANT: Pass the ID to the combat macro
$execute if score @s npc.state matches 3 run function npc:internal/combat with storage npc:registry NPC$(id)