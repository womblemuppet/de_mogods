if instance_exists(targ)
{
	x=targ.x
	y=targ.y
}
if triggered
{
	delaycounter-=1
	if delaycounter<1
	{
		var a;
		a=instance_create_depth(x,y,-1,mine)
		a.player_who_placed_mine=creator
		a.creator=a.id
		a.right=right
		a.scale=1
		instance_destroy()
	}
}