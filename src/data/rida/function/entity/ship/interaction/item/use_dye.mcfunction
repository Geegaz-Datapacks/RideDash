# Get the dye data
data modify storage rida:temp interaction.dye.id set from entity 1af80582-f0f6-4ddd-b1c0-ccaf8beee947 item.id

# Skip if the same dye is already applied
execute store success score #rida.success rida.var run data modify entity @s data.rida.dye set from storage rida:temp interaction.dye
execute unless score #rida.success rida.var matches 1 run return fail

# Apply dye data
data modify entity @s item.components."minecraft:custom_model_data".strings[3] set from storage rida:temp interaction.dye.id

playsound minecraft:item.dye.use neutral @a[distance=..20]
return 1