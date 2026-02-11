# 1. Summon Driver with specific driver tag
$summon zombified_piglin ~ ~ ~ {HasVisualFire:0b,Silent:1b,Invulnerable:1b,Glowing:0b,PersistenceRequired:1b,Tags:["phantom_driver","phantom_new_driver"],equipment:{mainhand:{id:"minecraft:wooden_sword",count:1,components:{"minecraft:item_model":"minecraft:air","minecraft:attack_range":{min_reach:0.0,max_reach:$(reach),hitbox_margin:1.0},"minecraft:attribute_modifiers":[{id:"attack_speed",type:"attack_speed",amount:0.1,operation:"add_multiplied_base",slot:"any",display:{type:"hidden"}}]}}},active_effects:[{id:"minecraft:invisibility",amplifier:1,duration:-1,show_particles:0b,show_icon:0b}],attributes:[{id:"minecraft:follow_range",base:32},{id:"minecraft:knockback_resistance",base:0.3},{id:"minecraft:scale",base:0.9},{id:"minecraft:movement_speed",base:$(speed)},{id:"minecraft:max_health",base:$(health)}]}

# 2. Join Team
team join phantom_clones @e[tag=phantom_new_driver]

# 3. Initialize Logic (Pass the profile down)
$execute as @e[tag=phantom_new_driver,limit=1] run function phantom:api/_init_driver {profile:"$(profile)"}

# 4. Clean up Driver Tag
tag @e[tag=phantom_new_driver] remove phantom_new_driver