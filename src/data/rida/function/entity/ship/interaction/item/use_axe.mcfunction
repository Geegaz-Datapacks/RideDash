execute unless data entity @s data.rida.banner run return fail
execute as 1af80582-f0f6-4ddd-b1c0-ccaf8beee947 run function rida:entity/ship/interaction/item/get_axe

# Drop the banner
execute unless data storage rida:temp interaction.creative at @s run loot spawn ~ ~1 ~ loot rida:technical/drop

# Remove banner data
data remove entity @s data.rida.banner
item replace entity @s armor.head with air
execute on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:custom_model_data".strings[4] set value "_"
execute on passengers if entity @s[type=item_display] run data remove entity @s item.components."minecraft:banner_patterns"

playsound minecraft:block.wood.break player @a[distance=..42]
return 10