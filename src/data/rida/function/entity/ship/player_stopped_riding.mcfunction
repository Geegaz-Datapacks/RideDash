tag @s remove rida.ridden
tag @s remove rida.boosting

execute on passengers if entity @s[type=interaction] run data merge entity @s {width:1,height:1.5}
execute on passengers if entity @s[type=item_display] run data merge entity @s {transformation:{right_rotation:[0f,0f,0f,1f]}}

execute if predicate rida:technical/is_riding_entity run return fail

summon armor_stand ~ ~ ~ {Tags:[rida.ship,rida.ship.gravity],Silent:1b,Invulnerable:1b,Invisible:1b,Small:1b,attributes:[{id:"scale",base:0},{id:"gravity",base:0.01}]}
ride @s mount @n[type=armor_stand,tag=rida.ship.gravity]