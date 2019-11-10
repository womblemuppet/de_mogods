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
	player_die()
	return "died"
}
	


last_hit_knocked_down=true   ///for use in player_whacked resetting prone

player_update_health_hud()
player_set_before_prone_falling_lockdown_state()

return "damage_taken"
