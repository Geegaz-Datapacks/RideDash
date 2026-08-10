scoreboard players add @s rida.boost 1
tag @s remove rida.boosting
execute if score @s rida.boost >= #rida.BOOST_DURATION rida.var run return fail
execute if score @s rida.fuel < #rida.BOOST_FUEL_USE rida.var run return fail
tag @s add rida.boosting

# Replace the regular thrust by this boost thrust
scoreboard players operation #rida.thrust rida.var = #rida.BOOST_THRUST rida.var
# Make sure we return a value to confirm the boost
return 1