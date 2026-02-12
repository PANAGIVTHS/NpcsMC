# Macro Context: full task object
$tellraw @a[tag=debug] {"text":"[Task Debug] Pathfinding | ID: $(id) | Type: $(type)","color":"yellow"}

# Ensure target exists
$execute unless entity @e[tag=target_$(id)] run function $(target_selector) {id:$(id)}

# Movement type → substate
execute if data storage phantom:macro_io current_task.input{type:"walk"} run scoreboard players set @s phantom.substate 0
execute if data storage phantom:macro_io current_task.input{type:"sprint"} run scoreboard players set @s phantom.substate 1
execute if data storage phantom:macro_io current_task.input{type:"jump_sprint"} run scoreboard players set @s phantom.substate 2

# Run pathfind
$function phantom:internal/_pathfind_basic {id:$(id)}

# Check completion
$execute if entity @e[tag=reached_$(id)] run function phantom:internal/_task_complete {id:$(id)}