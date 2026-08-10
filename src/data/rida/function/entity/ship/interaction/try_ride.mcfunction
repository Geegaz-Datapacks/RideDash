# Safeguard to not have too many riders at the same time
execute store result score #rida.riders rida.var if entity @a[tag=rida.riding]
execute if score #rida.riders rida.var >= #rida.MAX_RIDERS rida.var on target run return run title @s actionbar {"translate":"message.rida.too_many_riders","fallback":"Too many riders - try again later"}

# Don't ride if the player is sneaking
execute on target if predicate rida:input/is_sneak_pressed run return fail
execute on vehicle unless predicate rida:technical/has_rider run function rida:entity/ship/ride