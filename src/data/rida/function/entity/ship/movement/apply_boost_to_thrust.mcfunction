scoreboard players add @s rida.boost 1
execute if score @s rida.boost >= #rida.BOOST_DURATION rida.var run return run tag @s remove rida.boosting
execute if score @s rida.fuel < #rida.BOOST_FUEL_USE rida.var run return run tag @s remove rida.boosting

# Replace the regular thrust by this boost thrust
scoreboard players operation #rida.thrust rida.var = #rida.BOOST_THRUST rida.var