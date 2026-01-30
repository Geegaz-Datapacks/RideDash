data remove entity @s interaction

# Try to use the item
execute on vehicle if data storage rida:temp item.dye if function rida:entity/ship/interaction/try_use_dye run return run function rida:entity/ship/interaction/use_dye
execute on vehicle if data storage rida:temp item.banner unless data entity @s data.rida.item.banner run return run function rida:entity/ship/interaction/use_banner
execute on vehicle if data storage rida:temp item.axe if data entity @s data.rida.item.banner run return run function rida:entity/ship/interaction/use_axe

# Otherwise, start riding
execute on vehicle unless entity @p[distance=..10,tag=rida.player.interacted,predicate=rida:input/is_sneak_pressed] unless predicate rida:technical/has_rider run function rida:entity/ship/ride