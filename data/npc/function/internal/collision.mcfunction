#! DONE
# Macro context: {id: <int>}

# 1. ATTACK STATE (3): Enable Collision if near OWN target
#TODO maybe this 4 should be variables linked with the combat min distance in other TODO
$execute if score @s npc.state matches 3 at @s if entity @e[tag=target_$(id),distance=..4] run team join npc_clones @e[type=mannequin,scores={npc.id=$(id)}]
$execute if score @s npc.state matches 3 at @s unless entity @e[tag=target_$(id),distance=..4] run team leave @e[type=mannequin,scores={npc.id=$(id)}]

# 2. PATHFIND STATE (2): Substates 1 & 2
$execute if score @s npc.state matches 2 if score @s npc.substate matches 1..2 run team join npc_clones @e[type=mannequin,scores={npc.id=$(id)}]
