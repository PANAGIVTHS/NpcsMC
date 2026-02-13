#! DONE
# Macro Context: {id:<int>}
$tellraw @a[tag=debug] {"text":"[Task Debug] Task Complete | ID: $(id)","color":"green"}

# Run on_reach
$execute as @s function $(on_reach) {id:$(id)}

# Cleanup tags
$tag @e[tag=target_$(id)] remove target_$(id)
$tag @e[tag=reached_$(id)] remove reached_$(id)

# Chain to next task (if exists)
$execute as @s function npc:internal/_task_chain {id:$(id)}