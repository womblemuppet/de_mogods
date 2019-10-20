////////////////////////////////////////////////////////////////////////////////////////////////////////////// CHARGE ATTACKS/MOVEMENTS AND ANIMATION LOOP

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// FPUNCH
if uniques_fpunch_lockdown==1    //loops animation while charging 
{
	if image_index>3.9
		image_index=1
}
else if uniques_fpunch_lockdown==2
{
	if image_index>5
	{
		if uniques_fpunch_has_made_hitbox==false
		{            
			attack_create_hitbox(30,1,true,true,"falconpunch",fpunchhitbox,3,99,14,2)
			create_terrain_cutter(fpunchhitbox,"hit",right_to_dir(),7)
		}
        
		uniques_fpunch_has_made_hitbox=true
		uniques_fpunch_lockdown=3
        
	}

	if uniques_fpunch_feet_counter==2
	{
		if round(image_index)>4
			uniques_fpunch_feet_counter=3
	}
}


///////FPUNCH FEET STEPS
if uniques_fpunch_feet_counter!=-1 && groundcheck!=noone
{
	if uniques_fpunch_feet_counter==0 || uniques_fpunch_feet_counter==1
	{       
		var b;
		if uniques_fpunch_feet_counter==0
			b=-9
		else
			b=-11
            
		uniques_fpunch_feet_counter+=1
    
		punch_step_in(b)
	}
	if uniques_fpunch_feet_counter==3 || uniques_fpunch_feet_counter==4
	{
		var b;
		if uniques_fpunch_feet_counter==3
		{
			b=22 //28 cooler but annoying for gp combo
			uniques_fpunch_feet_counter+=1
		}
		else
		{
			b=10 //18 cooler but annoying for gp combo
			uniques_fpunch_feet_counter=-1   
		}

		punch_step_in(b)
	}
}

//UGA super smash
if uniques_supersmash_lockdown==1 && image_index>6
{
	if uniques_supersmash_has_made_hitbox==false
		attack_ooga_ultimate()
	uniques_supersmash_has_made_hitbox=true
	uniques_supersmash_lockdown=2
}

