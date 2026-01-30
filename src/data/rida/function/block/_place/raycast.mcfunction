scoreboard players remove #rida.raycast rida.var 1

execute positioned ~ ~ ~ if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end
execute positioned ~ ~ ~1 if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end
execute positioned ~ ~ ~-1 if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end
execute positioned ~ ~1 ~ if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end
execute positioned ~ ~1 ~1 if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end
execute positioned ~ ~1 ~-1 if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end
execute positioned ~ ~-1 ~ if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end
execute positioned ~ ~-1 ~1 if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end
execute positioned ~ ~-1 ~-1 if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end

execute positioned ~1 ~ ~ if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end
execute positioned ~1 ~ ~1 if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end
execute positioned ~1 ~ ~-1 if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end
execute positioned ~1 ~1 ~ if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end
execute positioned ~1 ~1 ~1 if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end
execute positioned ~1 ~1 ~-1 if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end
execute positioned ~1 ~-1 ~ if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end
execute positioned ~1 ~-1 ~1 if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end
execute positioned ~1 ~-1 ~-1 if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end

execute positioned ~-1 ~ ~ if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end
execute positioned ~-1 ~ ~1 if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end
execute positioned ~-1 ~ ~-1 if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end
execute positioned ~-1 ~1 ~ if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end
execute positioned ~-1 ~1 ~1 if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end
execute positioned ~-1 ~1 ~-1 if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end
execute positioned ~-1 ~-1 ~ if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end
execute positioned ~-1 ~-1 ~1 if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end
execute positioned ~-1 ~-1 ~-1 if predicate rida:location/is_custom_block run return run function rida:block/_place/raycast_end

execute if score #rida.raycast rida.var matches 1.. positioned ^ ^ ^1 run function rida:block/_place/raycast