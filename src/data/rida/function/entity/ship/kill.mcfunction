# Use the display for ^ ^ ^ positioning
execute on passengers if entity @s[type=item_display] at @s run function rida:entity/ship/effects/killed
execute on passengers run kill @s[tag=rida.ship]

kill @s[tag=rida.ship]