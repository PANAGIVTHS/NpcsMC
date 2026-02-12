tag @s add phantom_syncing

# 1. Base Sync (Copies Driver Rotation)
execute as @e[tag=phantom_driver] if score @s phantom.id = @e[tag=phantom_syncing,limit=1] phantom.id run tp @e[tag=phantom_syncing,limit=1] @s

# 2. STATE 3 (Attack): Look at Attack Target (phantom_target_ID)
$execute as @e[tag=phantom_driver] if score @s phantom.id = @e[tag=phantom_syncing,limit=1] phantom.id if score @s phantom.state matches 3 at @e[tag=phantom_syncing,limit=1] if entity @e[tag=phantom_target_$(id),distance=..24] facing entity @e[tag=phantom_target_$(id),limit=1,sort=nearest] feet run tp @e[tag=phantom_syncing,limit=1] ~ ~ ~ ~ ~

# 3. STATE 2 (Pathfind): Look at Pathfind Target (phantom_path_target)
# Note: Assuming pathfind target logic remains generic or isn't part of this specific request.
execute as @e[tag=phantom_driver] if score @s phantom.id = @e[tag=phantom_syncing,limit=1] phantom.id if score @s phantom.state matches 2 at @e[tag=phantom_syncing,limit=1] if entity @e[tag=phantom_path_target,distance=..24] facing entity @e[tag=phantom_path_target,limit=1,sort=nearest] feet run tp @e[tag=phantom_syncing,limit=1] ~ ~ ~ ~ ~

tag @s remove phantom_syncing