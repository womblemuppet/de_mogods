////////////////////////////////////////////////////////////////////////////////////////////////////////////// CHARGE ATTACKS/MOVEMENTS AND ANIMATION LOOP

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// FPUNCH
if fpunch_lockdown==1    //loops animation while charging 
{
	if image_index>3.9
		image_index=1
}
else if fpunch_lockdown==2 
{
	if image_index>5
	{
		if fpunch_has_made_hitbox==false
		{            
			attack_create_hitbox(30,1,true,true,"falconpunch",fpunchhitbox,3,99,14,2)
		}
        
		fpunch_has_made_hitbox=true
		fpunch_lockdown=3
        
	}

	if fpunch_feet_counter==2
	{
		if round(image_index)>4
			fpunch_feet_counter=3
	}
}


///////FPUNCH FEET STEPS
if fpunch_feet_counter!=-1 && groundcheck!=noone
{
	if fpunch_feet_counter==0 || fpunch_feet_counter==1
	{       
		var b;
		if fpunch_feet_counter==0
			b=-9
		else
			b=-11
            
		fpunch_feet_counter+=1
    
		punch_step_in(b)
	}
	if fpunch_feet_counter==3 || fpunch_feet_counter==4
	{
		var b;
		if fpunch_feet_counter==3
		{
			b=22 //28 cooler but annoying for gp combo
			fpunch_feet_counter+=1
		}
		else
		{
			b=10 //18 cooler but annoying for gp combo
			fpunch_feet_counter=-1   
		}

		punch_step_in(b)
	}
}

///////// FORWARDPUNCH FEET STEPS
if uniques_forwardpunch_feet_counter!=-1 && groundcheck!=noone   // -1  = not in use 0 = please start 1/2 steps forward (1 resets to -1)
{
	if uniques_forwardpunch_feet_counter==0 || uniques_forwardpunch_feet_counter==1
	{
		if uniques_forwardpunch_feet_counter==0
		{
			b=22
			uniques_forwardpunch_feet_counter+=1
		}
		else
		{
			b=16
			uniques_forwardpunch_feet_counter=-1   
		}
    
		punch_step_in(b)
	}
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
if uniques_aapunch_lockdown==1 && image_index>5
{
	if uniques_aapunch_has_made_hitbox==false 
	{
		attack_create_hitbox(25,1,true,true,"upwardpunch",vet_upwardpunch_hitbox,1,99,0,9)
	} 
    
	uniques_aapunch_has_made_hitbox=true
	uniques_aapunch_lockdown=2
    

}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////SHOOT AAPUNCH HITTBOX 2
if uniques_aapunch_lockdown==2 && image_index>15
{
	if uniques_aapunch_has_made_hitbox2==false 
	{
		attack_create_hitbox(25,1,true,true,"upwardpunch2",vet_upwardpunch_hitbox2,1,99,5,2)
	} 
    
	uniques_aapunch_has_made_hitbox=true
	uniques_aapunch_lockdown=3
    

}



if image_index>3  && uniques_forwardpunch_lockdown==1                         ///SHOOT FORWARDPUNCH 
{
	if uniques_forwardpunch_has_made_hitbox==false
	{
		var a;
		a=instance_create(x,y,groundpunch_shockwave)       ///create object that will make chain of shockwave hitboxes
		a.creator=self.id
		a.target=self.id
		a.right=right
		a.scale=sign(scale)
		
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
			b=attack_create_hitbox(25,1,true,true,"forwardpunch",vet_groundpunch_shockwave,0.8,99,7,3)
			b.creator=creator
			b.target=creator
			b.image_xscale=image_xscale
			b.hit_collector=self.id
			show_debug_message("shockwave"+string(n)+" x="+string(b.x)+" y="+string(b.y))

		}


		
		var a;
		a=effect_aniend(vet_groundpunch_shockwave,0.8,-1)
		if !right
			a.image_xscale=-1
	}
    
	uniques_forwardpunch_lockdown=2
	uniques_forwardpunch_has_made_hitbox=true    
    
}
if image_index>7 && uniques_sunblast_lockdown==1                             //////////FIRE SUNBLAST
{
	if uniques_sunblast_has_made_hitbox==false
	{//josh bertwhistle
		var a;
		a=instance_create_depth(x,y,-1,sunblast)
		a.right=right
		a.scale=scale
		a.creator=self.id
		
		if right
			a.hspeed=40
		else
			a.hspeed=-40
		
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
		vspd=min(vspd,0)   //if falling, stop fall
	}
	uniques_airbolt_lockdown=2
	uniques_airbolt_has_made_hitbox=true
}

if uniques_sharkattack_lockdown==1 && image_index>3
{
	if uniques_sharkattack_has_made_hitbox==false 
	{
		attack_create_hitbox(25,1,true,true,"sharkattack",bait_sharkattack_htibox,0.2,99,9,3)
	} 
    
	uniques_sharkattack_has_made_hitbox=true
	uniques_sharkattack_lockdown=2         
}


