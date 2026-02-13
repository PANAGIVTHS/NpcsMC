# Macro Context: {id:<int>, profile:"...", speed:<float>, reach:<float>}

# Create base registry entry
$data modify storage npc:registry NPC$(id).base_speed set value $(speed)
$data modify storage npc:registry NPC$(id).base_reach set value $(reach)
$data modify storage npc:registry NPC$(id).profile set value "$(profile)"