# 1. DECREASE JUMP COOLDOWN (Global)
scoreboard players remove @s[scores={phantom.jump_cd=1..}] phantom.jump_cd 1

# 2. STATE MACHINE
# ------------------------------------------------------------------------------

# STATE 0: IDLE (Statue)
# Speed 0, Force Calm.
execute if score @s phantom.state matches 0 run attribute @s minecraft:movement_speed base set 0
execute if score @s phantom.state matches 0 run data merge entity @s {anger_end_time:0,angry_at:[I;0,0,0,0]}

# STATE 1: FREEROAM (Wander)
# Normal Speed, Force Calm.
execute if score @s phantom.state matches 1 run attribute @s minecraft:movement_speed base set 0.23
execute if score @s phantom.state matches 1 run data merge entity @s {anger_end_time:0,angry_at:[I;0,0,0,0]}

# STATE 2: PATHFIND (Follow Target, No Damage)
# Navigates to entities tagged 'phantom_path_target'
execute if score @s phantom.state matches 2 run function phantom:internal/pathfind

# STATE 3: ATTACK (PvP Mode)
# Attacks entities tagged 'phantom_target' (set by your set_target command)
execute if score @s phantom.state matches 3 run function phantom:internal/combat