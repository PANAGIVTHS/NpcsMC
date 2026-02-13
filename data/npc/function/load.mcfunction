#! DONE
# Scoreboards
scoreboard objectives add npc.id dummy
scoreboard objectives add npc.uid_global dummy
scoreboard objectives add npc.jump_cd dummy
scoreboard objectives add npc.state dummy
scoreboard objectives add npc.substate dummy
scoreboard objectives add npc.timeout dummy

# Initialize Global ID
execute unless score #global npc.uid_global matches 0.. run scoreboard players set #global npc.uid_global 0

# Team Setup
team add npc_clones
team modify npc_clones friendlyFire false
team modify npc_clones color dark_purple
team modify npc_clones collisionRule pushOtherTeams

# Welcome Message
tellraw @a {"text":"[npc Core] Task System Loaded!","color":"dark_blue","bold":true}
