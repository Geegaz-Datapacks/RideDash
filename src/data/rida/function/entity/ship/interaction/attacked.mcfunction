# Kill the ship if the player who hit it is in creative
execute if data storage rida:temp interaction.creative on vehicle unless predicate rida:technical/has_rider run function rida:entity/ship/kill

data remove entity @s attack