#! DONE
# Macro Context: {id:<int>}
$tellraw @a[tag=debug] {"text":"[Task Debug] Dispatching Task Chain | ID: $(id)","color":"yellow"}

# Stop if no chain exists
$execute unless data storage npc:registry NPC$(id).task_info.chain run return 0

# Call set_task with storage
$function npc:api/set_task with storage NPC$(id).task_info