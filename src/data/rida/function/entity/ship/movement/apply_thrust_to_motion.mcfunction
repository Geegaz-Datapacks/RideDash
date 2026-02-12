# Multiply the direction by the input thust
scoreboard players operation #rida.thrust rida.dx *= #rida.thrust rida.var
scoreboard players operation #rida.thrust rida.dy *= #rida.thrust rida.var
scoreboard players operation #rida.thrust rida.dz *= #rida.thrust rida.var
scoreboard players operation #rida.thrust rida.dx /= #rida.THRUST_SCALE rida.var
scoreboard players operation #rida.thrust rida.dy /= #rida.THRUST_SCALE rida.var
scoreboard players operation #rida.thrust rida.dz /= #rida.THRUST_SCALE rida.var

# Apply the thrust
scoreboard players operation #rida.motion rida.dx += #rida.thrust rida.dx
scoreboard players operation #rida.motion rida.dy += #rida.thrust rida.dy
scoreboard players operation #rida.motion rida.dz += #rida.thrust rida.dz