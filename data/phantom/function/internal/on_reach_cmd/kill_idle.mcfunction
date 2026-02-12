# Macro Context: {id: <int>}

# 1. Kill the target
$kill @e[tag=phantom_target_$(id),distance=..3,limit=1,sort=nearest]

# 2. Cleanup Tags
$tag @e[tag=phantom_target_$(id)] remove phantom_target_$(id)
$tag @e[tag=reached_$(id)] remove reached_$(id)

# 3. Set State to Idle
scoreboard players set @s phantom.state 0

# 4. CLEAR TASK (Set to nothing)
# We directly remove the entry for this ID so the task runner finds nothing next tick.
$data remove storage phantom:tasks entries[{id:$(id)}]