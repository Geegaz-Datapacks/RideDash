
# Get the player's item
execute on target run item replace entity 1af80582-f0f6-4ddd-b1c0-ccaf8beee947 container.0 from entity @s weapon.mainhand

scoreboard players reset #rida.success rida.var
execute store result score #rida.success rida.var on vehicle on passengers if entity @s[type=item_display] run function rida:entity/ship/interaction/try_use_item

# If an item was used successfuly on the ship, make the player use it (lower the count, add damage...)
execute if score #rida.success rida.var matches 1..9 on target if entity @s[gamemode=!creative] run function rida:entity/player/interaction/use_item_count
execute if score #rida.success rida.var matches 10..19 on target if entity @s[gamemode=!creative] run function rida:entity/player/interaction/use_item_damage
# Swing the hand if an item was used successfuly
execute if score #rida.success rida.var matches 1.. on target run swing @s
# Specific case: give a hint if a player tries to place a banner while there is already one
execute if score #rida.success rida.var matches -2 on target run title @s actionbar {translate:"message.rida.use_axe",fallback:"Use an axe to remove the banner from an Airbike",color:"red"}
# Otherwise, try to ride the ship
execute unless score #rida.success rida.var matches 1.. run function rida:entity/ship/interaction/try_ride

data remove entity @s interaction