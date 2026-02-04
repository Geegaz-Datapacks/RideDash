execute if score @s rida.hurt matches 9 run data modify storage rida:temp display.transformation.left_rotation set value [0f,0f,0.6f,1f]
execute if score @s rida.hurt matches 7 run data modify storage rida:temp display.transformation.left_rotation set value [0f,0f,-0.6f,1f]
execute if score @s rida.hurt matches 5 run data modify storage rida:temp display.transformation.left_rotation set value [0f,0f,0.4f,1f]
execute if score @s rida.hurt matches 3 run data modify storage rida:temp display.transformation.left_rotation set value [0f,0f,-0.4f,1f]
execute if score @s rida.hurt matches 1 run data modify storage rida:temp display.transformation.left_rotation set value [0f,0f,0f,1f]

execute unless score @s rida.hurt matches 9 run return fail

playsound entity.blaze.hurt neutral @a[distance=..42]
particle block{block_state:{Name:"blast_furnace"}} ~ ~0.1 ~ 0.5 0.5 0.5 0.05 20