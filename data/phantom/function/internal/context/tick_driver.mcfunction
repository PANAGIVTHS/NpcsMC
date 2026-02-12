# 1. Get ID
execute store result storage phantom:macro_io id int 1 run scoreboard players get @s phantom.id

# 2. Run Main Driver Loop with ID
function phantom:internal/context/driver_main with storage phantom:macro_io