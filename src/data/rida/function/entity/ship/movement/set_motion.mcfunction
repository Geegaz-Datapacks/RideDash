# Store the motion back to the vehicle
execute store result storage rida:temp motion[0] float 0.0001 run scoreboard players get #rida.motion rida.dx
execute store result storage rida:temp motion[1] float 0.0001 run scoreboard players get #rida.motion rida.dy
execute store result storage rida:temp motion[2] float 0.0001 run scoreboard players get #rida.motion rida.dz
data modify entity @s Motion set from storage rida:temp motion