/***************************************************
  find_lowest_diggable_middle_block()
  populates temp_volc_spawn_possibles_list , then returns a random block from that list
****************************************************/
var middle_x_val,yy,b;


if argument0==-1
	middle_x_val=round(kouchou.room_x_halfway/20)*20
else
	middle_x_val=round(argument0/20)*20

yy=0
for (var i = 0; i < kouchou.rh; i++)
{
	b=instance_position(middle_x_val,yy,block)
	if b!=noone
		break;
	yy+=40
}

return b
