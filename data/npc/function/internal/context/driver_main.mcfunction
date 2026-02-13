#! DONE
# Macro context: {id: <int>}

# 1. MAIN BRAIN (State Machine)
# We pass the ID down to logic (which passes it to combat)
$function npc:internal/logic with storage NPC$(cur_driver_id)

# 2. Effects
$function npc:internal/fx {id:$(cur_driver_id)}

# 3. Collision Logic (Per Entity)
$function npc:internal/collision {id:$(cur_driver_id)}