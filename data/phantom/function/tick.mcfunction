# 1. Sync Logic (Run this first!)
execute as @e[tag=phantom_clone] run function phantom:internal/sync

# 2. Driver Logic (Jump/PvP)
execute as @e[tag=phantom_driver] run function phantom:internal/combat

# 3. Effects (Particles/Animations)
execute as @e[tag=phantom_driver] run function phantom:internal/fx

# 4. Global Collision Logic (Dynamic Team Rules)
function phantom:internal/collision