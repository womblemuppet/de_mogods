groundcheck=place_meeting(x,y+1,block)


//////     set sprite   ///// [finaledit] optimise...
if groundcheck==false
	sprite_index=mine_spinning_sprite
else
{
	if !ready
		sprite_index=mine_sprite_priming
	else
		sprite_index=mine_sprite
}



///gravity
if floatcounter>0
	floatcounter-=1
else if groundcheck==false
	vspd+=grav_amount
else
{
	vspd=0

	///horizontal friction if touching ground
	var horfriction;
	horfriction=1
	if hspd>horfriction
		hspd-=horfriction
	else if hspd>0
		hspd=0
	if hspd<-horfriction
		hspd+=horfriction
	else if hspd<0
		hspd=0
}

///check ceiling
if place_meeting(x,y-1,block)
	vspd=1

///limit vspd
if vspd>12
	vspd=12
else if vspd<-18
	vspd=-18

//vertical movement
if vspd>0
{
	repeat(vspd)
	{
		if !place_meeting(x,y+1,block)
			y+=1
		else
			break;
	}
}
else if vspd<0
{
	repeat(-vspd)
	{
		if !place_meeting(x,y-1,block)
			y-=1
		else
			break;
	}
}


///horizontal movement
if hspd>0
{
	repeat(hspd)
	{
		if !place_meeting(x+1,y,block) && x<kouchou.room_right_border_x
			x+=1
		else
			break;
	}
}
else if hspd<0
{
	repeat(abs(hspd))
	{
		if !place_meeting(x-1,y,block) && x>kouchou.room_left_border_x
			x-=1
		else
			break;
	}
}

if triggered   /// >:O
{
	life-=1
	
	if life<1
	{
		var b,hitboxspr;
		hitboxspr=mine_sprite_explosion
		
		if bigexplosion
		{
			var b;
			b=effect_aniend(mine_groundpunch_combo_shockwave,0.2,-1)
			b.image_xscale=bigexplosion_xscale
			hitboxspr=mine_groundpunch_combo_shockwave_hitbox
			show_debug_message("right: "+string(right))
			b=attack_create_hitbox(60,1,false,true,"mineexplosion_big",hitboxspr,0.2,99,15,7,1)
			b.creator=player_who_placed_mine
			b.combo_hit_pseudo_creator=player_who_placed_mine
			b.image_xscale=bigexplosion_xscale
		}
		else
		{
			effect_aniend(mine_sprite_explosion,0.2,-1)
			
			b=attack_create_hitbox(60,1,false,true,"mineexplosion",hitboxspr,0.2,99,0,12,2)
			b.creator=noone
			b.combo_hit_pseudo_creator=player_who_placed_mine
			b.image_xscale=bigexplosion_xscale
		}

		create_terrain_cutter(mine_terrain_cutter_spr,"hit",0,0)

		
		instance_destroy()
	}
}
