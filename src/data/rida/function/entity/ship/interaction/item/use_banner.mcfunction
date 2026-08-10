# Skip if there's already a banner
execute if data entity @s data.rida.banner run return -2

# Get the banner data
data modify storage rida:temp interaction.banner.id set from entity 1af80582-f0f6-4ddd-b1c0-ccaf8beee947 item.id
data modify storage rida:temp interaction.banner.patterns set from entity 1af80582-f0f6-4ddd-b1c0-ccaf8beee947 item.components."minecraft:banner_patterns"
data modify entity @s data.rida.banner set from storage rida:temp interaction.banner
# Keep the banner in store
execute on vehicle run item replace entity @s armor.head from entity 1af80582-f0f6-4ddd-b1c0-ccaf8beee947 container.0 {function:"set_count",count:1}

# Apply banner data to the model
data modify entity @s item.components."minecraft:custom_model_data".strings[4] set from storage rida:temp interaction.banner.id
data modify entity @s item.components."minecraft:banner_patterns" set from storage rida:temp interaction.banner.patterns

playsound minecraft:block.wood.place neutral @a[distance=..20]
return 2