# Ship tick
execute as @e[type=cat,tag=rida.ship] at @s run function rida:entity/ship/tick
execute as @e[type=item_display,tag=rida.ship.display] on vehicle unless function rida:entity/ship/check_alive run function rida:entity/ship/kill
# Ship summoning
execute as @e[type=armor_stand,tag=rida.summon] at @s run function rida:entity/ship/summon

# Remove "riding" tag and reset player
execute as @a[tag=rida.riding,predicate=!rida:technical/is_riding_ship] run function rida:entity/player/stopped_riding_ship