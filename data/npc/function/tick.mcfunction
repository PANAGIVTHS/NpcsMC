#! DONE

# Execute as clone -> Get ID -> Run Sync Macro
execute as @e[type=mannequin, tag=npc_clone] run function npc:internal/context/tick_clone

# Execute as driver -> Get ID -> Run Logic/FX/Collision Macro
execute as @e[tag=npc_driver] run function npc:internal/context/tick_driver