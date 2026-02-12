# Macro context: {id: <int>}

# 1. MAIN BRAIN (State Machine)
# We pass the ID down to logic (which passes it to combat)
$function phantom:internal/logic {id:$(id)}

# 2. Effects
$function phantom:internal/fx {id:$(id)}

# 3. Collision Logic (Per Entity)
$function phantom:internal/collision {id:$(id)}