execute as @e[type=cat,tag=rida.ship.root] at @s run function rida:entity/ship/tick
execute as @e[type=item_display,tag=rida.ship.display] on vehicle unless function rida:entity/ship/check_alive run function rida:entity/ship/kill
execute as @a at @s run function rida:entity/player/tick

# Reset the motion marker's position
tp 9e21e514-e8c0-42d0-9d9c-ce3bc6fbdbe6 0.0 0.0 0.0