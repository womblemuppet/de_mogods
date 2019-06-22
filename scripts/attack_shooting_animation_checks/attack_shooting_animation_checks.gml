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
			attack_create_hitbox(30,1,true,true,true,"falconpunch",fpunchhitbox,3,99,14,2)
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
			b=24 //28 cooler but annoying for gp combo
			fpunch_feet_counter+=1
		}
		else
		{
			b=12 //18 cooler but annoying for gp combo
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
		attack_create_hitbox(25,1,true,true,true,"upwardpunch",vet_upwardpunch_hitbox,1,99,0,9)
	} 
    
	uniques_aapunch_has_made_hitbox=true
	uniques_aapunch_lockdown=2
    

}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////SHOOT AAPUNCH HITTBOX 2
if uniques_aapunch_lockdown==2 && image_index>15
{
	if uniques_aapunch_has_made_hitbox2==false 
	{
		attack_create_hitbox(25,1,true,true,true,"upwardpunch2",vet_upwardpunch_hitbox2,1,99,5,2)
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
		
		if !right
		{
			a.image_xscale=-1
			a.GAP=-30
		}
		else
			a.GAP=30

		with a                                                                       ////create the first shockwave hitbox here (changes here should also change groundpunch_shockwave alarm[0]
		{
			var b
			b=attack_create_hitbox(25,1,true,true,true,"forwardpunch",vet_groundpunch_shockwave,0.8,99,7,3)
			b.creator=creator
			b.target=creator
			b.image_xscale=image_xscale
			b.hit_collector=self.id
			//show_debug_message("shockwave"+string(n)+" x="+string(b.x)+" y="+string(b.y))
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
	{
		var b;
		b=attack_create_hitbox(30,1,false,true,true,"sunblast",sunblast_sprite,1,99,7,4)
		with b
		{
			x=round(x/40)*40
			instance_change(sunblast,false)
		}

		b.right=right
		b.length=1
		var c,MAX_LENGTH;
		MAX_LENGTH=30
		c=1
		if b.right==false
			c=-1
        
		with b
		{
			if right
			{
				repeat(MAX_LENGTH)
				{
					if !place_meeting(x+(40*length),y,block)
						length+=1
				}
			}
		else
			{
			repeat(MAX_LENGTH)
				{
					if !place_meeting(x-(40*length),y,block)
						length+=1
				}            
			}
		}
		//show_message(a.length)
		var d;
		d=create_terrain_cutter(eightysqcircle,"disintegrated",-1,7)      
         
		//b = hitbox id, d = terrain cutter id
		if b.right==false
		{
			b.image_xscale=-(b.length)
			d.x-=b.length*40
		}
		else
		{
			b.image_xscale=b.length
			d.x+=b.length*40
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
		if right
			a.image_xscale=-1
		a.hspd=5*a.image_xscale
	}
	uniques_airbolt_lockdown=2
	uniques_airbolt_has_made_hitbox=true
}

if uniques_sharkattack_lockdown==1 && image_index>3
{


	if uniques_sharkattack_has_made_hitbox==false 
	{
		attack_create_hitbox(25,1,true,true,true,"sharkattack",bait_sharkattack_htibox,1,99,9,3)
	} 
    
	uniques_sharkattack_has_made_hitbox=true
	uniques_sharkattack_lockdown=2
            
}


