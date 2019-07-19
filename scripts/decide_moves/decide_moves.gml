/***************************************************
                attacks (ds_map)

light attack
heavy attack
dash
airdash
gp
gp effect
air light attack
air heavy attack
ult get trigger
special hold down (placeable)
special1
special2
special3
air throw effect

****************************************************/
switch (character)
{
	case "ooga":
    
	ds_map_add(attacks, "light attack", 0);
	//ooga standard uppercut
	ds_map_add(attacks, "heavy attack", 0);
	//ooga windup punch
	ds_map_add(attacks, "dash", 0);
	//standard bunt dash
	ds_map_add(attacks, "airdash", 0);
	//ooga standard airdash
	ds_map_add(attacks, "gp", 0);
	//standard gp (uga's delayable gp effect and super mode gp effect enabled below)
	ds_map_add(attacks, "gpeffect", 0);
	//no gp effect
	ds_map_add(attacks, "air light attack", 0);
	//ooga airgrab
	ds_map_add(attacks, "air heavy attack", -1);
	//no attack set
	ds_map_add(attacks, "ult get trigger", 0);
	//ooga ult
	ds_map_add(attacks, "special hold down", -1);
	//nothing
	ds_map_add(attacks, "special2", -1);
	//not set
	ds_map_add(attacks, "special3", -1);
	//not set
	ds_map_add(attacks, "air grab effect", 0);
	//ooga standard grab effect
    
	running_startup_frames=1  ///[finaledit] add to every character
	uniques_super_ooga_gp_enabled=true
	ground_pound_freeze_time-=3
	uniques_uga_delayable_gp_enabled=true
	uniques_gpcombo_cripples_enabled=true
	super_mode_duration=1000

	break;
    
	case "veteran":
    
	ds_map_add(attacks, "light attack", 1);
	//veteran uppercut (standard but chains to veteran specials)
	ds_map_add(attacks, "heavy attack", 1);
	//veteran anti air punch
	ds_map_add(attacks, "dash", 0);
	//standard bunt dash
	ds_map_add(attacks, "airdash", 0);
	//ooga standard airdash
	ds_map_add(attacks, "gp", 0);
	//standard gp
	ds_map_add(attacks, "gpeffect", 0);
	//no gp effect
	ds_map_add(attacks, "air light attack", 0);
	//ooga airgrab
	ds_map_add(attacks, "air heavy attack", 0);  
	//veteran mine throw
	ds_map_add(attacks, "ult get trigger", 1);
	//veteran ult setup
	ds_map_add(attacks, "special hold down", 0);
	//veteran place mine
	ds_map_add(attacks, "special2", -1);
	//not set
	ds_map_add(attacks, "special3", -1);
	//not set
	ds_map_add(attacks, "air grab effect", 0);
	//ooga standard grab effect
    
	uniques_parachute_enabled=true
	uniques_mines_enabled=true
	mines_ammo=2   ///starting mines
	uniques_vet_dig_enabled=true
	super_mode_duration=1000
    
	break;
    
	case "slinger":
    
	ds_map_add(attacks, "light attack", 2);
	//slinger u/c attack
	ds_map_add(attacks, "heavy attack", 2);
	//sunblast/bolt/whatever
	ds_map_add(attacks, "dash",0);
	//normal dash (SLINGER NOBUNT DASH DISABLED)
	ds_map_add(attacks, "airdash", 0);
	//ooga standard airdash
	ds_map_add(attacks, "gp", 0);
	//standard gp
	ds_map_add(attacks, "gpeffect", 0);
	//no gp effect
	ds_map_add(attacks, "air light attack", -1);
	//no airgrab
	ds_map_add(attacks, "air heavy attack", 1);
	//airbolt
	ds_map_add(attacks, "ult get trigger", 0);
	//ooga ki blast (probably gonna change)
	ds_map_add(attacks, "special hold down", -1);
	//not set
	ds_map_add(attacks, "special2", -1);
	//not set
	ds_map_add(attacks, "special3", -1);
	//not set
	ds_map_add(attacks, "air grab effect", 0);
	//ooga standard grab effect   
    
	uniques_airdash_resets_jump=true
	super_mode_duration=1000
	break;

	case "bait":
    
    
	ds_map_add(attacks, "light attack", 3);
	//bait chain uppercut
	ds_map_add(attacks, "heavy attack", 3);
	//bait sharkattack heavy attack
	ds_map_add(attacks, "dash", 0);
	//standard bunt dash
	ds_map_add(attacks, "airdash", 0);
	//ooga standard airdash
	ds_map_add(attacks, "gp", 0);
	//standard gp
	ds_map_add(attacks, "gpeffect", 1);
	//bait whirlwind
	ds_map_add(attacks, "air light attack", 0);
	//ooga airgrab
	ds_map_add(attacks, "air heavy attack", -1);
	//no attack set
	ds_map_add(attacks, "ult get trigger", 0);
	//ooga ult
	ds_map_add(attacks, "special hold down", 1);
	//bait place teleport
	ds_map_add(attacks, "special2", -1);
	//not set
	ds_map_add(attacks, "special3", -1);
	//not set
	ds_map_add(attacks, "air grab effect", 0);
	//ooga standard grab effect
    
	//running_startup_frames=1  ///[finaledit] add to every character
	uniques_super_ooga_gp_enabled=true
	uniques_gpcombo_cripples_enabled=true
	uniques_teleport_enabled=true
	uniques_teleport=0
	super_mode_duration=1000
	
	break;
    
	default:
	show_error("who dis",true) 

}

