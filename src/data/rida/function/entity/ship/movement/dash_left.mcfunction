scoreboard players operation @s rida.dash = #rida.DASH_COOLDOWN rida.var
scoreboard players operation @s rida.fuel -= #rida.DASH_FUEL_USE rida.var

# Get the left direction using the forceloaded marker
execute positioned 0.0 0.0 0.0 run tp 1af80582-f0f6-4ddd-b1c0-ccaf8beee947 ^1 ^ ^
# Apply the dash thrust to the motion directly
scoreboard players operation #rida.thrust rida.var = #rida.DASH_THRUST rida.var

function rida:entity/ship/movement/apply_thrust

particle explosion ~ ~ ~ 0.0 0.0 0.0 0 1 normal @a[distance=..40]
particle gust ~ ~ ~ 0.0 0.0 0.0 0 1 normal @a[distance=..40]
playsound rida:entity.airbike.dash neutral @a[distance=..40] ~ ~ ~