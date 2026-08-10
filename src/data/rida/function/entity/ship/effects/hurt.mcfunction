execute if score @s rida.hurt matches 9 run return run function rida:entity/ship/effects/hurt_hit
execute if score @s rida.hurt matches 7 run return run data modify storage rida:temp display.transformation.left_rotation set value [0f,0f,-0.6f,1f]
execute if score @s rida.hurt matches 5 run return run data modify storage rida:temp display.transformation.left_rotation set value [0f,0f,0.4f,1f]
execute if score @s rida.hurt matches 3 run return run data modify storage rida:temp display.transformation.left_rotation set value [0f,0f,-0.4f,1f]
execute if score @s rida.hurt matches 1 run return run data modify storage rida:temp display.transformation.left_rotation set value [0f,0f,0f,1f]