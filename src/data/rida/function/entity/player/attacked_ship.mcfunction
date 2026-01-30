advancement revoke @s only rida:technical/attacked_ship

execute if entity @s[gamemode=creative] at @s as @n[type=interaction,tag=rida.ship.interaction,distance=..10,nbt={attack:{}}] run function rida:entity/ship/interaction/attacked