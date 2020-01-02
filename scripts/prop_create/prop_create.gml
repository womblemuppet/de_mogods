/***************************************************
  prop_create(x,y,sprite,death sprite,name,isFlag,cutTerrain)
****************************************************/


var a;
a=instance_create_depth(argument0,argument1,0,prop)
a.sprite_index=argument2
a.death_sprite=argument3
a.name=argument4
a.isFlag=argument5

var cutTerrain;
cutTerrain=argument6

a.NOconnectors=argument7

with a
{
	connectors[0]=noone
	x+=irandom(aizen.bw)
	
	for (var i = 0; i < NOconnectors; i++) 
	{
		connectors[i]=instance_position(x,y+5,block)
		if connectors[i]==noone
			show_debug_message("no connector "+string(i)+" prop "+name)
	}


	if cutTerrain
	{
		var fuse;
		fuse=0
		while (    fuse<500 && collision_rectangle(x,y,x+sprite_width,y+sprite_height,block,false,true)!=noone     )
		{
		     fuse+=1
		     with collision_rectangle(x,y,x+sprite_width,y+sprite_height,block,false,true)
		          instance_destroy()
		}
	}
}
