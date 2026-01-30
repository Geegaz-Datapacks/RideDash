data remove storage rida:temp item

execute if items entity @s weapon.mainhand #rida:dyes run return run function rida:entity/player/interaction/dye/get
execute if items entity @s weapon.mainhand #minecraft:axes run return run function rida:entity/player/interaction/axe/get
execute if items entity @s weapon.mainhand #minecraft:banners run return run function rida:entity/player/interaction/banner/get
