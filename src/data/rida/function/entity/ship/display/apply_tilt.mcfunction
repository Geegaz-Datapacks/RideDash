# Ensure the angle loops properly
execute if score #rida.tilt rida.tilt matches ..-90000 if score @s rida.tilt matches 90000.. run scoreboard players add #rida.tilt rida.tilt 360000
execute if score #rida.tilt rida.tilt matches 90000.. if score @s rida.tilt matches ..-90000 run scoreboard players remove #rida.tilt rida.tilt 360000

scoreboard players operation #rida.tilt rida.tilt -= @s rida.tilt

# Clamp the angle
scoreboard players operation #rida.tilt rida.tilt < #rida.MAX_TILT_ANGLE rida.var
scoreboard players operation #rida.tilt rida.tilt > #rida.MIN_TILT_ANGLE rida.var

# Note: 1 rad = 0.01745329 degrees
execute store result storage rida:temp display.transformation.right_rotation[2] float -0.00001745329 run scoreboard players get #rida.tilt rida.tilt