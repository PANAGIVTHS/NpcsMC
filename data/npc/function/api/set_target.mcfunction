#! DONE
# Usage: execute as <driver> run function npc:api/set_target {selector:"@p"}

# 1. Store the selector in storage (pass-through)
$data modify storage npc:registry NPC$(id).pvp_selector set value "$(selector)"

# 2. Store the NPC's ID in storage
$data modify storage npc:registry NPC$(id).id set value $(id)

# 3. Call the internal macro to apply the tag
$execute as @e[tag=npc_driver,scores={npc.id=$(id)}] run function npc:internal/set_target_apply with storage npc:registry NPC$(id)

# 4. Reset piglin agro
$data remove entity @e[tag=npc_driver,scores={npc.id=$(id)},limit=1] angry_at set value [I;0,0,0,0]