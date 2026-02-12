advancement revoke @s only rida:technical/interacted_ship

data remove storage rida:temp interaction
execute if entity @s[gamemode=creative] run data modify storage rida:temp interaction set value {creative:true}

# Store the item the player used to interact
item replace entity 1af80582-f0f6-4ddd-b1c0-ccaf8beee947 container.0 from entity @s weapon.mainhand

execute as @n[type=interaction,tag=rida.ship.interaction,distance=..10,nbt={interaction:{}}] run function rida:entity/ship/interaction/interacted