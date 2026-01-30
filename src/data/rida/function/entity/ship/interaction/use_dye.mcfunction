# Apply dye color to the model
# NOTE: a single color colors all parts (for now)
# The 3 first strings slots are taken by the part types, so the color is index 3
execute on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:custom_model_data".strings[3] set from storage rida:temp item.dye.color

execute as @p[distance=..10,tag=rida.player.interacted] run function rida:entity/player/interaction/dye/use