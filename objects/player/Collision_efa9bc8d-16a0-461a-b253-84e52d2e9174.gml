if other.creator!=self.id && stunned_groundpound<1 && other.image_index<3 && other.hit[P]==false
{
	other.hit[P]=true
	player_get_gp_stunned(GROUND_POUND_STUN_AMOUNT*2)
	sprite_index=sprites[14]
	vspd=-1
}

