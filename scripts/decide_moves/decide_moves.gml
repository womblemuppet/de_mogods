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
    
	ds_map_add(attacks, "light attack", "uga_uppercut");
	ds_map_add(attacks, "heavy attack", "uga_falconpunch");
	ds_map_add(attacks, "dash", "bunt_dash");
	ds_map_add(attacks, "airdash", 0);
	ds_map_add(attacks, "gp", "ground pound");
	ds_map_add(attacks, "gp_hit_ground_effect", "no_effect");
	//no gp effect (uga super mode gp doesn't use this system for some reason)
	ds_map_add(attacks, "air light attack", "standard_airgrab");
	ds_map_add(attacks, "air heavy attack", "no_effect");
	ds_map_add(attacks, "ult get trigger", "uga_get_ult");
	ds_map_add(attacks, "super attack", "uga super attack")
	ds_map_add(attacks, "special hold down", "no_effect");
	ds_map_add(attacks, "special2", -1);
	//not set
	ds_map_add(attacks, "special3", -1);
	//not set
	ds_map_add(attacks, "air grab effect", "standard_airgrab_effect");

	running_startup_frames=1  ///[finaledit] add to every character
	uniques_super_ooga_gp_enabled=true
	ground_pound_freeze_time-=4
	uniques_uga_delayable_gp_enabled=true
	uniques_gpcombo_cripples_enabled=true
	super_mode_duration=1000

	break;
    
	case "veteran":
    
	ds_map_add(attacks, "light attack", "vet_uppercut");
	ds_map_add(attacks, "heavy attack", "vet_armspin");
	ds_map_add(attacks, "dash", "bunt_dash");
	ds_map_add(attacks, "airdash", 0);
	ds_map_add(attacks, "gp", "ground pound");
	ds_map_add(attacks, "gp_hit_ground_effect", "no_effect");
	ds_map_add(attacks, "air light attack", "standard_airgrab");
	ds_map_add(attacks, "air heavy attack", "veteran_mine_throw");  
	ds_map_add(attacks, "ult get trigger", "vet_get_ult");
	ds_map_add(attacks, "super attack", "vet_kamikaze")
	ds_map_add(attacks, "special hold down","vet_place_mine");
	ds_map_add(attacks, "special2", -1);
	//not set
	ds_map_add(attacks, "special3", -1);
	//not set
	ds_map_add(attacks, "air grab effect", "standard_airgrab_effect");
    
	uniques_parachute_enabled=true
	uniques_mines_enabled=true
	uniques_sticky_mine_enabled=true
	uniques_uga_delayable_gp_enabled=true
	mines_ammo=3   ///starting mines
	uniques_vet_dig_enabled=true
	super_mode_duration=1000
    
	break;
    
	case "slinger":
    
	ds_map_add(attacks, "light attack", "slinger_uppercut");
	ds_map_add(attacks, "heavy attack", "slinger_sunblast");
	ds_map_add(attacks, "dash","bunt_dash");
	ds_map_add(attacks, "airdash", 0);
	ds_map_add(attacks, "gp", "ground pound with phase");
	ds_map_add(attacks, "gp_hit_ground_effect", "no_effect");
	ds_map_add(attacks, "air light attack", "standard_airgrab");
	ds_map_add(attacks, "air heavy attack", "slinger_air_sunbolt");
	ds_map_add(attacks, "ult get trigger", "slinger_get_ult");
	ds_map_add(attacks, "super attack", "slinger_superblast")
	ds_map_add(attacks, "special hold down", "no_effect");
	ds_map_add(attacks, "special2", -1);
	//not set
	ds_map_add(attacks, "special3", -1);
	//not set
	ds_map_add(attacks, "air grab effect", "standard_airgrab_effect");
	
     uniques_phase_enabled=true
	uniques_uga_delayable_gp_enabled=true
	super_mode_duration=1000
	break;

	case "bait":
    
    
	ds_map_add(attacks, "light attack", "bait_chaining_uppercut");
	ds_map_add(attacks, "heavy attack", "bait_haymaker");
	ds_map_add(attacks, "dash", "bunt_dash");
	ds_map_add(attacks, "airdash", 0);
	ds_map_add(attacks, "gp", "ground pound");
	ds_map_add(attacks, "gp_hit_ground_effect","bait_whirlwind");
	ds_map_add(attacks, "air light attack", "standard_airgrab");
	ds_map_add(attacks, "air heavy attack", "no_effect");
	ds_map_add(attacks, "ult get trigger","bait_get_ult");
	ds_map_add(attacks, "super attack", "bait super attack")
	ds_map_add(attacks, "special hold down", "bait_teleport");
	ds_map_add(attacks, "special2", -1);
	//not set
	ds_map_add(attacks, "special3", -1);
	//not set
	ds_map_add(attacks, "air grab effect", "standard_airgrab_effect");
    
	//running_startup_frames=1  ///[finaledit] add to every character
	uniques_super_ooga_gp_enabled=true
	uniques_gpcombo_cripples_enabled=true
	uniques_uga_delayable_gp_enabled=true
	uniques_teleport_enabled=true
	uniques_teleport=0
	super_mode_duration=1000
	uniques_dashgpblinkattack_enabled=true
	uniques_honeybadger_enabled=true
	
	break;
    
	default:
	show_error("who dis",true) 

}

