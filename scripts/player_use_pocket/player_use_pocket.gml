stack_add_orb(pocket_orb,true)
pocket_orb=-1 //continue
if pocket_super_mode_stored
{
	player_activate_super_mode()
	pocket_super_mode_stored=false
}
player_update_pocket_hud()