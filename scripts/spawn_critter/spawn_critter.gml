var critter_type,critter_species;
critter_type=choose("ground")//,"flying"
if critter_type=="ground"
	critter_species=choose("worm")//,snake etc)
var a;
a=instance_create(kouchou.room_left_border_x+i*aizen.bw,5+argument0,critter)
with a
	critter_setup("worm")