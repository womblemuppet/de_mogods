if hspd>0
{
	for (var i=0; i<hspd; i+=1)
	{
		if x<kouchou.room_right_border_x-HORIZONTAL_BOUNDARY_WIDTH && (chained_debuff_counter<1 || (x-chained_debuff_x_pos<BAITCHAIN_CHAIN_RANGE)) && !place_meeting(x+1,y,block) && (playerintersectioncheck!=noone || !place_meeting(x+1,y,player))
			x+=1
		else
		{
			if x<kouchou.room_right_border_x-HORIZONTAL_BOUNDARY_WIDTH+2
				edgeofroomcheck=true
			break;
		}
	};
}
else if hspd<0
{
	for (var i=0; i<-hspd; i+=1)
	{
		if x>kouchou.room_left_border_x+HORIZONTAL_BOUNDARY_WIDTH && (chained_debuff_counter<1 || (chained_debuff_x_pos-x<BAITCHAIN_CHAIN_RANGE)) && !place_meeting(x-1,y,block) && (playerintersectioncheck!=noone || !place_meeting(x-1,y,player))
			x-=1
		else
		{
			if x>kouchou.room_left_border_x+HORIZONTAL_BOUNDARY_WIDTH-2
				edgeofroomcheck=true
			break;
		}
	};
}