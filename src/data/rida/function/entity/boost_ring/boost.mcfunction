rotate @s ~ ~
execute if entity @s[type=minecraft:player] at @s run function rida:entity/boost_ring/boost_player
execute if entity @s[type=!minecraft:player] at @s run function rida:entity/boost_ring/boost_entity
tag @s add rida.boost_ring.boosted

particle explosion
particle gust
playsound minecraft:entity.puffer_fish.blow_out block @a[distance=..42] ~ ~ ~ 1.0 1.5
playsound minecraft:entity.breeze.shoot block @a[distance=..42] ~ ~ ~ 1.0