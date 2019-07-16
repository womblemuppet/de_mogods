if other.ready==true && other.dying==false && !super_mode
{
	////////////////////////////////////////////////////////////////////////////////// ADD TO PLAYERS SUPERCOUNT
	orb_count_meter+=1
	aizen.playerorbcount[P]=orb_count_meter
	pocket_orb=other.type
	aizen.playerpocketorb[P]=other.sprite_index
	
	first_blood_allow_again()
	player_update_super_meter_hud()
	
	
	if orb_count_meter==4
	{
		spawn_pineapple()
	}
	if orb_count_meter==5
	{
		pocket_super_mode_stored=true
		//player_activate_super_mode()
		orb_count_meter=0
	}
	
	
	////////////////////////////////////////////////////////////////////////////////////////// KILL ORB
	with other
	{
		sprite_index=death_sprite
		dying=true
		image_index=0
		image_speed=death_speed
		trigger_first_blood=false
	}
    
    ///////////////////////////////////////////////////////////////////////////////////////// CREATE 'ABS-ORB' EFFECT
	var a;
	a=instance_create(x,y,ef_orbpickup)
	a.targ=self.id
	switch (other.type)
	{  //[finaledit] put in list
		case 0:    
			a.sprite_index=firestorm_absorb; break;
		case 1:    
			a.sprite_index=ice_absorb; break;        
		case 2:    
			a.sprite_index=lightning_absorb; break;
		case 3:   
			a.sprite_index=payday_absorb; break; 
		case 4:
			a.sprite_index=flood_absorb; break;
		case 5:
			a.sprite_index=tornado_absorb break;
		case 6:
			a.sprite_index=moonlight_absorb break;
		default: show_error("unhandled orb sparkles effect?!",true)
	}
     

}

