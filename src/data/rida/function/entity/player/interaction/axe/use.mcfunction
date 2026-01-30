execute if score #rida.damage rida.var >= #rida.max_damage rida.var run tag @s[gamemode=!creative] add rida.item.break

item replace entity @s[tag=rida.item.break] weapon.mainhand with air
$item modify entity @s[tag=!rida.item.break,gamemode=!creative] weapon.mainhand {function:"set_components",components:{damage:$(damage)}}

execute if entity @s[tag=rida.item.break] run playsound minecraft:entity.item.break player @a[distance=..42]
playsound minecraft:block.wood.break player @a[distance=..42]

tag @s remove rida.item.break