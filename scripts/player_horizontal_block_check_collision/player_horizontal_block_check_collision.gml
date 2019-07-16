var sgn;
sgn=1
if argument0=="left"
	sgn=-1


if place_meeting(x+sgn*hspd,y,block)
{
	player_horizontal_block_set_hspd_and_bounce("left")  //[finaledit] call both in both collisions really necessary?
	player_horizontal_block_set_hspd_and_bounce("right")

	if impact_debuff_counter>0
	{
		impact_debuff_counter=0
		create_terrain_cutter(eightysqcircle,"hit",-2,7)     ///if changing this also change for rightward direction
	}
	if uniques_whirlwind_active==true
	{
		uniques_whirlwind_active=false
		player_get_gp_stunned(UNIQUES_WHIRLWIND_SELFSTUN_AMOUNT)
	}
}
else return false