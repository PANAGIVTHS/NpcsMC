# 1. Generate Unique ID
scoreboard players add #global phantom.uid_global 1
scoreboard players operation @s phantom.id = #global phantom.uid_global

# 2. Store ID in a temp variable so the Clone can grab it
scoreboard players operation #temp phantom.id = @s phantom.id

# 3. Default Settings
scoreboard players set @s phantom.pvp_mode 0

# 4. Summon the Clone (Now that ID is safe in #temp)
$function phantom:api/_summon_clone {profile:"$(profile)"}