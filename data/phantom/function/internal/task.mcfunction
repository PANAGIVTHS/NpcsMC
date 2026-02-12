# Macro Context: {id: <int>}

# 1. Clear previous temp data
data remove storage phantom:macro_io current_task

# 2. Attempt Lookup
# We look for an entry where id matches the macro exactly
$data modify storage phantom:macro_io current_task set from storage phantom:tasks entries[{id:$(id)}]

# 3. DEBUGGING
# If successful, 'current_task' will have data. If not, it will be missing.
#$execute unless data storage phantom:macro_io current_task run tellraw @a {"text":"[Error] NPC $(id) - Storage mismatch! Check if storage has {id:$(id)} as Integer.","color":"red"}

# 4. Execute
execute if data storage phantom:macro_io current_task.cmd run function phantom:internal/task_dispatch with storage phantom:macro_io current_task