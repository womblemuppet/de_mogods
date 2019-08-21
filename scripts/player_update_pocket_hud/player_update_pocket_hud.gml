left_HUD.hud_pocket_has_super_mode[P]=pocket_super_mode_stored

if pocket_orb!=-1
	left_HUD.player_pocket_orb_sprite[P]=aizen.STACK_ORB_SPRITES [| pocket_orb]
else
	left_HUD.player_pocket_orb_sprite[P]=-1