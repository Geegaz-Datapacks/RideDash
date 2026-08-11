# Get the thrust direction
execute positioned 0.0 0.0 0.0 run tp 1af80582-f0f6-4ddd-b1c0-ccaf8beee947 ^ ^ ^1
# Apply the thrust strength from the player's input
scoreboard players operation #rida.thrust rida.var *= @s rida.stat.thrust

execute unless score #rida.thrust rida.var matches 0 run function rida:entity/ship/movement/apply_thrust

execute on passengers if entity @s[type=item_display] at @s run particle large_smoke ^ ^ ^-2.25 0.05 0.05 0.05 0 1 normal @a[distance=..50]
playsound rida:entity.airbike.move neutral @a[distance=..40] ~ ~ ~

scoreboard players remove @s[tag=!rida.boosting] rida.fuel 1
scoreboard players operation @s[tag=rida.boosting] rida.fuel -= #rida.BOOST_FUEL_USE rida.var
