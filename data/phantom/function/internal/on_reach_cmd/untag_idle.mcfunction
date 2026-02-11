# 1. Remove the target tag (so it's no longer a target)
tag @e[tag=phantom_path_target,distance=..1,limit=1,sort=nearest] remove phantom_path_target

# 2. Switch to Idle State (0)
scoreboard players set @s phantom.state 0