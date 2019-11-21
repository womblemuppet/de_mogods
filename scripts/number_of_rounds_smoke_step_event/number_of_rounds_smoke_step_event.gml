y+=vspd
if y<(-sprite_height-20)
	instance_destroy()
	
if image_index>=image_number-1 && mode="dying"
	instance_destroy()