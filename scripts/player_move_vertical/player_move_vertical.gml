//VERTICAL MOVEMENT
if vspd>0
{
	for (var i=0; i<vspd; i+=1)
	{
		if !place_meeting(x,y+1,block) && (chained_debuff_counter<1 || (y-chained_debuff_y_pos<BAITCHAIN_CHAIN_RANGE)) ///don't replace this with groundcheck you dumbo
			y+=1
		else
			break;
	};
}
else if vspd<0
{
	if (dash_rocket_top_collision_safety_on==true && y<DASH_ROCKET_TOP_COLLISION_MAXY)
	{
		vspd=0
	}
    
	for (var i=0; i<-vspd; i+=1)
	{
		if !place_meeting(x,y-1,block) && (chained_debuff_counter<1 || (chained_debuff_y_pos-y<BAITCHAIN_CHAIN_RANGE))
			 y-=1
		else
			break;
	};
}