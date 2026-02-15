#! DONE
# Usage: function npc:api/set_state {state:2, substate:0}
# state: 0=Idle, 1=Freeroam, 2=Pathfind, 3=Attack
# substate: 0=Walk, 1=Sprint, 2=Chase

# Apply scores
$scoreboard players set @e[tag=npc_driver,scores={npc.id=$(id)}] npc.state $(state)
$scoreboard players set @e[tag=npc_driver,scores={npc.id=$(id)}] npc.substate $(substate)

# 3. Call the internal macro to apply the tag
$execute if score @e[tag=npc_driver,scores={npc.id=$(id)},limit=1] npc.state matches 3 run execute as @e[tag=npc_driver,scores={npc.id=$(id)}] run function npc:internal/set_target_apply with storage npc:registry NPC$(id)

# Feedback
$tellraw @a {"text":"[npc#$(id)] Set State: $(state) | Substate: $(substate)","color":"aqua"}