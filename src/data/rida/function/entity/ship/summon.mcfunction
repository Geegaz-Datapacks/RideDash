# TODO: generate stats based on parts
data modify storage rida:temp ship set value {stats:{speed:10,health:5,fuel:4}}

summon cat ^ ^ ^ {Tags:["rida.ship","rida.ship.root"],Silent:1b,PersistenceRequired:1b,Owner:[I;-1641945836,-390053168,-1650667973,-956572698],DeathLootTable:"",drop_chances:{head:2f},\
  attributes:[{id:"max_health",base:20},{id:"armor",base:15},{id:"movement_speed",base:0},{id:"flying_speed",base:0},{id:"minecraft:scale",base:1.8},{id:"step_height",base:1.2},{id:"gravity",base:0.01}],\
  active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b}],\
  data:{rida:{dye:{color:"red"}}},Passengers:[\
  {id:"minecraft:item_display",Tags:["rida.ship","rida.ship.display","rida.display.model"],shadow_radius:1.5,item_display:"head",teleport_duration:3,interpolation_duration:5,item:{id:"minecraft:barrier",count:1,components:{"minecraft:item_model":"rida:ship",custom_model_data:{strings:["racer","racer","racer","red","_"]}}}},\
  {id:"minecraft:interaction",Tags:["rida.ship","rida.ship.interaction"],Invulnerable:1b,width:1f,height:1.5f,response:1b}]}

execute as @n[type=cat,tag=rida.ship.root] rotated ~90 0 run function rida:entity/ship/rotate
execute as @n[type=cat,tag=rida.ship.root] run function rida:entity/ship/apply_stats

kill @s[tag=rida.summon]