# Macro context: {id: <int>}

# 1. ATTACK STATE (3): Enable Collision if near OWN target
$execute if score @s phantom.state matches 3 at @s if entity @e[tag=target_$(id),distance=..8] run team modify phantom_clones collisionRule always

# 2. PATHFIND STATE (2): Substates 1 & 2
execute if score @s phantom.state matches 2 if score @s phantom.substate matches 1..2 run team modify phantom_clones collisionRule always

# Note: We do NOT set it to 'never' here, because that is handled at the start of tick.mcfunction.
# If ANY NPC sets it to 'always', it stays 'always' for this tick.