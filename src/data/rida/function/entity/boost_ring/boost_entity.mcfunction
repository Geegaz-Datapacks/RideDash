# Set the entity's motion directly from the forceloaded marker
# Note: if we want motion to be added instead, copy the functions in dash_left or dash_right
execute positioned 0.0 0.0 0.0 run tp 9e21e514-e8c0-42d0-9d9c-ce3bc6fbdbe6 ^ ^ ^3
data modify entity @s Motion set from entity 9e21e514-e8c0-42d0-9d9c-ce3bc6fbdbe6 Pos