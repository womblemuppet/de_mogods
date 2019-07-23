alarm[0]=4   //fadeaway (nondamaging) frames, also smoke timer
image_xscale=2
image_yscale=2
image_speed=0.2  ///0.45 LOOKS GOOD
hit=false
if instance_exists(wave)
{
	if y>wave.y-20
		image_blend=c_dkgray //[finaledit]
}

