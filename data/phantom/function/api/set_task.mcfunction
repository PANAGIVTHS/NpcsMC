# Macro Context: {id: <int>, cmd: <string>}

# 1. Clean up old entry for this ID
$data remove storage phantom:tasks entries[{id:$(id)}]

# 2. FORCE ID TO INTEGER (Type Sanitization)
# We read the input ID and write it back as 'int 1'. 
# This converts 40d, 40L, "40" -> 40 (Integer)
execute store result storage phantom:macro_io input.id int 1 run data get storage phantom:macro_io input.id

# 3. Add the new entry
# Now we append the sanitized input
data modify storage phantom:tasks entries append from storage phantom:macro_io input

# 4. Debug Message
#$tellraw @a {"text":"[Task] Set task to '$(cmd)' for ID $(id)","color":"gray"}