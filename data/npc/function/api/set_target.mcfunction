#! DONE
# Usage: execute as <driver> run function npc:api/set_target {selector:"@p"}

# 1. Store the selector in storage (pass-through)
$data modify storage npc:registry NPC$(id).pvp_selector set value "$(selector)"

# 2. Store the NPC's ID in storage
$data modify storage npc:registry NPC$(id).id set value $(id)
