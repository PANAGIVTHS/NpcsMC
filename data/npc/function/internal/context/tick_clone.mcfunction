#! DONE
# 1. Get ID
execute store result storage npc:context cur_mannequid_id int 1 run scoreboard players get @s npc.id

# 2. Run Sync Loop with ID
function npc:internal/sync with storage npc:context