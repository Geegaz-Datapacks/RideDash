# Store the motion back to the vehicle
# Since the base entity is a cat, multiply the vertical motion by a smaller number to compensate the difference between horizontal & vertical drag (0.98 / 0.93)
execute store result storage rida:temp motion[0] float 0.0001 run scoreboard players get #rida.motion rida.dx
execute store result storage rida:temp motion[1] float 0.00009489795 run scoreboard players get #rida.motion rida.dy
execute store result storage rida:temp motion[2] float 0.0001 run scoreboard players get #rida.motion rida.dz
data modify entity @s Motion set from storage rida:temp motion