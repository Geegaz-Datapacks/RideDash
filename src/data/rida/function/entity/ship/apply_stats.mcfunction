execute store result entity @s attributes[{id:"minecraft:max_health"}].base float 1.0 run data get entity @s data.rida.stats.health
execute store result score @s rida.stat.speed run data get entity @s data.rida.stats.speed
execute store result score @s rida.stat.fuel run data get entity @s data.rida.stats.fuel