execute as @e[type=#rida:ship_root,tag=rida.ship] run damage @s 0.00000001
scoreboard players add #rida.debug.hurt_ships rida.var 1

execute if score #rida.debug.hurt_ships rida.var matches 200.. run scoreboard players reset #rida.debug.hurt_ships
execute if score #rida.debug.hurt_ships rida.var matches 1.. run schedule function rida:debug/hurt_ships 1t