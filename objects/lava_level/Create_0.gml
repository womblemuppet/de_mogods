image_speed=0.15
image_alpha=0.75

UP_TIME=60   ///wave moves up for this amount at start


damaging=false
damaging_timer=50

LAVA_SPAWNING_SPRITE_WIDTH=64

for (var i = 0; i < room_width/LAVA_SPAWNING_SPRITE_WIDTH;i++)
{
	effect_aniend(spr_lava_spawning,0.2,-4)
}