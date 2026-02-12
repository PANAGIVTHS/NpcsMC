# Macro Context: {id:<int>}
$tellraw @a[tag=debug] {"text":"[Task Debug] Checking for Task Chain | ID: $(id)","color":"yellow"}

# Stop if no chain exists
execute unless data storage phantom:macro_io current_task.chain run return 0

# Determine if chain is a string (task function) or object
$execute if data storage phantom:macro_io current_task.chain run function phantom:internal/_task_chain_dispatch {id:$(id)}