# Usage: execute as <driver> run function phantom:api/set_target {selector:"@p"}

# 1. Store the selector in storage (pass-through)
$data modify storage phantom:macro_io selector set value "$(selector)"

# 2. Store the NPC's ID in storage
execute store result storage phantom:macro_io id int 1 run scoreboard players get @s phantom.id

# 3. Call the internal macro to apply the tag
function phantom:internal/set_target_apply with storage phantom:macro_io
# TODO