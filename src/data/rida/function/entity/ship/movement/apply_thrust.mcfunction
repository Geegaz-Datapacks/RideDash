# Input:
# - score #rida.thrust rida.var for thrust strength
# - position of forceloaded display for thrust direction

# NOTE: it's faster to use data from storage than using it from the entity directly

# Get the direction using the forceloaded display
data modify storage rida:temp dir set from entity 1af80582-f0f6-4ddd-b1c0-ccaf8beee947 Pos
execute store result score #rida.thrust rida.dx run data get storage rida:temp dir[0] 10000.0
execute store result score #rida.thrust rida.dy run data get storage rida:temp dir[1] 10000.0
execute store result score #rida.thrust rida.dz run data get storage rida:temp dir[2] 10000.0

# Get the current motion of the vehicle
data modify storage rida:temp motion set from entity @s Motion
execute store result score #rida.motion rida.dx run data get storage rida:temp motion[0] 10000.0
execute store result score #rida.motion rida.dy run data get storage rida:temp motion[1] 10000.0
execute store result score #rida.motion rida.dz run data get storage rida:temp motion[2] 10000.0

# Multiply the direction by the input thust
scoreboard players operation #rida.thrust rida.dx *= #rida.thrust rida.var
scoreboard players operation #rida.thrust rida.dy *= #rida.thrust rida.var
scoreboard players operation #rida.thrust rida.dz *= #rida.thrust rida.var
scoreboard players operation #rida.thrust rida.dx /= #rida.THRUST_SCALE rida.var
scoreboard players operation #rida.thrust rida.dy /= #rida.THRUST_SCALE rida.var
scoreboard players operation #rida.thrust rida.dz /= #rida.THRUST_SCALE rida.var

# Apply the thrust
scoreboard players operation #rida.motion rida.dx += #rida.thrust rida.dx
scoreboard players operation #rida.motion rida.dy += #rida.thrust rida.dy
scoreboard players operation #rida.motion rida.dz += #rida.thrust rida.dz

# Store the motion back to the vehicle
# Since the base entity is a cat, multiply the vertical motion by a smaller number to compensate the difference between horizontal & vertical drag (0.98 / 0.93)
execute store result storage rida:temp motion[0] float 0.0001 run scoreboard players get #rida.motion rida.dx
execute store result storage rida:temp motion[1] float 0.00009489795 run scoreboard players get #rida.motion rida.dy
execute store result storage rida:temp motion[2] float 0.0001 run scoreboard players get #rida.motion rida.dz
data modify entity @s Motion set from storage rida:temp motion