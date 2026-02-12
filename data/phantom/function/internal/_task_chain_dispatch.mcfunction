# Macro Context: {id:<int>}
$tellraw @a[tag=debug] {"text":"[Task Debug] Dispatching Task Chain | ID: $(id)","color":"yellow"}

# Stop if no chain exists
execute unless data storage phantom:macro_io current_task.chain run return 0

# Copy chain object into macro_io
data modify storage phantom:macro_io input set from storage phantom:macro_io current_task.chain

# Inject id manually
$data modify storage phantom:macro_io input.id set value $(id)

# Call set_task with storage
function phantom:api/set_task with storage phantom:macro_io