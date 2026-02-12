# Macro Context: {id: 1, cmd: "phantom:internal/tasks/step1_approach"}

# Run the command defined in storage
$function $(cmd) {id:$(id)}
#$tellraw @a {"text":"[Debug] Dispatching command: $(cmd) for ID $(id)","color":"aqua"}