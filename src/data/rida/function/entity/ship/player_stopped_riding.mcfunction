tag @s remove rida.ridden
tag @s remove rida.boosting

execute on passengers if entity @s[type=interaction] run data merge entity @s {width:1,height:1.5}
execute on passengers if entity @s[type=item_display] run data merge entity @s {transformation:{right_rotation:[0f,0f,0f,1f]}}