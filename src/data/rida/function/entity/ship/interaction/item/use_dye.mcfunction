execute as 1af80582-f0f6-4ddd-b1c0-ccaf8beee947 run function rida:entity/ship/interaction/item/get_dye
# Try to set a new dye - will fail if it's the same one
execute store success score #rida.success rida.var run data modify entity @s data.rida.dye set from storage rida:temp interaction.dye
execute unless score #rida.success rida.var matches 1 run return fail

# Apply dye color to the model
# NOTE: a single color colors all parts (for now)
# The 3 first strings slots are taken by the part types, so the color is index 3
execute on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:custom_model_data".strings[3] set from storage rida:temp interaction.dye.color

playsound minecraft:item.dye.use player @a[distance=..42]
return 1