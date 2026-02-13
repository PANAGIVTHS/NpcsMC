#! DONE

# 1. Generate ID
scoreboard players add #global npc.uid_global 1
scoreboard players operation @s npc.id = #global npc.uid_global

# 2. Default State
scoreboard players set @s npc.state 1
scoreboard players set @s npc.substate 0
scoreboard players set @s npc.jump_cd 0

# 3. Store ID into storage bridge
execute store result storage npc:temp id int 1 run scoreboard players get @s npc.id
$data modify storage npc:temp speed set value $(speed)
$data modify storage npc:temp reach set value $(reach)
$data modify storage npc:temp profile set value "$(profile)"

# # 4. Pass ID + stats into registry initializer
function npc:internal/_registry_init with storage npc:temp

# 5. Summon Clone
$function npc:internal/_summon_clone {profile:"$(profile)"}
