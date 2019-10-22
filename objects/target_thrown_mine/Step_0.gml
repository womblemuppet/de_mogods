timer-=1

if timer==0
{
	if instance_exists(creator)
	{
		var xx,yy;
		xx=target_x
		yy=target_y
		
		with creator
		{
			var a;
			a=attack_vet_create_mine()
			a.x=xx
			a.y=yy
		}
	}
	instance_destroy()
}