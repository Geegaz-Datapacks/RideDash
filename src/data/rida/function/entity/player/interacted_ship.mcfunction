advancement revoke @s only rida:technical/interacted_ship

tag @s add rida.interactor
execute as @n[type=interaction,tag=rida.ship.interaction,distance=..10,nbt={interaction:{}}] run function rida:entity/ship/interaction/interacted
tag @s remove rida.interactor