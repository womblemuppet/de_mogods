/***************************************************
    player_hothands_check
            must be called by player
****************************************************/

if hothands>3                        //////////// hothands proc on 4
{
	losehp(false,"small attack")   
	hothands=0
	var a;
	a=instance_create(x,y,ef_follower)
	a.offsetx=0
	a.offsety=0
	a.image_speed=0.2
	a.image_xscale=2
	a.image_yscale=2
	a.sprite_index=hothand_boom
	a.targ=self.id
}
