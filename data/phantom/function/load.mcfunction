# Scoreboards
scoreboard objectives add phantom.id dummy
scoreboard objectives add phantom.uid_global dummy
scoreboard objectives add phantom.jump_cd dummy

# NEW: State System
# 0=Idle, 1=Freeroam, 2=Pathfind, 3=Attack
scoreboard objectives add phantom.state dummy
scoreboard objectives add phantom.substate dummy

# Initialize Global ID
execute unless score #global phantom.uid_global matches 0.. run scoreboard players set #global phantom.uid_global 0

# Team Setup
team add phantom_clones
team modify phantom_clones friendlyFire false
team modify phantom_clones color dark_purple

# Welcome Message
tellraw @a {"text":"[Phantom Core] State System Loaded!","color":"green","bold":true}