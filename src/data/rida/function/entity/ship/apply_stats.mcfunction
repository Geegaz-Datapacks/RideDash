# All stats are numbers between 1 and 10
# - Health = hearts * 2
# - Speed = thrust multiplier
# - Fuel = minutes of flight

# Store stats in the ship
execute if data storage rida:temp ship.stats run data modify entity @s data.rida.stats set from storage rida:temp ship.stats

# Health
execute store result entity @s attributes[{id:"minecraft:max_health"}].base float 4.0 run data get entity @s data.rida.stats.health
execute store result entity @s Health float 4.0 run data get entity @s data.rida.stats.health

# Speed
execute store result score @s rida.stat.speed run data get entity @s data.rida.stats.speed

# Fuel
execute store result score @s rida.stat.fuel run data get entity @s data.rida.stats.fuel
scoreboard players operation @s rida.stat.fuel *= #rida.FUEL_SCALE rida.var