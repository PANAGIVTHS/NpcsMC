# 1. Get ID
execute store result storage phantom:macro_io id int 1 run scoreboard players get @s phantom.id

# 2. Run Sync Loop with ID
function phantom:internal/sync with storage phantom:macro_io