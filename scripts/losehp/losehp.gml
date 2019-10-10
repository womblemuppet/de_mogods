/***************************************************
  losehp(gets around coconuke invuln,lastdamagetype)
  returns "died" "damage_taken" or "safe"
 ***************************************************/
var me,safe;
me=self.id
safe=false

TESTING_PLACEHOLDER=argument0   ///[finaledit] to be deleted
lastdamagetype=argument1
                                                    //////////////take damage ///////////////////////////////////////////////////////////
hothands=0
H-=1
player_make_immune(20)
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
last_hit_knocked_down=true   ///for use in player_whacked resetting prone
	
player_update_pocket_hud()
//player_flinch()
player_update_health_hud()
cc_reset_clean()
player_set_before_prone_falling_lockdown_state()

return "damage_taken"
