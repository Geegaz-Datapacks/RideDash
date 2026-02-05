tag @s add rida.ridden

execute on passengers if entity @s[type=interaction] run data merge entity @s {width:0,height:0}
execute on passengers if entity @s[type=item_display] run data merge entity @s {transformation:{right_rotation:[0f,0f,0f,1f]}}
execute on vehicle run kill @s[tag=rida.ship]