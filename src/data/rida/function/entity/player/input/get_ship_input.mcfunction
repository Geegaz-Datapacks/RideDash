# Get the input thrust
scoreboard players reset #rida.input
execute if predicate rida:input/is_forward_pressed run scoreboard players operation #rida.input rida.var += #rida.FORWARD_THRUST rida.var
execute if predicate rida:input/is_backward_pressed run scoreboard players operation #rida.input rida.var += #rida.BACKWARD_THRUST rida.var

# Rotate the vehicle using the player's look rotation
execute rotated as @s on vehicle run function rida:entity/ship/rotate