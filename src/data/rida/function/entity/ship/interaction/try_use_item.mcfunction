# Try to use the item on the vehicle
execute if data storage rida:temp item.dye if function rida:entity/ship/interaction/use_dye run return 1
execute if data storage rida:temp item.banner if function rida:entity/ship/interaction/use_banner run return 2
execute if data storage rida:temp item.axe if function rida:entity/ship/interaction/use_axe run return 3
execute if data storage rida:temp item.fire_charge if function rida:entity/ship/interaction/use_fire_charge run return 4