scoreboard players operation @s rida.dash = #rida.DASH_COOLDOWN rida.var

# Get the left direction using the forceloaded marker
execute positioned 0.0 0.0 0.0 run tp 9e21e514-e8c0-42d0-9d9c-ce3bc6fbdbe6 ^1 ^ ^
function rida:entity/ship/movement/get_dir
function rida:entity/ship/movement/get_motion

# Apply the dash thrust to the motion directly
scoreboard players operation #rida.input rida.var = #rida.DASH_THRUST rida.var
function rida:entity/ship/movement/apply_thrust_to_motion
function rida:entity/ship/movement/set_motion

particle explosion
particle gust

scoreboard players reset #rida.motion
scoreboard players reset #rida.input