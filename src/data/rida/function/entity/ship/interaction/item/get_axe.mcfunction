# Will succeed if the axe has a custom max_damage component, otherwise we have to get the max_damage manually
execute if function rida:entity/ship/interaction/item/get_item_damage run return fail

execute if items entity @s container.0 wooden_axe run return run scoreboard players set #rida.max_damage rida.var 59
execute if items entity @s container.0 stone_axe run return run scoreboard players set #rida.max_damage rida.var 131
execute if items entity @s container.0 copper_axe run return run scoreboard players set #rida.max_damage rida.var 190
execute if items entity @s container.0 iron_axe run return run scoreboard players set #rida.max_damage rida.var 250
execute if items entity @s container.0 golden_axe run return run scoreboard players set #rida.max_damage rida.var 32
execute if items entity @s container.0 diamond_axe run return run scoreboard players set #rida.max_damage rida.var 1561
execute if items entity @s container.0 netherite_axe run return run scoreboard players set #rida.max_damage rida.var 2031