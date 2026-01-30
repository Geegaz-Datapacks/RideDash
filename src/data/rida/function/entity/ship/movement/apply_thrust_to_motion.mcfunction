# Multiply the input direction by the input thust
scoreboard players operation #rida.input rida.dx *= #rida.input rida.var
scoreboard players operation #rida.input rida.dy *= #rida.input rida.var
scoreboard players operation #rida.input rida.dz *= #rida.input rida.var
scoreboard players operation #rida.input rida.dx /= #rida.PRECISION_SCALE rida.var
scoreboard players operation #rida.input rida.dy /= #rida.PRECISION_SCALE rida.var
scoreboard players operation #rida.input rida.dz /= #rida.PRECISION_SCALE rida.var

# Apply the thrust
scoreboard players operation #rida.motion rida.dx += #rida.input rida.dx
scoreboard players operation #rida.motion rida.dy += #rida.input rida.dy
scoreboard players operation #rida.motion rida.dz += #rida.input rida.dz