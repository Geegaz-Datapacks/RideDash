execute if entity @s[gamemode=survival] run return run data modify storage rida:temp player.gamemode set value "survival"
execute if entity @s[gamemode=adventure] run return run data modify storage rida:temp player.gamemode set value "adventure"
data modify storage rida:temp player.gamemode set value "creative"