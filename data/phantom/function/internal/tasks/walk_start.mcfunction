# Macro Context: {id: <int>}

# --- 1. TAGGING LOGIC (Every Tick) ---
# Ensure we always target the closest stand (updates dynamically)
$tag @e[tag=phantom_target_$(id)] remove phantom_target_$(id)
$tag @e[type=armor_stand,sort=nearest,limit=1] add phantom_target_$(id)
#$tellraw @a {"text":"[Debug] Walk Start running for ID $(id)","color":"yellow"}
# --- 2. PATHFINDING ---
# A. Look at target
$function phantom:internal/pathfind {id:$(id)}

$execute if entity @e[tag=reached_$(id),tag=1] run function phantom:internal/on_reach_cmd/kill_continue {id:$(id)}

# Case 2: Target has tag '2' -> Kill & Idle (Stop task)
$execute if entity @e[tag=reached_$(id),tag=2] run function phantom:internal/on_reach_cmd/kill_idle {id:$(id)}
