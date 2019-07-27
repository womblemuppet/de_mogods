if hspd>0
{
	for (var i=0; i<hspd; i+=1)
	{
		if !place_meeting(x+1,y,block) && x<kouchou.room_right_border_x-20 && (chained_debuff_counter<1 || (x-chained_debuff_x_pos<BAITCHAIN_CHAIN_RANGE))
			x+=1
		else
			break;
	};
}
else if hspd<0
{
	for (var i=0; i<-hspd; i+=1)
	{
		if !place_meeting(x-1,y,block) && x>kouchou.room_left_border_x+20 && (chained_debuff_counter<1 || (chained_debuff_x_pos-x<BAITCHAIN_CHAIN_RANGE))
			x-=1
		else
			break;
	};
}