tag @s add rida.block
$tag @s add rida.block.$(id)

data modify entity @s item set from storage rida:temp block.data
data modify entity @s data.id set from storage rida:temp block.id
$function rida:block/$(id)/place