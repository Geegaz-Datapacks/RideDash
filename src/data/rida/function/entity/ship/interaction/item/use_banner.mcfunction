execute if data entity @s data.rida.banner run return fail
execute as 1af80582-f0f6-4ddd-b1c0-ccaf8beee947 run function rida:entity/ship/interaction/item/get_banner

# Copy banner data
data modify entity @s data.rida.banner set from storage rida:temp interaction.banner
item replace entity @s armor.head from entity 1af80582-f0f6-4ddd-b1c0-ccaf8beee947 container.0 {function:"set_count",count:1}

# Apply banner data to the model
execute on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:custom_model_data".strings[4] set from storage rida:temp interaction.banner.color
execute on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:banner_patterns" set from storage rida:temp interaction.banner.patterns

playsound minecraft:block.wood.place player @a[distance=..42]
return 2