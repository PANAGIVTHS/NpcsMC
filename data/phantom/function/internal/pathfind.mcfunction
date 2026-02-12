# Macro Context: {id: <int>}

# 1. DISABLE REACH (Passive Mode)
# We set reach to 0 so the NPC moves to the target but doesn't attack.
data modify entity @s HandItems[0].components."minecraft:attack_range" set value {min_reach:0.0,max_reach:0.0,hitbox_margin:0.0}

# 2. ACQUIRE TARGET
# Look for the specific target tagged with this NPC's ID
$execute at @s run data modify entity @s angry_at set from entity @e[tag=phantom_target_$(id),distance=..64,limit=1,sort=nearest] UUID
$execute at @s if entity @e[tag=phantom_target_$(id),distance=..64] run data merge entity @s {anger_end_time:9999}

# 3. JUMP LOGIC (Optional: Only if Substate = 2/Chase)
tag @s remove phantom_jumping
$execute if score @s phantom.substate matches 2 at @s if entity @s[nbt={OnGround:1b}] unless score @s phantom.jump_cd matches 1.. if entity @e[tag=phantom_target_$(id),distance=..3] run tag @s add phantom_jumping

execute if entity @s[tag=phantom_jumping] run data merge entity @s {Motion:[0.0d,0.5d,0.0d]}
execute if entity @s[tag=phantom_jumping] run scoreboard players set @s phantom.jump_cd 60

# 4. REACH TARGET EVENT
# Check distance to the unique target. If close, run the transition command.
$execute at @s run tag @e[tag=phantom_target_$(id),distance=..2,limit=1] add reached_$(id)