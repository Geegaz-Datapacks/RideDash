# Get the movement direction using the forceloaded marker
data modify storage rida:temp dir set from entity 9e21e514-e8c0-42d0-9d9c-ce3bc6fbdbe6 Pos
execute store result score #rida.thrust rida.dx run data get storage rida:temp dir[0] 10000.0
execute store result score #rida.thrust rida.dy run data get storage rida:temp dir[1] 10000.0
execute store result score #rida.thrust rida.dz run data get storage rida:temp dir[2] 10000.0