scoreboard players reset #rida.success rida.var
execute store result score #rida.success rida.var on vehicle at @s run function rida:entity/ship/interaction/try_use_item

# If an item was used successfuly on the ship, make the player use it (lower the count, add damage...)
execute if score #rida.success rida.var matches 1 on target run function rida:entity/player/interaction/use_item_count
execute if score #rida.success rida.var matches 2 on target run function rida:entity/player/interaction/use_item_count
execute if score #rida.success rida.var matches 3 on target run function rida:entity/player/interaction/use_item_damage
execute if score #rida.success rida.var matches 4 on target run function rida:entity/player/interaction/use_item_count
# Otherwise, try to ride the ship
execute unless score #rida.success rida.var matches 1.. run function rida:entity/ship/interaction/try_ride

data remove entity @s interaction