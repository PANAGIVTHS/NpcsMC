# Macro Context: {id: 1, cmd: "phantom:internal/tasks/step1_approach"}
$tellraw @a[tag=debug] {"text":"[Task Debug] Dispatching Manual Command: $(cmd) | ID: $(id)","color":"yellow"}

# Run the command defined in storage
$function $(cmd) {id:$(id)}
#$tellraw @a[tag=debug] {"text":"[Debug] Dispatching command: $(cmd) for ID $(id)","color":"aqua"}