if y>ystart+2
	gravity_direction=90
else if y<ystart-2
	gravity_direction=270

vspeed=clamp(vspeed,-1,1)