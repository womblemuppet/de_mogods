if !place_meeting(x,y+1,block)
{
	vspd+=0.5   ///gravity
}
if place_meeting(x,y-1,block)
{
	vspd=1
}
if place_meeting(x,y+1,block)
{
	if vspd<-5
		vspd=-6
	else
		vspd=0
    
	////////horizontal friction if touching ground
	var horfriction;
	horfriction=0.5
	if hspd>horfriction
		hspd-=horfriction
	else if hspd>0
		hspd=0
	if hspd<-horfriction
		hspd+=horfriction
	else if hspd<0
		hspd=0
}

if vspd>7
	vspd=7
if vspd<-18
	vspd=-18
    
if vspd>0
{
	repeat(vspd)
	{
		if !place_meeting(x,y+1,block)
		{
			y+=1
		}
	}
}
else if vspd<0
{
	repeat(-vspd)
	{
		if !place_meeting(x,y-1,block)
		{
			y-=1
		}
	}
}

if hspd>0
{
	repeat(hspd)
	{
	if !place_meeting(x+1,y,block) && x<kouchou.room_right_border_x
		x+=1
	}
}
else if hspd<0
{
	repeat(abs(hspd))
	{
		if !place_meeting(x-1,y,block) && x>kouchou.room_left_border_x
			x-=1
	}
}

if triggered   /// >:O
{
	life-=1
	if life<1
	{
		var b,hitboxspr;
		hitboxspr=mine_sprite_explosion
		if !bigexplosion
			effect_aniend(mine_sprite_explosion,0.2,-1)
		else
		{
			var b;
			b=effect_aniend(mine_groundpunch_combo_shockwave,0.2,-1)
			b.image_xscale=bigexplosion_xscale
			hitboxspr=mine_groundpunch_combo_shockwave_hitbox
		}
		
		b=attack_create_hitbox(60,1,false,true,true,"mineexplosion",hitboxspr,0.2,99,0,2)
		b.creator=noone
		b.image_xscale=bigexplosion_xscale

		instance_destroy()
	}
}

//////     set sprite   /////
if vspd<0
	sprite_index=mine_spinning_sprite
else if vspd>0
	sprite_index=mine_falling_sprite
else if !ready
	sprite_index=mine_sprite_priming
else
	sprite_index=mine_sprite

