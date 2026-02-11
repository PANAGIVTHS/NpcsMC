# Usage: function phantom:api/attack {state:1}  (1 = ON, 0 = OFF)

# 1. Update the global PvP Mode scoreboard
$scoreboard players set @e[tag=phantom_driver] phantom.pvp_mode $(state)

# 2. IF TURNING OFF (0): Force-Calm everyone immediately
# We set anger_end_time to 0 and AngryAt to an empty UUID [I;0,0,0,0].
# This ensures they stop attacking even if they were just hit.
execute as @e[tag=phantom_driver] if score @s phantom.pvp_mode matches 0 run data merge entity @s {anger_end_time:0,angry_at:[I;0,0,0,0]}

# 3. Feedback message
$tellraw @a {"text":"[Phantom] PvP Mode set to: $(state)","color":"yellow"}