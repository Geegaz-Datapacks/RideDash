# Get the dash input
execute if entity @s[tag=!rida.input.left_pressed,predicate=rida:input/is_left_pressed] run function rida:entity/player/input/on_left_pressed
execute if entity @s[tag=!rida.input.right_pressed,predicate=rida:input/is_right_pressed] run function rida:entity/player/input/on_right_pressed
# Only allow dashing again when the player lets go of the keys
tag @s[tag=rida.input.left_pressed,predicate=!rida:input/is_left_pressed] remove rida.input.left_pressed
tag @s[tag=rida.input.right_pressed,predicate=!rida:input/is_right_pressed] remove rida.input.right_pressed

# Get the input thrust
scoreboard players reset #rida.thrust
execute if predicate rida:input/is_jump_pressed run scoreboard players set #rida.thrust rida.var 0
execute if predicate rida:input/is_forward_pressed run scoreboard players operation #rida.thrust rida.var += #rida.FORWARD_THRUST rida.var
execute if predicate rida:input/is_backward_pressed run scoreboard players operation #rida.thrust rida.var += #rida.BACKWARD_THRUST rida.var

attribute @s movement_speed modifier remove rida:boost
execute if predicate rida:input/is_sprint_pressed run function rida:entity/player/input/on_sprint_pressed

# Rotate the vehicle using the player's look rotation (since this was called with "at @s")
execute on vehicle if entity @s[tag=rida.moving] run function rida:entity/ship/rotate