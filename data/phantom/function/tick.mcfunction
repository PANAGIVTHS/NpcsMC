# 1. Reset Collision Rule (Global Reset)
# We default to 'never', and individual NPCs will turn it to 'always' if they are fighting.
team modify phantom_clones collisionRule never

# 2. SYNC LOGIC (Clones)
# Execute as clone -> Get ID -> Run Sync Macro
execute as @e[tag=phantom_clone] run function phantom:internal/context/tick_clone

# 3. DRIVER LOGIC (Brain)
# Execute as driver -> Get ID -> Run Logic/FX/Collision Macro
execute as @e[tag=phantom_driver] run function phantom:internal/context/tick_driver