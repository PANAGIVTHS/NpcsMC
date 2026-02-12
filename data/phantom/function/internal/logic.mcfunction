# 1. DECREASE JUMP COOLDOWN (Global)
scoreboard players remove @s[scores={phantom.jump_cd=1..}] phantom.jump_cd 1

# 2. STATE MACHINE

# STATE 0: IDLE
execute if score @s phantom.state matches 0 run attribute @s minecraft:movement_speed base set 0
execute if score @s phantom.state matches 0 run data merge entity @s {anger_end_time:0,angry_at:[I;0,0,0,0]}

# STATE 1: FREEROAM
execute if score @s phantom.state matches 1 run attribute @s minecraft:movement_speed base set 0.23
execute if score @s phantom.state matches 1 run data merge entity @s {anger_end_time:0,angry_at:[I;0,0,0,0]}

# STATE 2: PATHFIND
execute if score @s phantom.state matches 2 run function phantom:internal/pathfind

# STATE 3: ATTACK (PvP Mode)
# IMPORTANT: Pass the ID to the combat macro
$execute if score @s phantom.state matches 3 run function phantom:internal/combat {id:$(id)}