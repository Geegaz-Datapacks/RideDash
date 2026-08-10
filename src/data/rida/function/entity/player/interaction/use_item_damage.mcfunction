scoreboard players add #rida.damage rida.var 1

# Break the item if needed and skip damaging it
execute if score #rida.damage rida.var >= #rida.max_damage rida.var run return run function rida:entity/player/interaction/break_item
# Otherwise, just damage it
execute store result entity 1af80582-f0f6-4ddd-b1c0-ccaf8beee947 item.components."minecraft:damage" int 1.0 run scoreboard players get #rida.damage rida.var
item replace entity @s weapon.mainhand from entity 1af80582-f0f6-4ddd-b1c0-ccaf8beee947 container.0


