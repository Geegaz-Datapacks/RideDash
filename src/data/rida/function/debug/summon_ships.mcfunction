execute unless score #rida.debug.amount rida.var matches 1.. run return run say No amount given. Please set #rida.debug.amount rida.var to a number greater than 0
scoreboard players remove #rida.debug.amount rida.var 1

execute positioned ~ ~1 ~ run function rida:entity/ship/summon

scoreboard players add #rida.debug.amount_row rida.var 1

execute unless score #rida.debug.amount rida.var matches 1.. run return run scoreboard players reset #rida.debug.amount_row rida.var
execute unless score #rida.debug.amount_row rida.var matches 20.. positioned ~ ~ ~1 run return run function rida:debug/summon_ships
scoreboard players reset #rida.debug.amount_row rida.var
execute positioned ~2 ~ ~-19 run function rida:debug/summon_ships