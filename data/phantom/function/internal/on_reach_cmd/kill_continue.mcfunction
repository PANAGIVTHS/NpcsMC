# Macro Context: {id: <int>}

# 1. Kill the target (using ID tag)
$kill @e[tag=phantom_target_$(id),distance=..3,limit=1,sort=nearest]

# 2. Cleanup Tags (Crucial before starting next task)
$tag @e[tag=phantom_target_$(id)] add 2

$tag @e[tag=phantom_target_$(id)] remove phantom_target_$(id)
$tag @e[tag=reached_$(id)] remove reached_$(id)

# 3. LOOP: Set task back to 'walk_start'
data modify storage phantom:macro_io input set value {}
$data modify storage phantom:macro_io input.id set value $(id)
data modify storage phantom:macro_io input.cmd set value "phantom:internal/tasks/walk_start"

function phantom:api/set_task with storage phantom:macro_io input