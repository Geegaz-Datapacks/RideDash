# Get movement & rotation input from the rider
execute on passengers if entity @s[type=player] at @s run function rida:entity/player/input/get_player_input

# Only apply movement if there's thrust
tag @s remove rida.moving.tick
execute if score @s rida.fuel matches 1.. if score #rida.thrust rida.var = #rida.thrust rida.var run tag @s add rida.moving.tick
execute if entity @s[tag=!rida.moving,tag=rida.moving.tick] run function rida:entity/ship/movement/start_moving
execute if entity @s[tag=rida.moving,tag=!rida.moving.tick] run function rida:entity/ship/movement/stop_moving
execute if entity @s[tag=rida.moving.tick] at @s run function rida:entity/ship/movement/move

# Get the current rotation
scoreboard players operation #rida.tilt rida.tilt = @s rida.tilt
execute store result score @s rida.tilt run data get entity @s Rotation[0] 1000.0
# Only calculate and apply tilt if there was a change in rotation
data modify storage rida:temp display.transformation.right_rotation set value [0f,0f,0f,1f]
execute unless score #rida.tilt rida.tilt = @s rida.tilt run function rida:entity/ship/display/apply_tilt

# Display the fuel on the hud using a macro
scoreboard players operation #rida.fuel rida.var = @s rida.fuel
scoreboard players operation #rida.fuel rida.var *= #rida.FUEL_BAR_SCALE rida.var
execute store result storage rida:temp hud.fuel int 1.0 run scoreboard players operation #rida.fuel rida.var /= @s rida.stat.fuel
execute on passengers if entity @s[type=player] run function rida:entity/player/show_ship_hud with storage rida:temp hud