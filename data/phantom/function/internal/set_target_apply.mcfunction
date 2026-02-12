# Macro context: {id: <int>, selector: "<string>"}

# 1. Clear old targets for THIS specific ID
$tag @e[tag=phantom_target_$(id)] remove phantom_target_$(id)

# 2. Apply new target tag using the ID
$execute at @e[tag=phantom_clone] run tag $(selector) add phantom_target_$(id)

# 3. SAFETY: Remove tag from Drivers and Clones (prevent self-targeting)
$tag @e[tag=phantom_driver] remove phantom_target_$(id)
$tag @e[tag=phantom_clone] remove phantom_target_$(id)