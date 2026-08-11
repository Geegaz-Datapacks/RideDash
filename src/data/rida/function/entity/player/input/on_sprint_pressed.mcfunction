# Try to apply boost to the ship, and don't apply the zoom effect if it fails
execute on vehicle unless function rida:entity/ship/movement/apply_boost_to_thrust run return fail
# Add a zoom effect
attribute @s movement_speed modifier add rida:boost 0.1 add_value