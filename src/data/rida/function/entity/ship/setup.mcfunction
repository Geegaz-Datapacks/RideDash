# All stats are numbers between 1 and 10
# - Thrust (stat * 1.0) = multiplier for the base forward/backward/boost thrust
# - Fuel (stat * 600.0) = minutes of flight 
# - Armor (stat * 2.0) = same as regular armor

execute store result score @s rida.stat.thrust run data get entity @s data.rida.stats.thrust 1.0
execute store result score @s rida.stat.fuel run data get entity @s data.rida.stats.fuel 600.0
execute store result entity @s attributes[{id:"minecraft:armor"}].base float 1.0 run data get entity @s data.rida.stats.armor 2.0

tag @s remove rida.new