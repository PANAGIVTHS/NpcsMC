# Usage: function phantom:api/attack {state:1}  (1 = ON, 0 = OFF)

# Update the global Pvp Mode scoreboard for all existing drivers
$scoreboard players set @e[tag=phantom_driver] phantom.pvp_mode $(state)

# Feedback message
$tellraw @a {"text":"[Phantom] PvP Mode set to: $(state)","color":"yellow"}