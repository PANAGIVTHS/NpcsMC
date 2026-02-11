# 1. ATTACK STATE (3): Enable Collision if near enemy
execute as @e[tag=phantom_driver,scores={phantom.state=3}] at @s if entity @e[tag=phantom_target,distance=..8] run return run team modify phantom_clones collisionRule always

# 2. PATHFIND STATE (2): Substates 1 & 2
# Sprinting (1) or Chasing (2) enables collision.
execute as @e[tag=phantom_driver,scores={phantom.state=2}] if score @s phantom.substate matches 1..2 run return run team modify phantom_clones collisionRule always

# 3. DEFAULT: Disable Collision
# Idle (0), Freeroam (1), or Walk (Substate 0)
team modify phantom_clones collisionRule never