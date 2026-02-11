# 1. Summon Mannequin with specific clone tag
$summon mannequin ~ ~ ~ {Tags:["phantom_clone","phantom_new_clone"],profile:"$(profile)"}

# 2. Join Team
team join phantom_clones @e[tag=phantom_new_clone]

# 3. Link ID (Crucial Fix)
# We copy from #temp, which we set in the previous function.
execute as @e[tag=phantom_new_clone,limit=1] run scoreboard players operation @s phantom.id = #temp phantom.id

# 4. Clean up Clone Tag
tag @e[tag=phantom_new_clone] remove phantom_new_clone