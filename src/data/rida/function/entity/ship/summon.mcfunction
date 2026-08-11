# TODO: generate stats based on parts
# TODO: apply rotation when summoned
summon cat ~ ~ ~ {Tags:[rida.ship,rida.ship.root,rida.new],variant:"rida:empty",Silent:1b,PersistenceRequired:1b,DeathLootTable:"",Sitting:1b,drop_chances:{head:2f},\
  attributes:[{id:"max_health",base:20},{id:"armor",base:20},{id:"movement_speed",base:0},{id:"scale",base:1.8},{id:"step_height",base:1.2},{id:"gravity",base:0.015},{id:"friction_modifier",base:0.0}],\
  data:{rida:{stats:{thrust:8,fuel:5,armor:6}}},\
  Passengers:[\
  {id:"minecraft:interaction",Tags:[rida.ship,rida.ship.interaction],width:1,height:1.5},\
  {id:"minecraft:item_display",Tags:[rida.ship,rida.ship.display],Rotation:[0f,0f],view_range:2.0,width:3,height:2,teleport_duration:3,interpolation_duration:5,item_display:"head",item:{id:"minecraft:poisonous_potato",components:{"minecraft:item_model":"rida:ship",\
    "minecraft:custom_model_data":{strings:["racer","racer","racer","minecraft:red_dye",""]}}},data:{rida:{dye:{id:"minecraft:red_dye"}}}}]}

execute as @e[type=cat,tag=rida.new,distance=..1] run function rida:entity/ship/setup
kill @s[tag=rida.summon]