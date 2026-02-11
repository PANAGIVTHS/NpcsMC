# 1. Sync Logic (Visuals)
execute as @e[tag=phantom_clone] run function phantom:internal/sync

# 2. MAIN BRAIN (State Machine)
execute as @e[tag=phantom_driver] run function phantom:internal/logic

# 3. Effects
execute as @e[tag=phantom_driver] run function phantom:internal/fx

# 4. Collision Logic
function phantom:internal/collision