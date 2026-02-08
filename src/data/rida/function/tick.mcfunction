execute as @e[type=cat,tag=rida.ship.root] at @s run function rida:entity/ship/tick
execute as @e[type=item_display,tag=rida.ship.display] on vehicle unless function rida:entity/ship/check_alive run function rida:entity/ship/kill
execute as @e[type=item_display,tag=rida.boost_ring] at @s run function rida:entity/boost_ring/tick
execute as @e[type=armor_stand,tag=rida.summon] at @s run function rida:entity/ship/summon
execute as @a at @s run function rida:entity/player/tick

# Remove "boosted" tag
execute as @e[type=#rida:can_boost,tag=rida.boost_ring.boosted] at @s unless entity @e[type=item_display,tag=rida.boost_ring,distance=..5] run tag @s remove rida.boost_ring.boosted

# Reset the forceloaded marker's position
tp 9e21e514-e8c0-42d0-9d9c-ce3bc6fbdbe6 0.0 0.0 0.0
# Reset the forceloaded item display's item
item replace entity 1af80582-f0f6-4ddd-b1c0-ccaf8beee947 container.0 with air