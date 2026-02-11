# 1. Check for ENABLE Condition (PvP ON + Target Nearby)
# If ANY driver matches this, we enable collision and exit the function immediately.
# We check for targets within 8 blocks (Melee/Mid range).
execute as @e[tag=phantom_driver,scores={phantom.pvp_mode=1}] at @s if entity @e[tag=phantom_target,distance=..32] run return run team modify phantom_clones collisionRule always

# 2. Default State (Disable Collision)
# If the function didn't return above, it means NO driver met the condition.
# So we safely disable collision.
team modify phantom_clones collisionRule never