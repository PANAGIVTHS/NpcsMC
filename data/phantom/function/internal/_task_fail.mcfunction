# Example timeout fail
scoreboard players add @s phantom.timeout 1
execute if score @s phantom.timeout matches 200.. run scoreboard players set @s phantom.state 0
