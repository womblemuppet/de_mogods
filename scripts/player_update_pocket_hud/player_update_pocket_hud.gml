top_HUD.pocket_has_super_mode[P]=pocket_super_mode_stored


for (var i = 0; i < NUMBER_OF_POCKET_SPACES;i++)
{
	if pocket_orb[i]!=-1
		top_HUD.player_pocket_orb_sprite[P,i]=aizen.STACK_ORB_SPRITES[| pocket_orb[i] ]
	else
		top_HUD.player_pocket_orb_sprite[P,i]=-1
}
	

