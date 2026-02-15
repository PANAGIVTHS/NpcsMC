#! DONE
# Tag the nearest armor stand for this NPC
# Macro context: {id:<int>}
$tellraw @a[tag=debug] {"text":"[Task Debug] Selecting nearest armor stand for ID: $(id)","color":"red"}

# Tag nearest armor stand
$execute at @s run tag @e[type=armor_stand,sort=nearest,limit=1] add target_$(id)
$execute unless entity @e[type=armor_stand, tag=target_$(id)] run function npc:api/set_state {id:$(id), state:0, substate:1}