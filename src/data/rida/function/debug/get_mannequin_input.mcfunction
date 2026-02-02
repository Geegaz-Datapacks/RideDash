execute if entity @s[tag=rida.debug.move] run scoreboard players operation #rida.thrust rida.var += #rida.FORWARD_THRUST rida.var

execute if entity @s[tag=rida.debug.rotate] run rotate @s ~10 ~
execute on vehicle run function rida:entity/ship/rotate

tag @s[tag=rida.debug.move] remove rida.debug.move
tag @s[tag=rida.debug.rotate] remove rida.debug.rotate