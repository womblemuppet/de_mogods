if dying
{
	var a;
	a=instance_create_depth(x,y-aizen.bh/2,-1,mine)
	a.player_who_placed_mine=creator
	a.creator=a.id
	a.right=right
	a.scale=1
	
	instance_destroy()	
}