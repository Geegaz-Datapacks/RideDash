data modify storage rida:temp item.axe set value {}
execute store result score #rida.damage rida.var run data get entity @s SelectedItem.components."minecraft:damage"
execute store result score #rida.max_damage rida.var run data get entity @s SelectedItem.components."minecraft:max_damage"

execute unless score #rida.max_damage rida.var matches 1.. if items entity @s weapon.mainhand wooden_axe run return run scoreboard players set #rida.max_damage rida.var 59
execute unless score #rida.max_damage rida.var matches 1.. if items entity @s weapon.mainhand stone_axe run return run scoreboard players set #rida.max_damage rida.var 131
execute unless score #rida.max_damage rida.var matches 1.. if items entity @s weapon.mainhand copper_axe run return run scoreboard players set #rida.max_damage rida.var 190
execute unless score #rida.max_damage rida.var matches 1.. if items entity @s weapon.mainhand iron_axe run return run scoreboard players set #rida.max_damage rida.var 250
execute unless score #rida.max_damage rida.var matches 1.. if items entity @s weapon.mainhand golden_axe run return run scoreboard players set #rida.max_damage rida.var 32
execute unless score #rida.max_damage rida.var matches 1.. if items entity @s weapon.mainhand diamond_axe run return run scoreboard players set #rida.max_damage rida.var 1561
execute unless score #rida.max_damage rida.var matches 1.. if items entity @s weapon.mainhand netherite_axe run return run scoreboard players set #rida.max_damage rida.var 2031