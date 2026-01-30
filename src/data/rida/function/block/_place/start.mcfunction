advancement revoke @s only rida:technical/placed_custom_block
tag @s add rida.placing

execute store result score #rida.raycast rida.var run attribute @s block_interaction_range get 1.0
execute anchored eyes run function rida:block/_place/raycast

tag @s remove rida.placing