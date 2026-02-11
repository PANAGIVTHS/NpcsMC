# 1. Clear old targets
tag @e[tag=phantom_target] remove phantom_target

# 2. Apply new target tag (Macro)
$tag $(selector) add phantom_target

# 3. SAFETY: Remove tag from Drivers and Clones immediately
# This ensures even if you use "@e", the system won't target itself.
tag @e[tag=phantom_driver] remove phantom_target
tag @e[tag=phantom_clone] remove phantom_target