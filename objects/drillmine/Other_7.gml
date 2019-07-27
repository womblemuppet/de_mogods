if dying
{
	var a;
	a=instance_create_depth(x,y-20,-1,mine)
	a.player_who_placed_mine=creator
	a.creator=a.id
	
	instance_destroy()	
}