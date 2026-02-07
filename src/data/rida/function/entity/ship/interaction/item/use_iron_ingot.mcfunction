execute store result score #rida.health rida.var run data get entity @s Health
execute store result score #rida.max_health rida.var run attribute @s max_health get
# Fail if the ship is already fully healed
execute if score #rida.health rida.var >= #rida.max_health rida.var run return fail

scoreboard players operation #rida.health rida.var += #rida.INGOT_HEALS rida.var
execute store result entity @s Health float 1.0 run scoreboard players operation #rida.health rida.var < #rida.max_health rida.var

playsound minecraft:entity.iron_golem.repair player @a[distance=..42]
return 4