execute on vehicle store result score #rida.health rida.var run data get entity @s Health
execute on vehicle store result score #rida.max_health rida.var run attribute @s max_health get
# Fail if the ship is already fully healed
execute if score #rida.health rida.var >= #rida.max_health rida.var run return fail

scoreboard players operation #rida.health rida.var += #rida.INGOT_HEALS rida.var
execute on vehicle store result entity @s Health float 1.0 run scoreboard players operation #rida.health rida.var < #rida.max_health rida.var

playsound rida:entity.airbike.fix neutral @a[distance=..20]
return 4