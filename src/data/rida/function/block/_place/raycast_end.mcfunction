data modify storage rida:temp block.id set from block ~ ~ ~ components."minecraft:custom_data".rida.id
data modify storage rida:temp block.data set from block ~ ~ ~

execute align xyz positioned ~0.5 ~0.5 ~0.5 summon item_display run function rida:block/_place/finish with storage rida:temp block