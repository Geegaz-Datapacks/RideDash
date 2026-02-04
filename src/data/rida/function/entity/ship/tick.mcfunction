# Temporary tag to ensure the ship is still alive
tag @s add rida.alive
# Necessary to avoid ships attacking players and killing themselves (only if the root is a bee)
# data remove entity @s[predicate=rida:technical/is_targeting] anger_end_time

## PROCESS:
# - reset transformation
# - update scores
# - check if hurt
# - check if has a rider
# If has a rider:
#   - update movement & visuals
# - apply transformation to displays

data remove storage rida:temp display
# Update scores (even without a rider)
scoreboard players remove @s[scores={rida.dash=1..}] rida.dash 1
scoreboard players remove @s[scores={rida.boost=1..},tag=!rida.boosting] rida.boost 1

execute store result score @s rida.hurt run data get entity @s HurtTime
execute if score @s rida.hurt matches 1.. run function rida:entity/ship/effects/hurt

execute if entity @s[tag=rida.ridden,predicate=!rida:technical/has_rider] run function rida:entity/ship/player_stopped_riding
execute if entity @s[tag=!rida.ridden,predicate=rida:technical/has_rider] run function rida:entity/ship/player_started_riding
execute if entity @s[tag=rida.ridden] run function rida:entity/ship/tick_ridden

execute if data storage rida:temp display run function rida:entity/ship/display/set_display

