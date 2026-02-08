# Get movement & rotation input from the rider
scoreboard players reset #rida.thrust
execute on passengers if entity @s[type=player] at @s run function rida:entity/player/input/get_player_input
execute on passengers if entity @s[type=mannequin] at @s run function rida:debug/get_mannequin_input

# Get the current rotation
scoreboard players operation #rida.tilt rida.tilt = @s rida.tilt
execute store result score @s rida.tilt run data get entity @s Rotation[0] 1000.0
# Only calculate and apply tilt if there was a change in rotation
data modify storage rida:temp display.transformation.right_rotation set value [0f,0f,0f,1f]
execute unless score #rida.tilt rida.tilt = @s rida.tilt run function rida:entity/ship/display/apply_tilt

# Apply boost (or remove the tag if no fuel or no boost left)
execute if entity @s[tag=rida.boosting] run function rida:entity/ship/movement/apply_boost_to_thrust
# Only apply movement if there's thrust and fuel
execute store success score #rida.move rida.var if score @s rida.fuel matches 1.. if score #rida.thrust rida.var = #rida.thrust rida.var
execute if score #rida.move rida.var matches 1 if entity @s[tag=!rida.moving] run function rida:entity/ship/movement/start_moving
execute if score #rida.move rida.var matches 0 if entity @s[tag=rida.moving] run function rida:entity/ship/movement/stop_moving
execute if entity @s[tag=rida.moving] at @s run function rida:entity/ship/movement/move

# Display the fuel on the hud using a macro
scoreboard players operation #rida.fuel rida.var = @s rida.fuel
scoreboard players operation #rida.fuel rida.var *= #rida.FUEL_BAR_SCALE rida.var
execute store result storage rida:temp hud.fuel int 1.0 run scoreboard players operation #rida.fuel rida.var /= @s rida.stat.fuel
execute on passengers if entity @s[type=#rida:ship_rider] run function rida:entity/player/show_ship_hud with storage rida:temp hud