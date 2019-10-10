alarm[0]=4   //fadeaway (nondamaging) frames, also smoke timer
image_xscale=2
image_yscale=2
image_speed=0.2  ///0.45 LOOKS GOOD

if instance_exists(freakyfishtime)
{
	if y>freakyfishtime.y-20
		image_blend=c_dkgray //[finaledit]
}

hit[kouchou.MAX_PLAYER_COUNT]=false
for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
{
	hit[i]=false
};