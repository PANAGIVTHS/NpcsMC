# Scoreboards
scoreboard objectives add phantom.id dummy
scoreboard objectives add phantom.uid_global dummy
scoreboard objectives add phantom.jump_cd dummy
scoreboard objectives add phantom.pvp_mode dummy

# Initialize Global ID counter
execute unless score #global phantom.uid_global matches 0.. run scoreboard players set #global phantom.uid_global 0

# Team Setup (Prevents pushing)
team add phantom_clones
team modify phantom_clones collisionRule never
team modify phantom_clones friendlyFire false

# Welcome Message
tellraw @a {"text":"[Phantom Core] Successfully Loaded!","color":"blue","bold":true}