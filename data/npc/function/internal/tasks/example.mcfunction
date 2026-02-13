#! DONE
$tellraw @a[tag=debug] {"text":"[Task Debug] Loading $(task) Task for NPC$(id)","color":"yellow"}
$data modify storage npc:registry NPC$(id).task_info set value {id:"$(id)","type":"sprint","target_selector":"npc:internal/selectors/nearest_armor_stand","on_reach":"npc:internal/on_reach/kill_repeat","chain":"npc:internal/tasks/example"}