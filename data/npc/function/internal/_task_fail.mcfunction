#! DONE
tellraw @a[tag=debug] {"text":"[Task Debug] Task Failed (Timeout)","color":"red"}

# Example timeout fail
scoreboard players add @s npc.timeout 1
execute if score @s npc.timeout matches 200.. run scoreboard players set @s npc.state 0