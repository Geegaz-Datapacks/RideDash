scoreboard players operation @s rida.dash = #rida.DASH_COOLDOWN rida.var
scoreboard players operation @s rida.fuel -= #rida.DASH_FUEL_USE rida.var

# #rida.thrust & #rida.motion will be overridden, so no need to reset them

# Get the left direction using the forceloaded marker
execute positioned 0.0 0.0 0.0 run tp 9e21e514-e8c0-42d0-9d9c-ce3bc6fbdbe6 ^1 ^ ^
function rida:entity/ship/movement/get_dir
function rida:entity/ship/movement/get_motion

# Apply the dash thrust to the motion directly
scoreboard players operation #rida.thrust rida.var = #rida.DASH_THRUST rida.var
function rida:entity/ship/movement/apply_thrust_to_motion
function rida:entity/ship/movement/set_motion

particle explosion
particle gust