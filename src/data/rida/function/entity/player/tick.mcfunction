
execute if entity @s[tag=!rida.riding] run return fail
## If the rider had a vehicule last tick, this section will run one last time ------------
attribute @s minecraft:movement_speed modifier remove rida:boost
## ---------------------------------------------------------------------------------------
execute if entity @s[tag=rida.riding,predicate=!rida:technical/is_riding_ship] run return run function rida:entity/player/stopped_riding_ship

attribute @s[predicate=rida:technical/is_vehicle_boosting] minecraft:movement_speed modifier add rida:boost 0.05 add_value