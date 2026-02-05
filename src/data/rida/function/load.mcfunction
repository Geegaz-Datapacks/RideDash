scoreboard objectives add rida.var dummy
scoreboard objectives add rida.hurt dummy

scoreboard objectives add rida.dx dummy
scoreboard objectives add rida.dy dummy
scoreboard objectives add rida.dz dummy

scoreboard objectives add rida.tilt dummy
scoreboard objectives add rida.dash dummy
scoreboard objectives add rida.boost dummy
scoreboard objectives add rida.fuel dummy

scoreboard objectives add rida.stat.speed dummy
scoreboard objectives add rida.stat.fuel dummy

scoreboard players set #rida.THRUST_SCALE rida.var 10000
scoreboard players set #rida.FORWARD_THRUST rida.var 80
scoreboard players set #rida.BACKWARD_THRUST rida.var -40
scoreboard players set #rida.BOOST_THRUST rida.var 160
scoreboard players set #rida.BOOST_DURATION rida.var 20
scoreboard players set #rida.BOOST_FUEL_USE rida.var 2
scoreboard players set #rida.DASH_THRUST rida.var 15000
scoreboard players set #rida.DASH_COOLDOWN rida.var 20
scoreboard players set #rida.DASH_FUEL_USE rida.var 100

scoreboard players set #rida.FUEL_SCALE rida.var 1200
scoreboard players set #rida.FUEL_BAR_SCALE rida.var 180
scoreboard players set #rida.FUEL_RECHARGES rida.var 3

scoreboard players set #rida.BOOST_RING_THRUST rida.var 15000

scoreboard players set #rida.MAX_TILT_ANGLE rida.var 60000
scoreboard players set #rida.MIN_TILT_ANGLE rida.var -60000

scoreboard players set #rida.MAX_RIDERS rida.var 50

forceload add 0 0 0 0
# UUID: 9e21e514-e8c0-42d0-9d9c-ce3bc6fbdbe6
summon marker 0.0 0.0 0.0 {UUID:[I;-1641945836,-390053168,-1650667973,-956572698],Tags:["smithed.ignore"]}
# UUID: 1af80582-f0f6-4ddd-b1c0-ccaf8beee947
summon item_display 0.0 0.0 0.0 {UUID:[I;452461954,-252293667,-1312764753,-1947276985],Tags:["smithed.ignore"]}

function rida:second