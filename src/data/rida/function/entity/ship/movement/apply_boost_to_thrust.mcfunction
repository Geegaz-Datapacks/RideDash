scoreboard players add @s rida.boost 1
execute if score @s rida.boost >= #rida.BOOST_DURATION rida.var run return run tag @s remove rida.boosting

# Replace the regular thrust by this boost thrust
scoreboard players operation #rida.input rida.var = #rida.BOOST_THRUST rida.var