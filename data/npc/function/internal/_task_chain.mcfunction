#! DONE
# Macro Context: {id:<int>}
$tellraw @a[tag=debug] {"text":"[Task Debug] Checking for Task Chain | ID: $(id)","color":"yellow"}

# Stop if no chain exists
$execute unless data storage npc:registry NPC$(id).task_info.chain run return 0

# Determine if chain is a string (task function) or object
$execute if data storage npc:registry NPC$(id).task_info.chain run execute as @s function npc:internal/_task_chain_dispatch {id:$(id)}