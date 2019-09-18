if uniques_vet_dig_enabled && uniques_vet_chain_counter>0 && checkkey(lightbutton) && uniques_vet_digging==0
{///start digging
	image_index=0
	image_speed=FRAME_SPEED_NORMAL
	uniques_vet_digging=1
	y+=aizen.bh
	sprite_index=sprites[? "uniques_dig_channel_u"]
	if super_mode
		sprite_index=sprites[? "uniques_dig_channel"]
}
	