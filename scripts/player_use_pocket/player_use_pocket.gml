stack_add_orb(pocket_orb[0],true)

for (var i=0;i<NUMBER_OF_POCKET_SPACES-1;i++)
{
    pocket_orb[i]=pocket_orb[i+1]
}
pocket_orb[NUMBER_OF_POCKET_SPACES]=-1

if pocket_super_mode_stored
{
	player_activate_super_mode()
	pocket_super_mode_stored=false
}
player_update_pocket_hud()