///////// SHARKATTACK PUNCH FEET STEPS
if uniques_sharkattack_feet_counter!=-1 && groundcheck!=noone   // -1  = not in use 0 = please start 1/2 steps forward (1 resets to -1)
{
	if uniques_sharkattack_feet_counter==0 || uniques_sharkattack_feet_counter==1
	{
		if uniques_sharkattack_feet_counter==0
		{
			b=14
			uniques_sharkattack_feet_counter+=1
		}
		else
		{
			b=8
			uniques_sharkattack_feet_counter=-1   
		}
    
		punch_step_in(b)
	}
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////SHOOT AAPUNCH
if uniques_spinner_attack_lockdown==1 && image_index>5
{
	if uniques_spinner_attack_has_made_aa_hitbox==false 
	{
		uniques_spinner_attack_hitbox_id=attack_create_hitbox(25,1,true,true,"spinattack",vet_upwardpunch_hitbox,0.2,99,0,9)
	} 
    
	uniques_spinner_attack_has_made_aa_hitbox=true
}

if uniques_spinner_attack_lockdown==1  && image_index>12     //loops spinner anti-air attack
{
	image_index=9
	if uniques_spinner_attack_hitbox_id!=noone
		if instance_exists(uniques_spinner_attack_hitbox_id)
			with uniques_spinner_attack_hitbox_id
				image_index=0
}

if uniques_spinner_attack_lockdown==2 && image_index>12                         ///SHOOT FORWARDPUNCH 
{
	if uniques_spinner_attack_has_made_shockwave_hitbox==false
	{
		var HKB,VKB;
		HKB=UNIQUES_FORWARD_PUNCH_HKB
		VKB=UNIQUES_FORWARD_PUNCH_VKB
		
		var a,me;
		me=self.id
		a=instance_create(x,y,groundpunch_shockwave)       ///create object that will make chain of shockwave hitboxes
		a.creator=me
		a.target=me
		a.right=right
		a.scale=sign(scale)
		a.hkb=HKB
		a.vkb=VKB
		
		if !right
		{
			a.image_xscale=-1
			a.GAP=-60
		}
		else
		{
			a.image_xscale=1
			a.GAP=60
		}

		with a                                                                       ////create the first shockwave hitbox here (changes here should also change groundpunch_shockwave alarm[0]
		{
			var b
			b=attack_create_hitbox(25,1,true,true,"forwardpunch",vet_groundpunch_shockwave,0.8,99,HKB,VKB)
			b.creator=me
			b.target=me
			b.image_xscale=image_xscale
			b.hit_collector=self.id
			//show_debug_message("shockwave"+string(n)+" x="+string(b.x)+" y="+string(b.y))
		}


		
		var a;
		a=effect_aniend(vet_groundpunch_shockwave,0.8,-1)
		if !right
			a.image_xscale=-1
	}
	uniques_spinner_attack_lockdown=3
	uniques_spinner_attack_has_made_shockwave_hitbox=true
}

if uniques_vet_kamikaze_lockdown==1 && image_index>5
{
	isteps=15
	uniques_vet_kamikaze_lockdown=2
	hspd=UNIQUES_VET_KAMIKAZE_HSPEED
	if !right
		hspd=-UNIQUES_VET_KAMIKAZE_HSPEED
		
	uniques_vet_kamikaze_dash_current_hitbox_object=attack_create_hitbox(30,1,true,true,"veteran_kamikaze",Vet_3H_super_charge_hitbox,0.2,99,0,0)
	if !right
		uniques_vet_kamikaze_dash_current_hitbox_object.direction=180
	//(stun amount, number of hh, reset attacker hh, reset opponent,attack name,sprite,image speed,active steps,hkb,vkb)
}

if image_index>7 && uniques_sunblast_lockdown==1                             //////////FIRE SUNBLAST
{
	if uniques_sunblast_has_made_hitbox==false
	{//josh bertwhistle
		//with create_terrain_cutter(sunblast_terrain_cut_mask,"disintegrated",270,0)
		//{
		//	image_xscale=1
		//	image_yscale=1	
		//}

		var a;
		a=instance_create_depth(x,y,-1,sunblast)
		a.right=right
		a.scale=1
		a.creator=self.id
		
		if right
		{
			a.x+=40
			a.hspeed=40
		}
		else
		{
			a.x-=40
			a.hspeed=-40
		}
		
	}
	
	uniques_sunblast_lockdown=2
	uniques_sunblast_has_made_hitbox=true
}
if image_index>3 && uniques_airbolt_lockdown==1                             //////////FIRE AIR SUNBOLT
{
	if uniques_airbolt_has_made_hitbox==false
	{
		var a;
		a=instance_create_depth(x,y,0,slinger_airbolt)
		a.creator=self.id
		a.right=right
		a.scale=scale
		if !right
			a.image_xscale=-1
		a.hspeed=12*a.image_xscale
		a.vspeed=9
		
		float_counter=UNIQUES_AIRBOLT_FLOAT_COUNTER_AMOUNT
		vspd=min(vspd,-1)   //if falling, stop fall
		hspd=clamp(hspd,-1,1)
	}
	uniques_airbolt_lockdown=2
	uniques_airbolt_has_made_hitbox=true
}

if uniques_slinger_superblast_lockdown==1 && image_index>5
{
	if uniques_slinger_superblast_has_made_hitbox==false
	{
		with attack_create_hitbox(100,1,false,true,"uniques_superblast",superblast_hitbox_spr,0.2,99,0,0)
		{
			image_xscale=sign(image_xscale)
			image_yscale=sign(image_yscale)
			target=noone
		}
		var a;
		a=effect_aniend(superblast_blast_spr,0.2,-2)
		if !right
			a.image_xscale=-1
		with create_terrain_cutter(superblast_hitbox_spr,"disintegrated",270,2)
		{
			image_xscale=sign(image_xscale)
			image_yscale=sign(image_yscale)
		}
	}
	
	uniques_slinger_superblast_has_made_hitbox=true
	uniques_slinger_superblast_lockdown=2
}


if uniques_sharkattack_lockdown==1 && image_index>4
{
	if uniques_sharkattack_has_made_hitbox==false 
	{
		attack_create_hitbox(25,1,true,true,"sharkattack",bait_sharkattack_htibox,0.2,99,9,3)
		create_terrain_cutter(bait_sharkattack_htibox,"hit",right_to_dir(),5)
	} 
    
	uniques_sharkattack_has_made_hitbox=true
	uniques_sharkattack_lockdown=2         
}


