# NOTE: it's faster to use data from storage than using it from the entity directly

# Get the thrust direction
execute positioned 0.0 0.0 0.0 run tp 9e21e514-e8c0-42d0-9d9c-ce3bc6fbdbe6 ^ ^ ^1
function rida:entity/ship/movement/get_dir
function rida:entity/ship/movement/get_motion

# Apply the thrust from the player's input
scoreboard players operation #rida.thrust rida.var *= @s rida.stat.speed
function rida:entity/ship/movement/apply_thrust_to_motion
function rida:entity/ship/movement/set_motion

execute on passengers if entity @s[type=item_display] at @s run particle large_smoke ^ ^ ^-2.25

scoreboard players remove @s[tag=!rida.boosting] rida.fuel 1
scoreboard players operation @s[tag=rida.boosting] rida.fuel -= #rida.BOOST_FUEL_USE rida.var
