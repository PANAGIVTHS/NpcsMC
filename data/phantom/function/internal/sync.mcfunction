# 1. Mark 'Me' (The Clone)
tag @s add phantom_syncing

# 2. Find the Driver with the matching ID
execute as @e[tag=phantom_driver] if score @s phantom.id = @e[tag=phantom_syncing,limit=1] phantom.id run tp @e[tag=phantom_syncing,limit=1] @s

# 3. Rotation Logic
execute at @s if entity @e[tag=phantom_target,distance=..24] facing entity @e[tag=phantom_target,limit=1,sort=nearest] feet run tp @s ~ ~ ~ ~ ~
execute at @s unless entity @e[tag=phantom_target,distance=..24] rotated as @e[tag=phantom_driver] if score @e[tag=phantom_driver,limit=1] phantom.id = @s phantom.id run tp @s ~ ~ ~ ~ ~

# 4. Cleanup
tag @s remove phantom_syncing