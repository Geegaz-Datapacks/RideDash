execute unless data entity @s data.rida.banner run return fail
execute as 1af80582-f0f6-4ddd-b1c0-ccaf8beee947 run function rida:entity/ship/interaction/item/get_axe

# Drop the banner
execute on vehicle at @s run loot spawn ~ ~1 ~ loot rida:technical/drop
execute on vehicle run item replace entity @s armor.head with air

# Remove banner data
data remove entity @s data.rida.banner
data modify entity @s item.components."minecraft:custom_model_data".strings[4] set value "_"
data remove entity @s item.components."minecraft:banner_patterns"

playsound minecraft:block.wood.break neutral @a[distance=..20]
return 10