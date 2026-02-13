# 1. Summon Mannequin with specific clone tag
$summon mannequin ~ ~ ~ {Tags:["npc_clone","npc_new_clone"],profile:"$(profile)"}

# 2. Join Team
team join npc_clones @e[tag=npc_new_clone]

# 3. Link ID
# We copy from #temp, which we set in the previous function.
execute as @e[tag=npc_new_clone,limit=1] run scoreboard players operation @s npc.id = #global npc.uid_global

# 4. Print the ID to chat (New Step)
# This targets the entity with the tag and displays its score for 'npc.id'
execute as @e[tag=npc_new_clone,limit=1] run tellraw @a [{"text":"[System] ","color":"gray"},{"text":"NPC initialized with ID: ","color":"white"},{"score":{"name":"@s","objective":"npc.id"},"color":"green"}]

# 5. Clean up Clone Tag
tag @e[tag=npc_new_clone] remove npc_new_clone