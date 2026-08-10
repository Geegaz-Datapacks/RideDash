# SCORES

# Used for constants and calculations
scoreboard objectives add rida.var dummy

# X, Y and Z coordinates for motion calculations
# Motion values are scaled by #rida.10000 for precision
scoreboard objectives add rida.dx dummy
scoreboard objectives add rida.dy dummy
scoreboard objectives add rida.dz dummy

# Progress of the hurt animation
scoreboard objectives add rida.hurt dummy

# State of the airbike:
# - tilt from the previous tick
# - dash cooldown
# - remaining boost
# - remaining fuel
scoreboard objectives add rida.tilt dummy
scoreboard objectives add rida.dash dummy
scoreboard objectives add rida.boost dummy
scoreboard objectives add rida.fuel dummy

# Stats of the airbike:
# - strength of the thrust
# - ticks of fuel
scoreboard objectives add rida.stat.thrust dummy
scoreboard objectives add rida.stat.fuel dummy

# CONSTANTS

# Scale used for float operations
scoreboard players set #rida.10000 rida.var 10000

# Base strength of the forward & backward thrust (before applying rida.stat.thrust)
scoreboard players set #rida.FORWARD_THRUST rida.var 100
scoreboard players set #rida.BACKWARD_THRUST rida.var -60

# Boost is stronger than forward thrust, but only applied when the sprint key is pressed
scoreboard players set #rida.BOOST_THRUST rida.var 200
# Ticks the boost can be used. Recharges when the sprint key is released
scoreboard players set #rida.BOOST_DURATION rida.var 20
# Fuel used per tick when using the boost
scoreboard players set #rida.BOOST_FUEL_USE rida.var 2

# Thrust applied in a single tick when dashing (ignores rida.stat.thrust)
scoreboard players set #rida.DASH_THRUST rida.var 15000
# Ticks before being able to dash again
scoreboard players set #rida.DASH_COOLDOWN rida.var 20
# Fuel used by a dash
scoreboard players set #rida.DASH_FUEL_USE rida.var 100

# Amount of pixels of the fuel bar
scoreboard players set #rida.FUEL_BAR_SCALE rida.var 180
# Number of fire charges needed to completely refuel an airbike
scoreboard players set #rida.FUEL_RECHARGES rida.var 3

# Health (in half-hearts) an iron ingot heals an airbike
scoreboard players set #rida.INGOT_HEALS rida.var 4

# Thrust applied in a single tick when going through a boost ring (ignores rida.stat.thrust)
scoreboard players set #rida.BOOST_RING_THRUST rida.var 15000

# Maximum & minimum angle the airbike can tilt when turning (scaled by 1000)
scoreboard players set #rida.MAX_TILT_ANGLE rida.var 60000
scoreboard players set #rida.MIN_TILT_ANGLE rida.var -60000

# Maximum amount of players that can ride an airbike at a time
scoreboard players set #rida.MAX_RIDERS rida.var 50

# Maximum amount of recording steps (1 step = 1 second)
scoreboard players set #rida.MAX_RECORDING_STEPS rida.var 600

# LOAD-BEARING ITEM DISPLAY
# Used to do motion calculations and item manipulation
# UUID: 1af80582-f0f6-4ddd-b1c0-ccaf8beee947
summon item_display 0.0 0.0 0.0 {UUID:[I;452461954,-252293667,-1312764753,-1947276985],Tags:[smithed.ignore],view_range:0.0}

forceload add 0 0 0 0