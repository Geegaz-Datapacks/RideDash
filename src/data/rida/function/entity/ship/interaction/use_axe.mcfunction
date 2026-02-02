execute unless data entity @s data.rida.item.banner run return fail

# Drop the banner
execute if entity @p[distance=..10,tag=rida.player.interacted,gamemode=!creative] at @s run loot spawn ~ ~1 ~ loot rida:technical/drop

# Remove banner data
data remove entity @s data.rida.item.banner
item replace entity @s armor.head with air
execute on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:custom_model_data".strings[4] set value "_"
execute on passengers if entity @s[type=item_display] run data remove entity @s item.components."minecraft:banner_patterns"

playsound minecraft:block.wood.break player @a[distance=..42]

return 1