scoreboard players operation #rida.fuel rida.var = @s rida.stat.fuel
scoreboard players operation #rida.fuel rida.var /= #rida.FUEL_RECHARGES rida.var
scoreboard players operation @s rida.fuel += #rida.fuel rida.var
scoreboard players operation @s rida.fuel < @s rida.stat.fuel
scoreboard players reset #rida.fuel