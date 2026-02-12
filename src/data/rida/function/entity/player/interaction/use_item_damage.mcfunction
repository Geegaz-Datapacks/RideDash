scoreboard players add #rida.damage rida.var 1
execute if score #rida.damage rida.var >= #rida.max_damage rida.var run return run function rida:entity/player/interaction/break_item

execute as 1af80582-f0f6-4ddd-b1c0-ccaf8beee947 run function rida:entity/ship/interaction/item/set_item_damage
item replace entity @s weapon.mainhand from entity 1af80582-f0f6-4ddd-b1c0-ccaf8beee947 container.0


