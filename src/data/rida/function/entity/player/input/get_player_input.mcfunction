# Get the input thrust
execute if predicate rida:input/is_forward_pressed run scoreboard players operation #rida.thrust rida.var += #rida.FORWARD_THRUST rida.var
execute if predicate rida:input/is_backward_pressed run scoreboard players operation #rida.thrust rida.var += #rida.BACKWARD_THRUST rida.var

# Rotate the vehicle using the player's look rotation (since this was called with "at @s")
execute on vehicle run function rida:entity/ship/rotate