# Macro Context: {id:<int>}

# Clear temp
data remove storage phantom:macro_io current_task

# Lookup task
$data modify storage phantom:macro_io current_task set from storage phantom:tasks entries[{id:$(id)}]

# If no task → idle
execute unless data storage phantom:macro_io current_task run scoreboard players set @s phantom.state 0

# Dispatch by type
execute if data storage phantom:macro_io current_task{type:"walk"} run function phantom:internal/pathfind with storage phantom:macro_io current_task
execute if data storage phantom:macro_io current_task{type:"sprint"} run function phantom:internal/pathfind with storage phantom:macro_io current_task
execute if data storage phantom:macro_io current_task{type:"jump_sprint"} run function phantom:internal/pathfind with storage phantom:macro_io current_task
