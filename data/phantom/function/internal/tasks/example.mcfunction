tellraw @a[tag=debug] {"text":"[Task Debug] Loading Example Task","color":"yellow"}

# phantom:internal/tasks/example_of_task.mcfunction
data modify storage phantom:macro_io input set value {"id":41,"type":"sprint","target_selector":"phantom:internal/selectors/nearest_armor_stand","on_reach":"phantom:internal/on_reach/kill_repeat","chain":"phantom:internal/tasks/example"}