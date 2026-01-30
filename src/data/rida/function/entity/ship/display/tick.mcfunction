data modify storage rida:temp display.transformation.right_rotation set value [0f,0f,0f,1f]

# Get the current rotation
scoreboard players operation #rida.previous rida.tilt = @s rida.tilt
execute store result score @s rida.tilt run data get entity @s Rotation[0] 1000.0
scoreboard players operation #rida.current rida.tilt = @s rida.tilt
# Only calculate and apply tilt if there was a change in rotation
execute unless score #rida.previous rida.tilt = #rida.current rida.tilt run function rida:entity/ship/display/apply_tilt

scoreboard players reset #rida.previous
scoreboard players reset #rida.current