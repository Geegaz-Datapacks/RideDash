# Get thrust & direction input from the player
execute on passengers if entity @s[type=player] run function rida:entity/player/input/get_ship_input
execute if entity @s[tag=rida.boosting] run function rida:entity/ship/movement/apply_boost_to_thrust
# Only apply movement if there's thrust
execute if score #rida.input rida.var = #rida.input rida.var at @s run function rida:entity/ship/movement/move