for (var i = 0; i < kouchou.MAX_PLAYER_COUNT; i++)
{
	if player_ult_time_remaining[i]>0
		player_ult_time_remaining[i]-=1
}


floating_masks_subimage+=0.2
if floating_masks_subimage>FLOATINGMASKS_IMAGE_NUMBER
	floating_masks_subimage=0
	
for (var i = 0; i < kouchou.MAX_PLAYER_COUNT; i++)
{
	pocket_circle_subimage[i]+=0.2
	
	if pocket_circle_subimage[i]>pocket_circle_image_number[i]
	{
		pocket_circle_subimage[i]=0
	
		if pocket_circle_sprite[i]==hud_pocket_circle_area_orb_lost
		{
			pocket_circle_sprite[i]=hud_pocket_circle_area
			pocket_circle_image_number[i]=POCKET_CIRCLE_AREA_IMAGE_NUMBER
		}
	}
}

