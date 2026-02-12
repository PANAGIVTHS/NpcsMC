# 1. Generate ID
scoreboard players add #global phantom.uid_global 1
scoreboard players operation @s phantom.id = #global phantom.uid_global
scoreboard players operation #temp phantom.id = @s phantom.id

# 2. Default State (Freeroam)
scoreboard players set @s phantom.state 1
scoreboard players set @s phantom.substate 0
scoreboard players set @s phantom.jump_cd 0

# 3. Summon Clone
$function phantom:internal/_summon_clone {profile:"$(profile)"}