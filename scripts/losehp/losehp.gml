/***************************************************
  losehp(gets around coconuke invuln,lastdamagetype)
 ***************************************************/
var me,safe;
me=self.id
safe=false

TESTING_PLACEHOLDER=argument0   ///[finaledit] to be deleted
lastdamagetype=argument1

if iframes>0
	safe=true

if immune==false && safe==false
{                                                                 //////////////take damage ///////////////////////////////////////////////////////////
	player_make_immune(80)
	hothands=0
	H-=1
	if H<1
	{
		playerdie()
		return "died"
	}
	
	if !player_has_no_pockets()
		set_hud_pocket_circle_orb_lost_animation()
	else
	{
		if pocket_super_mode_stored
			set_hud_pocket_circle_orb_super_mode()
		else
			set_hud_pocket_circle_orb_normal()
	}
	
	player_empty_pockets()                               ///reset pocket orb
	pocket_super_mode_stored=false
	
	
	player_update_pocket_hud()
	//player_flinch()
	player_update_health_hud()
	cc_reset_clean()
	
	player_flush_lockdowns()
	player_set_idle()
	is_proned=true
	sprite_index=sprites[? "prone"]
	stunned_groundpound=20
    
}
