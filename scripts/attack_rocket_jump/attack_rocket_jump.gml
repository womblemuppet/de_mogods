if !place_meeting(x,y-1,block)
	y-=1
           
sprite_index=sprites[28]
if super_mode
	sprite_index=sprites[29]
image_index=0
image_speed=FRAME_SPEED_NORMAL
dash_rocket_top_collision_safety_on=true

if dash_rocket_jump_charge==0
	show_error("dashrjmp 0 charge issue",true)

vspd=-DASH_ROCKET_JUMP_AMOUNT_LEVELS[dash_rocket_jump_charge]



dash_rocket_jump=2

uniques_parachute=0 ///allow parachute  after rocket jump
doublejump=2

var a;
a=attack_create_dash_hitbox(true,DASH_ROCKET_JUMP_STUN_DURATION_LEVELS[dash_rocket_jump_charge],3,9,"rocket jump",rjump_hitbox1,FRAME_SPEED_NORMAL,false)
var b;
b=instance_create(a.x,a.y,ef_follower)
b.targ=a
b.image_speed=0.2
b.sprite_index=sprites[33]
b.offsetx=0
b.offsety=0

dash_rocket_jump_charge=0