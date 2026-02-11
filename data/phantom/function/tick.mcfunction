# 1. Sync Logic (Run this first!)
# We execute AS the clone to find its specific driver.
execute as @e[tag=phantom_clone] run function phantom:internal/sync

# 2. Driver Logic (Jump/PvP)
execute as @e[tag=phantom_driver] run function phantom:internal/combat

# 3. Effects (Particles/Animations)
execute as @e[tag=phantom_driver] run function phantom:internal/fx