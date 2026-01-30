advancement revoke @s only rida:technical/interacted_ship

# Check if the player has an item to use
function rida:entity/player/interaction/get_item

tag @s add rida.player.interacted
execute as @n[type=interaction,tag=rida.ship.interaction,distance=..10,nbt={interaction:{}}] run function rida:entity/ship/interaction/interacted
tag @s remove rida.player.interacted