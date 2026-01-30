# Try to remove the "rida.alive" tag from the ship
return run tag @s remove rida.alive

# NOTE: the ship tags itself "rida.alive" during its own tick, and this function only succeeds if the ship has the tag.
# Since @e only selects alive entities, the "rida.alive" tag will not be set on the tick where the entity dies so this function will fail.