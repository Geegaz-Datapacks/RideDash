# Get the current motion of the vehicle
data modify storage rida:temp motion set from entity @s Motion
execute store result score #rida.motion rida.dx run data get storage rida:temp motion[0] 10000.0
execute store result score #rida.motion rida.dy run data get storage rida:temp motion[1] 10000.0
execute store result score #rida.motion rida.dz run data get storage rida:temp motion[2] 10000.0