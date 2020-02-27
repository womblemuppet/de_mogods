/***************************************************
  prop_create(x,y,sprite,death sprite,name,cutTerrain,NOconnectors)
****************************************************/


var a;
a=instance_create_depth(argument0,argument1,-1,prop)
a.sprite_index=argument2
a.death_sprite=argument3
a.name=argument4

var cutTerrain;
cutTerrain=argument5

a.NOconnectors=argument6

with a
{
	connectors[0]=noone
	x+=10+irandom(aizen.bw-10)
	
	switch NOconnectors
	{
		case 0:
		show_debug_message("0 connector prop created")
		break;
		
		case 1:
			connectors[0]=instance_position(x,y+5,block)
			if connectors[0]==noone
				show_debug_message("no connector for prop "+name)		
		break;
		case 2:
			var xoffset;
			xoffset=(floor(sprite_width/aizen.bw)*aizen.bw)/2
			connectors[0]=instance_position(x-xoffset,y+5,block)
			if connectors[0]==noone
				show_debug_message("no connector 0 for prop "+name)	

			connectors[1]=instance_position(x+xoffset.bw,y+5,block)
			if connectors[1]==noone
				show_debug_message("no connector 1 for prop "+name)	
		break;
		case 3:
			connectors[0]=instance_position(x,y+5,block)
			if connectors[0]==noone
				show_debug_message("no connector 0 for prop "+name)	
				
			var xoffset;
			xoffset=(floor(sprite_width/aizen.bw)*aizen.bw)/2
			connectors[1]=instance_position(x-xoffset,y+5,block)
			if connectors[1]==noone
				show_debug_message("no connector 1 for prop "+name)	
				
			connectors[2]=instance_position(x+xoffset,y+5,block)
			if connectors[2]==noone
				show_debug_message("no connector 2 for prop "+name)		
		break;
		default:
		show_error("unhandled NOconnectors pcreate",true)
	}

	if cutTerrain  //[finaledit] rewrite without while loop?
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

return a