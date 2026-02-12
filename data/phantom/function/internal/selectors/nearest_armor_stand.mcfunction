# Tag the nearest armor stand for this NPC
# Macro context: {id:<int>}
$tellraw @a {"text":"[Task Debug] Selecting nearest armor stand for ID: $(id)","color":"red"}

# Tag nearest armor stand
$tag @e[type=armor_stand,sort=nearest,limit=1] add target_$(id)