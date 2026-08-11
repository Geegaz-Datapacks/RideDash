# Skip if the ship is already fully refueled
execute on vehicle if score @s rida.fuel >= @s rida.stat.fuel run return fail
execute on vehicle run function rida:entity/ship/refuel

playsound rida:entity.airbike.refuel neutral @a[distance=..20]
particle trial_spawner_detection ~ ~1 ~ 0.5 0.1 0.5 0 10
return 3