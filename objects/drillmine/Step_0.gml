if !dying
{
	y-=vspd
	
	if !place_meeting(x,y,block)
	{
		dying=true
		sprite_index=mine_drill_end_sprite
		image_index=0
	}
}