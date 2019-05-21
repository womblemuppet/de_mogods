/***************************************************
  losehp(gets around coconuke invuln,lastdamagetype)
 ***************************************************/
var me,safe;
me=self.id
safe=false

cars2=argument0
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
	if H==2
		aizen.playerhpglow[P]=hud_floatingoogamask_glowy
	if H==1
		aizen.playerhpglow[P]=hud_floatingoogamask_glowr


	if H<1
	{
		playerdie()
	}
    
}
