#! DONE
# Macro context: {id: <int>, selector: "<string>"}

# 1. Clear old targets for THIS specific ID
tellraw @a[tag=debug] {"text":"set_target_apply","color":"yellow"}
$tag @e[tag=target_$(id)] remove target_$(id)

# 2. Apply new target tag using the ID
$execute at @e[tag=npc_clone] run tag $(pvp_selector) add target_$(id)

# 3. SAFETY: Remove tag from Drivers and Clones (prevent self-targeting)
$tag @e[tag=npc_driver] remove target_$(id)
$tag @e[tag=npc_clone] remove target_$(id)