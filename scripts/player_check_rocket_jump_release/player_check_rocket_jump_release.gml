if dash_rocket_jump==1
{ 
	if !button_scrape[? upbutton]
	{ ////early release of rocket jump
		if dash_rocket_jump==1 && (sprite_index=sprites[? "rocketjump_charge"] || sprite_index==sprites[? "rocketjump_charge_u"])
		{
			if image_index>DASH_ROCKET_JUMP_CHARGE_LEVEL_1_THRESHOLD
				dash_rocket_jump_charge=1
			if image_index>DASH_ROCKET_JUMP_CHARGE_LEVEL_2_THRESHOLD
				dash_rocket_jump_charge=2
			if dash_rocket_jump_charge!=0
				attack_rocket_jump()
		}
	}
}