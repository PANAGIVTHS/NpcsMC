#! DONE
# 1. Swing Animation
tellraw @a[tag=debug] {"text":"fx","color":"yellow"}
# Check for target_$(id)
$execute at @s if entity @e[tag=target_$(id),distance=1..6,nbt={HurtTime:7s},limit=1] as @e[tag=npc_clone,limit=1,sort=nearest] if score @e[tag=npc_driver,limit=1,sort=nearest] npc.state matches 3 if score @s npc.id = @e[tag=npc_driver,limit=1,sort=nearest] npc.id run swing @s mainhand

# 2. Critical Hit Particles
$execute if entity @s[nbt={OnGround:0b}] at @e[tag=target_$(id),distance=..5,nbt={HurtTime:7s},limit=1] run particle minecraft:crit ~ ~1 ~ 0.2 0.5 0.2 0.1 10