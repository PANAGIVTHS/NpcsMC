# Tag the nearest armor stand for this NPC
# Macro context: {id:<int>}

# Remove old target
$tag @e[tag=target_$(id)] remove target_$(id)

# Tag nearest armor stand
$tag @e[type=armor_stand,sort=nearest,limit=1] add target_$(id)
