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
	if H==3
		aizen.playerhpglow[P]=hud_floatingoogamask_glow
	else if H==2
		aizen.playerhpglow[P]=hud_floatingoogamask_glowy
	else if H==1
		aizen.playerhpglow[P]=hud_floatingoogamask_glowr
	else if H<1
	{
		playerdie()
	}
    
}
