# Safeguard to not have too many riders at the same time
execute store result score #rida.riders rida.var if entity @e[type=#rida:ship_root,tag=rida.ship,predicate=rida:technical/has_rider]
execute if score #rida.riders rida.var >= #rida.MAX_RIDERS rida.var on target run return run title @s actionbar "Too many riders - try again later"

# Don't ride if the player is sneaking
execute on target if predicate rida:input/is_sneak_pressed run return fail

execute on vehicle unless predicate rida:technical/has_rider run function rida:entity/ship/ride