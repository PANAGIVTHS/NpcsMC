# 1. Mark 'Me' (The Clone)
tag @s add phantom_syncing

# 2. Base Sync (Position & Rotation)
# This moves the clone to the driver. 
# It COPIES THE ROTATION of the driver automatically (Default behavior).
execute as @e[tag=phantom_driver] if score @s phantom.id = @e[tag=phantom_syncing,limit=1] phantom.id run tp @e[tag=phantom_syncing,limit=1] @s

# 3. Targeting Override (Only if PvP is ON)
# We check: ID Matches + PvP Mode is 1 + Target exists
execute as @e[tag=phantom_driver] if score @s phantom.id = @e[tag=phantom_syncing,limit=1] phantom.id if score @s phantom.pvp_mode matches 1 at @e[tag=phantom_syncing,limit=1] if entity @e[tag=phantom_target,distance=..24] facing entity @e[tag=phantom_target,limit=1,sort=nearest] feet run tp @e[tag=phantom_syncing,limit=1] ~ ~ ~ ~ ~

# 4. Cleanup
tag @s remove phantom_syncing