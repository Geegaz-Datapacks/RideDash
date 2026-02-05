# Based on ErrorCraft's Motionomicon
# https://github.com/ErrorCraft/Motionomicon/blob/master/data/motion/function/apply.mcfunction

execute if entity @s[gamemode=spectator] run return fail

function rida:entity/player/gamemode/get
gamemode spectator
item replace entity 1af80582-f0f6-4ddd-b1c0-ccaf8beee947 container.0 from entity @s saddle

# Reset motion
# tp @s 0 0 0
# tp @s ~ ~ ~

# Apply impulse
item replace entity @s saddle with barrier[equippable={slot:"saddle"},enchantments={"rida:boost":3}]

function rida:entity/player/gamemode/set with storage rida:temp player
item replace entity @s saddle from entity 1af80582-f0f6-4ddd-b1c0-ccaf8beee947 container.0