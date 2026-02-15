#! DONE
# Macro Context: {id:<int>}
$tellraw @a[tag=debug] {"text":"[Task Debug] Running Task System for ID: $(id)","color":"yellow"}

# Dispatch by type
$execute if data storage npc:registry NPC$(id).task_info{type:"walk"} run execute as @e[tag=npc_driver,scores={npc.id=$(id)}] run function npc:internal/pathfind with storage npc:registry NPC$(id).task_info
$execute if data storage npc:registry NPC$(id).task_info{type:"sprint"} run execute as @e[tag=npc_driver,scores={npc.id=$(id)}] run function npc:internal/pathfind with storage npc:registry NPC$(id).task_info
$execute if data storage npc:registry NPC$(id).task_info{type:"jump_sprint"} run execute as @e[tag=npc_driver,scores={npc.id=$(id)}] run function npc:internal/pathfind with storage npc:registry NPC$(id).task_info