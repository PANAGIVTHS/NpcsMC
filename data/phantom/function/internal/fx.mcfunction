# 1. Swing Animation
# Check for phantom_target_$(id)
$execute at @s if entity @e[tag=phantom_target_$(id),distance=..5,nbt={HurtTime:7s},limit=1] as @e[tag=phantom_clone,limit=1,sort=nearest] if score @e[tag=phantom_driver,limit=1,sort=nearest] phantom.state matches 3 if score @s phantom.id = @e[tag=phantom_driver,limit=1,sort=nearest] phantom.id run swing @s mainhand

# 2. Critical Hit Particles
$execute if entity @s[nbt={OnGround:0b}] at @e[tag=phantom_target_$(id),distance=..5,nbt={HurtTime:7s},limit=1] run particle minecraft:crit ~ ~1 ~ 0.2 0.5 0.2 0.1 10