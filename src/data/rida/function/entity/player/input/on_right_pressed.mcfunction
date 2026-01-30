advancement revoke @s only rida:input/on_right_released

# Don't dash if the vehicle is still in cooldown
execute on vehicle unless score @s rida.dash matches 1.. run function rida:entity/ship/movement/dash_right