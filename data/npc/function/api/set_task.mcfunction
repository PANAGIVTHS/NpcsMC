#! DONE
# Macro Context: {task:<string>, id:<int>} OR {task:<string>} (id optional inside task)
$tellraw @a[tag=debug] {"text":"[Task Debug] Set task: $(task) for NPC$(id)","color":"yellow"}

# Remove old task for this ID if id exists in task
$data modify storage npc:registry NPC$(id).task set value "$(task)"

# Copy the task from storage
# Load the task object from the specified function file into registry
$execute as @e[tag=npc_driver,scores={npc.id=$(id)}] run function $(task) {id:$(id), task:"$(task)"}
