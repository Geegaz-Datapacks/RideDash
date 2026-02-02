execute if score @s rida.fuel >= @s rida.stat.fuel run return fail

scoreboard players operation #rida.fuel rida.var = @s rida.stat.fuel
scoreboard players operation #rida.fuel rida.var /= #rida.FUEL_RECHARGES rida.var
scoreboard players operation @s rida.fuel += #rida.fuel rida.var
scoreboard players reset #rida.fuel

playsound minecraft:item.firecharge.use player @a[distance=..42]
particle trial_spawner_detection ~ ~1 ~ 0.5 0.1 0.5 0 10

return 1