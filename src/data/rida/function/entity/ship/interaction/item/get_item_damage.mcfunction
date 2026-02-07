execute store result score #rida.damage rida.var run data get entity @s item.components."minecraft:damage"
execute store result score #rida.max_damage rida.var run data get entity @s item.components."minecraft:max_damage"

# Will only succeed if the axe has a custom max_damage component
return run scoreboard players get #rida.max_damage rida.var