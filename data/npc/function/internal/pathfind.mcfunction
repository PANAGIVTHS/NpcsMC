#! DONE
# Macro Context: full task object
$tellraw @a[tag=debug] {"text":"[Task Debug] Pathfinding | ID: $(id) | Type: $(type)","color":"yellow"}

# Ensure target exists
$execute unless entity @e[tag=target_$(id)] run function $(target_selector) {id:$(id)}

# Movement type → substate
$execute if data storage npc:registry NPC$(id).task_info{type:"walk"} run scoreboard players set @s npc.substate 0
$execute if data storage npc:registry NPC$(id).task_info{type:"sprint"} run scoreboard players set @s npc.substate 1
$execute if data storage npc:registry NPC$(id).task_info{type:"jump_sprint"} run scoreboard players set @s npc.substate 2

# Run pathfind
$execute as @s run function npc:internal/_pathfind_basic {id:$(id)}
# Check completion
$execute as @s if entity @e[tag=reached_$(id)] run execute as @s run function npc:internal/_task_complete with storage npc:registry NPC$(id).task_info