# Macro Context: {task:<string>, id:<int>} OR {task:<string>} (id optional inside task)

# Remove old task for this ID if id exists in task
$execute if data storage phantom:macro_io id run data remove storage phantom:tasks entries[{id:$(id)}]

# Copy the task from storage
# Load the task object from the specified function file into macro_io
$function $(task) with storage phantom:macro_io

# Append to tasks
data modify storage phantom:tasks entries append from storage phantom:macro_io

# Set NPC to task state
$execute if data storage phantom:macro_io input.id run execute as @e[scores={phantom.id=$(id)}] run scoreboard players set @s phantom.state 2
