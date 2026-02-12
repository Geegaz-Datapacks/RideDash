advancement revoke @s only rida:input/on_left_released

# Don't dash if the vehicle is still in cooldown
execute on vehicle if score @s rida.fuel >= #rida.DASH_FUEL_USE rida.var unless score @s rida.dash matches 1.. run function rida:entity/ship/movement/dash_left