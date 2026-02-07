advancement revoke @s only rida:technical/attacked_ship

data remove storage rida:temp interaction
execute if entity @s[gamemode=creative] run data modify storage rida:temp interaction set value {creative:true}

execute as @n[type=interaction,tag=rida.ship.interaction,distance=..10,nbt={attack:{}}] run function rida:entity/ship/interaction/attacked