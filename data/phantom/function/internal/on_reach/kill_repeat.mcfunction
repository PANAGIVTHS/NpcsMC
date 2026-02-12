# Macro context: {id:<int>}
$tellraw @a {"text":"[Task Debug] on_reach: kill_repeat | ID: $(id)","color":"blue"}
# Kill the target if exists
$kill @e[tag=target_$(id),distance=..3,limit=1,sort=nearest]

# Clean tags
$tag @e[tag=target_$(id)] remove target_$(id)
$tag @e[tag=reached_$(id)] remove reached_$(id)

# Nothing else needed, _task_complete will handle chaining
