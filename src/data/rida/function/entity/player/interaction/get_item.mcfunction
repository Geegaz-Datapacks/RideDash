data remove storage rida:temp item

execute if items entity @s weapon.mainhand #rida:dyes run return run function rida:entity/player/interaction/get_dye
execute if items entity @s weapon.mainhand #minecraft:axes run return run function rida:entity/player/interaction/get_axe
execute if items entity @s weapon.mainhand #minecraft:banners run return run function rida:entity/player/interaction/get_banner
execute if items entity @s weapon.mainhand minecraft:fire_charge run return run data modify storage rida:temp item.fire_charge set value {}
