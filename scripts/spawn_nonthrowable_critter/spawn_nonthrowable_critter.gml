var critter_type,critter_species;
critter_type=choose("ground")//,"flying"

var y_position;
y_position=argument0

var possibles;
possibles=argument1

var critter_spawn_x;
critter_spawn_x=possibles[| 0].x

if critter_type=="ground"
	critter_species=choose("worm")//,snake etc)
	
var a;
a=instance_create(critter_spawn_x,y_position+5,critter)
with a
	critter_nonthrowable_setup("worm")