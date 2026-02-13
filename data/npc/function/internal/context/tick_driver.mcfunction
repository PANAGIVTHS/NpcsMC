#! DONE
# 1. Get ID
execute store result storage npc:context cur_driver_id int 1 run scoreboard players get @s npc.id

# 2. Run Main Driver Loop with ID
function npc:internal/context/driver_main with storage npc:context