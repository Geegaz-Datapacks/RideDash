# NOTE: it's faster to use data from storage than using it from the entity directly 
# since the game would have to serialize the nbt every time.

# Get the input dir
execute positioned 0.0 0.0 0.0 run tp 9e21e514-e8c0-42d0-9d9c-ce3bc6fbdbe6 ^ ^ ^1
function rida:entity/ship/movement/get_dir
function rida:entity/ship/movement/get_motion

# Apply the thrust from the player's input
scoreboard players operation #rida.input rida.var *= @s rida.stat.speed
function rida:entity/ship/movement/apply_thrust_to_motion
function rida:entity/ship/movement/set_motion

scoreboard players reset #rida.motion
scoreboard players reset #rida.input