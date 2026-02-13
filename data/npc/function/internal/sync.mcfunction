#! DONE
tag @s add npc_syncing

# 1. Base Sync (Copies Driver Rotation)
execute as @e[tag=npc_driver] if score @s npc.id = @e[tag=npc_syncing,limit=1] npc.id run tp @e[tag=npc_syncing,limit=1] @s

# 2. STATE 3 (Attack): Look at Attack Target (target_ID)
$execute as @e[tag=npc_driver] if score @s npc.id = @e[tag=npc_syncing,limit=1] npc.id if score @s npc.state matches 3 at @e[tag=npc_syncing,limit=1] if entity @e[tag=target_$(cur_mannequid_id),distance=..24] facing entity @e[tag=target_$(cur_mannequid_id),limit=1,sort=nearest] feet run tp @e[tag=npc_syncing,limit=1] ~ ~ ~ ~ ~

# 3. STATE 2 (Pathfind): Look at Pathfind Target (npc_path_target)
# Note: Assuming pathfind target logic remains generic or isn't part of this specific request.
execute as @e[tag=npc_driver] if score @s npc.id = @e[tag=npc_syncing,limit=1] npc.id if score @s npc.state matches 2 at @e[tag=npc_syncing,limit=1] if entity @e[tag=npc_path_target,distance=..24] facing entity @e[tag=npc_path_target,limit=1,sort=nearest] feet run tp @e[tag=npc_syncing,limit=1] ~ ~ ~ ~ ~

tag @s remove npc_syncing