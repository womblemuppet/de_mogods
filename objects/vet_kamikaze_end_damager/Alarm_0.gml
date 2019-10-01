if number_of_mines==0
	instance_destroy()
else
{	
	alarm[0]=INTERVAL

	if instance_exists(creator)
	{
		with creator
		{
			hothands+=1                         //// ONE HH DAMAGE
			player_has_taken_hh_damage()
			effect_aniend(vet_3h_kamikaze_mine_explosion,0.2,-2)
		}
	}

	if victim!=noone && instance_exists(victim)
	{
		with victim
		{
			hothands+=1                         //// ONE HH DAMAGE
			player_has_taken_hh_damage()
			effect_aniend(vet_3h_kamikaze_mine_explosion,0.2,-2)
		}
	}
}

number_of_mines-=1
