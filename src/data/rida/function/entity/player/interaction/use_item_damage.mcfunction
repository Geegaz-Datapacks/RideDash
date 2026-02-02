execute if entity @s[gamemode=creative] run return fail

scoreboard players add #rida.damage rida.var 1
execute if score #rida.damage rida.var >= #rida.max_damage rida.var run return run function rida:entity/player/interaction/break_item

execute store result storage rida:temp damage.value int 1 run scoreboard players get #rida.damage rida.var
function rida:entity/player/interaction/set_item_damage with storage rida:temp damage

