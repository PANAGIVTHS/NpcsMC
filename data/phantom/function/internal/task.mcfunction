# Macro Context: {id:<int>}
$tellraw @a[tag=debug] {"text":"[Task Debug] Running Task System for ID: $(id)","color":"yellow"}

# Clear temp
data remove storage phantom:macro_io current_task

# Lookup task
$data modify storage phantom:macro_io current_task set from storage phantom:tasks entries[{id:$(id)}]

# If no task → idle
execute unless data storage phantom:macro_io current_task run scoreboard players set @s phantom.state 0

# Dispatch by type
execute if data storage phantom:macro_io current_task.input{type:"walk"} run function phantom:internal/pathfind with storage phantom:macro_io current_task.input
execute if data storage phantom:macro_io current_task.input{type:"sprint"} run function phantom:internal/pathfind with storage phantom:macro_io current_task.input
execute if data storage phantom:macro_io current_task.input{type:"jump_sprint"} run function phantom:internal/pathfind with storage phantom:macro_io current_task.input