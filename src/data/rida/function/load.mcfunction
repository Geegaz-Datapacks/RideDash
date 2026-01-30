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

scoreboard players set #rida.FORWARD_THRUST rida.var 4
scoreboard players set #rida.BACKWARD_THRUST rida.var -2
scoreboard players set #rida.BOOST_THRUST rida.var 8
scoreboard players set #rida.BOOST_DURATION rida.var 20
scoreboard players set #rida.DASH_THRUST rida.var 1500
scoreboard players set #rida.DASH_COOLDOWN rida.var 20

scoreboard players set #rida.PRECISION_SCALE rida.var 1000

scoreboard players set #rida.MAX_TILT_ANGLE rida.var 60000
scoreboard players set #rida.MIN_TILT_ANGLE rida.var -60000

forceload add 0 0 0 0
# UUID: 9e21e514-e8c0-42d0-9d9c-ce3bc6fbdbe6
summon marker 0.0 0.0 0.0 {UUID:[I;-1641945836,-390053168,-1650667973,-956572698],Tags:["smithed.ignore"]}

function rida:second