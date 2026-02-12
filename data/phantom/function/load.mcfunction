# Scoreboards
scoreboard objectives add phantom.id dummy
scoreboard objectives add phantom.uid_global dummy
scoreboard objectives add phantom.jump_cd dummy
scoreboard objectives add phantom.state dummy
scoreboard objectives add phantom.substate dummy
scoreboard objectives add phantom.timeout dummy

# Initialize Global ID
execute unless score #global phantom.uid_global matches 0.. run scoreboard players set #global phantom.uid_global 0

# Team Setup
team add phantom_clones
team modify phantom_clones friendlyFire false
team modify phantom_clones color dark_purple

# NEW: Initialize Task Storage
data modify storage phantom:tasks entries set value []

# Welcome Message
tellraw @a {"text":"[Phantom Core] Task System Loaded!","color":"dark_blue","bold":true}