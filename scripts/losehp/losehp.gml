/***************************************************
  losehp(gets around coconuke invuln,lastdamagetype)
 ***************************************************/
var me,safe;
me=self.id
safe=false

TESTING_PLACEHOLDER=argument0
lastdamagetype=argument1

if iframes>0
	safe=true

if immune==false && safe==false
{                                                                              //////////////take damage ///////////////////////////////////////////////////////////
	alarm[4]=80    ///flashing time
	immune=true
	hothands=0
	H-=1
	player_flinch()
	player_update_health_hud()
	if H<1
	{
		playerdie()
	}
    
}
