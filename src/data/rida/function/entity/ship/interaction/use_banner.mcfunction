# Copy banner data
data modify entity @s data.rida.item.banner set from storage rida:temp item.banner
item replace entity @s armor.head from entity @p[distance=..10,tag=rida.player.interacted] weapon.mainhand {function:"set_count",count:1}

# Apply banner data to the model
execute on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:custom_model_data".strings[4] set from storage rida:temp item.banner.color
execute on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:banner_patterns" set from storage rida:temp item.banner.patterns

execute as @p[distance=..10,tag=rida.player.interacted] run function rida:entity/player/interaction/banner/use