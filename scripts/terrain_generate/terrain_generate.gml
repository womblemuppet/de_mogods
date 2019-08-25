/***************************************************
  the terrain type and block creation part of terrain gen
  doesn't include biome selection or backdrops.
  not connected to "travelled" variable
  called from aizen
  
 ***************************************************/
if bedrockcounter>aizen.bh    ///create new blocks every x pixels moved down ( x = block height )
{

	var numberofblocks_horizontal
	numberofblocks_horizontal=kouchou.rw/aizen.bw

	bedrockcounter-=aizen.bh    ///reset bedrockcounter

	for (var i = 0; i < ds_list_size(blockstosprite_prevlayer); i++) 
	{
		ds_list_add(blockstosprite,blockstosprite_prevlayer[| i])
	}
	ds_list_clear(blockstosprite_prevlayer)

	number_of_tergenned_lines++

		
	///shift buffer
		
	for (var i = 0; i < numberofblocks_horizontal; i++) 
	{
		terrain_buffer_layer3[i]=terrain_buffer_layer2[i]
		terrain_buffer_layer2[i]=terrain_buffer_layer_newest[i]
	}
	
	//show_debug_message("terrain gen at "+string(player_baseline+CREATIONDELAY)+"baseline:"+string(player_baseline)+"   "+string(bedrockcounter)+" is bedrockcounter")

	terrainammo-=1  //move one layer on in current terrain chunk
	//show_message(terraintype+"    ammo="+string(terrainammo))
	if terrainammo<1   /// new terrain type
	{
		////access random terraintype and chunk_type from chunkery
		
		if !ds_map_exists(map_of_chunk_style_pools,biome)
			show_error("biome key nonexistant in mapofchunkstylepools: "+biome,true)
		ds_list_shuffle(map_of_chunk_style_pools[? biome])
		chunk_type=ds_list_find_value(map_of_chunk_style_pools[? biome],0)
		terraintype=chunkery_chunk_type[? chunk_type]
        
		if !ds_map_exists(chunkery_ammo_min,chunk_type)
			show_error("nonexistant chunktype in chunkeryammo min. called="+string(chunk_type),true)
		if !ds_map_exists(chunkery_ammo_max,chunk_type)
			show_error("nonexistant chunktype in chunkeryammo max. called="+string(chunk_type),true)

		///set specific terraintype characteristics
            
		if terraintype!="solidline"   ///full line
			terrainammo=irandom_range(chunkery_ammo_min[? chunk_type],chunkery_ammo_max[? chunk_type])
	
		switch (terraintype)
		{
			case "solidline":
			break;
			
			case "dots":
			break;
			
			case "pits":  
			ds_list_clear(pitlist)
			repeat(5)
				ds_list_add(pitlist,kouchou.room_left_border_x+round(random(kouchou.rw)/aizen.bw)*aizen.bw)
			//terrainammo=choose(3,3,8)            
			break;
			
			case "reverserectangle":
			rectx1=kouchou.room_x_halfway-round(random(kouchou.rw/1.5)/aizen.bw)*aizen.bw
			rectx2=kouchou.room_x_halfway+round(random(kouchou.rw/1.5)/aizen.bw)*aizen.bw
			break;   
			
			case "rectanglebumpy":    ///both rectangle and rectangle bumpy      
			case "rectangle":
			rectx1=kouchou.room_x_halfway-round(random(kouchou.rw/2)/aizen.bw)*aizen.bw
			rectx2=kouchou.room_x_halfway+round(random(kouchou.rw/2)/aizen.bw)*aizen.bw
			platform_singleblob_startxi=irandom(floor(numberofblocks_horizontal)-15)
			platform_singleblob_endxi=platform_singleblob_startxi+5+irandom(9)
			platform_singleblob_ya=choose(1,2,3,4,5,6,7)
			break;    
			
			case "singleplatformbumpy":        ///both single-platform and single-platform bumpy
			case "singleplatform":
			platform_startya=choose(1,2)
			platform_endya=choose(4,5)
			platform_singleblob_startxi=irandom(floor(numberofblocks_horizontal)-15)
			platform_singleblob_endxi=platform_singleblob_startxi+5+irandom(9)
			platform_singleblob_ya=choose(3,4,5,6,7,8,9)
			break;
			
			case "lplatformbumpy":
			case "lplatform":
			lplatform_on_right=choose(true,false)
			if lplatform_on_right
				lplatform_xi=floor(numberofblocks_horizontal)-4-irandom(25)
			else
				lplatform_xi=4+irandom(25)
			platform_singleblob_startxi=irandom(floor(numberofblocks_horizontal)-15)
			platform_singleblob_endxi=platform_singleblob_startxi+5+irandom(9)
			platform_singleblob_ya=choose(3,4,5,6,7)
			break;
            
			case "pyramid":
			//terrainammo=choose(10,12,14,16)
			terrain_pyramid_plateau_y=terrainammo-choose(3,4,5)
			break;
			
			case "doublewaves":         ///both waves and double waves
			case "waves":              
			for (var i=0; i<6; i+=1)
			{
				terrain_wave_ha[i]=terrainammo-choose(1,2,3,4,5)
			};                        
			terrain_wave_xup[numberofblocks_horizontal]=false   ///resets array that stores whether there is a wave at that x pos or not [finaledit] don't need this line itself?
			for (var i=0; i<numberofblocks_horizontal; i+=1)
			{
				terrain_wave_xup[numberofblocks_horizontal]=false
			};
            
			var build;
			build=false
            
			for (var i=0; i<numberofblocks_horizontal; i+=1)
			{
				if random(1)>0.7  && build<-2
					build=choose(2,3,4)                  ///only have a wave appear every 2,3,4 columns         
                    
				build-=1
                
				if build>0
					terrain_wave_xup[i]=true           ///at this x position, have a wave
                    
			};
			terrain_wave_ylim=choose(3,4)
			break;       
            
			case "blobs":
			terrain_blob_number=choose(3,4,5,6)
			for (var i=0; i<terrain_blob_number; i+=1)
			{
				terrain_blob_xl[i]=kouchou.room_left_border_x+random(kouchou.rw-300)
				terrain_blob_xr[i]=terrain_blob_xl[i]+200
				terrain_blob_yu[i]=choose(1,2,3,4,5,6,7)
				terrain_blob_yd[i]=terrain_blob_yu[i]+choose(2,3,4)
			};            

			terrain_blob_line1y=choose(7,8,9)   ///based on terrainammo
			terrain_blob_line2y=choose(0,1,2)
			break;  
			
			case "sidesteps":
			steps_on_right=choose(true,false)
			if steps_on_right==true
				sidesteps_start_i=4+irandom(4)
			else
				sidesteps_start_i=numberofblocks_horizontal-1-irandom(4)
			break;
			
			case "chamberspillar":
			chambers_y[0]=choose(0,1,2)
			chambers_y[1]=choose(4,5,6)
			chambers_y[2]=choose(8,9,10)
			chambers_y[3]=choose(12,13,14)
			chambers_y[4]=choose(16,17,18)
			chambers_central_pillar=floor((kouchou.rw/2)/aizen.bw)+choose(-3,-1,0,1,3)
			break;
            
			case "secretbox":
			secretbox_on_right=choose(true,false)   ///whether secret box is on right or left
			if secretbox_on_right
			{
				secretbox_xistart=floor(numberofblocks_horizontal)-choose(8,9,10)         ///x start and end of the secret box
				secretbox_xifinish=floor(numberofblocks_horizontal)-choose(3,4,5) 
			}
			else
			{
				secretbox_xistart=choose(2,3,4)         ///x start and end of the secret box
				secretbox_xifinish=choose(7,8,9)
			}
			secretbox_platforms_startxi=floor(kouchou.rw/80)+choose(-2,0,2)    ///the 1/2way x line between the platforms and boxed area
			/*show_message("secretbox_on_right="+string(secretbox_on_right))
			show_message("secretbox_xistart="+string(secretbox_xistart))
			show_message("secretbox_xifinish="+string(secretbox_xifinish))
			show_message("secretbox_platforms_startxi="+string(secretbox_platforms_startxi))*/
			break;
            
			default: 
				show_error("i dont know this terrain type what is this",true)
		}
	}

	/////////////////////////////////////////////////////////////////////////////////////////////biomeswitch event will overwrite all of the above switch 
	if biomeswitch   ///[finaledit] check if used...
	{
		terraintype="biomegap"
		terrainammo=4
		biomeswitch=false
		//call_block_setup()
	}

	//////determine based on terraintype characteristics whether or not to spawn a block for each square left to right of the current layer

	var gapammo,makeok;
	gapammo=0
	makeok=true

	
	for (var i=0; i<numberofblocks_horizontal; i+=1)   ///create blocks by horizontal line
	{
		makeok=true
		if position_meeting(kouchou.room_left_border_x+i*aizen.bw,argument0,block)   //[finaledit] it pains me to do this check just for gunpowder.
			makeok=false
        
		switch (terraintype)
		{
			case "solidline" :
			///nandemonai
				break;
			case "line": 
			if random(1)>0.75
				gapammo=2+irandom(2)    ///line gap
			if gapammo>0
			{
				makeok=false
				gapammo-=1
			};                              break;
            
            
			case "dots":
			if random(1)>0.225
				makeok=false                break;
                
                
			case "pits":
			for (ii=0; ii<ds_list_size(pitlist); ii+=1)
			{
				if i*aizen.bw==ds_list_find_value(pitlist,ii)
					makeok=false
				if terrainammo==1 /// connect pits at bottom
				{
					makeok=false
					if random(1)>0.5
						makeok=true
				}
			};                              break;
            
            
			case "rectangle" :
			if i*aizen.bw+kouchou.room_left_border_x<rectx1 || i*aizen.bw+kouchou.room_left_border_x>rectx2+aizen.bw
				makeok=false
			//if terrainammo==1 && (i*40-40==round(rectx1/40)*40 || i*40+40==round(rectx2/40)*40  || i*40==round(rectx1/40)*40 || i*40==round(rectx2/40)*40 )
			if terrainammo==1 && random(1)>0.75 || terrainammo==2 
				makeok=true                 break;
                
            
			case "rectanglebumpy" :
			if i*aizen.bw+kouchou.room_left_border_x<rectx1 || i*aizen.bw+kouchou.room_left_border_x>rectx2+aizen.bw
				makeok=false
			//if terrainammo==1 && (i*40-40==round(rectx1/40)*40 || i*40+40==round(rectx2/40)*40  || i*40==round(rectx1/40)*40 || i*40==round(rectx2/40)*40 )
			if terrainammo==1 && random(1)>0.75 || terrainammo==2 
				makeok=true                 
			if i>platform_singleblob_startxi && i<platform_singleblob_endxi  && terrainammo==platform_singleblob_ya     ///random platform
				makeok=true                
                
			break;
                
                                
			case "reverserectangle" :
			makeok=false
			if i*aizen.bw+kouchou.room_left_border_x<rectx1 || i*aizen.bw+kouchou.room_left_border_x>rectx2
				makeok=true

			/*
			if i*40<rectx1+40*(1-(terrainammo mod 3)) || i*40>rectx2-40*(terrainammo mod 3)
			makeok=true
			if terrainammo==1
			{
			if i*40==round(rectx1/40)*40 || i*40==round(rectx2/40)*40 
				makeok=false
			}     */                          break;
            
            
			case "singleplatform" :
			makeok=false
			if terrainammo>=platform_startya && terrainammo <= platform_endya      ////main platform
				makeok=true
			if i>platform_singleblob_startxi && i<platform_singleblob_endxi  && terrainammo==platform_singleblob_ya    ///random platform
				makeok=true
				                break;
			case "singleplatformbumpy" :
			makeok=false
			if terrainammo>=platform_startya && terrainammo <=platform_endya      ////main platform
				makeok=true
			if ( terrainammo==platform_endya+1  && random(1)>0.8 ) || ( terrainammo==platform_startya-1 && random(1)>0.4 )    ///bumps   (more smooth on bottom)
				makeok=true
			if i>platform_singleblob_startxi && i<platform_singleblob_endxi  && terrainammo==platform_singleblob_ya     ///random platform
				makeok=true
				                break;  
			case "lplatform" :
			makeok=false
            
			if terrainammo<5 || (lplatform_on_right && i<lplatform_xi) || (!lplatform_on_right && i>lplatform_xi)    ///lplatform
				makeok=true
			if i>platform_singleblob_startxi && i<platform_singleblob_endxi  && terrainammo==platform_singleblob_ya     ///random platform
				makeok=true
				                break;         
			case "lplatformbumpy" :
			makeok=false
            
			if terrainammo<5 || (lplatform_on_right && i<lplatform_xi) || (!lplatform_on_right && i>lplatform_xi)    ///lplatform
				makeok=true
			if terrainammo==6 && irandom(1)>0.4
				makeok=true   //true
			if i>platform_singleblob_startxi && i<platform_singleblob_endxi  && terrainammo==platform_singleblob_ya     ///random platform
				makeok=true
				                break;            
                
			case "pyramid" :
			makeok=false
			if i>terrainammo && i<(numberofblocks_horizontal)-terrainammo
				makeok=true
			if terrainammo>terrain_pyramid_plateau_y
				makeok=false
			if terrainammo==0 || terrainammo==1 || terrainammo==2
				makeok=true                 break;
                
                
			case "waves":
			if terrain_wave_xup[i]==false
				makeok=false
			var waveno;
			waveno=floor(   (i*aizen.bw)/(kouchou.rw/6))
			//show_message(string(waveno))
			if terrainammo>=terrain_wave_ha[waveno]
				makeok=false
			if terrainammo<=terrain_wave_ylim
				makeok=true                 break;
                
			case "doublewaves":
			if terrain_wave_xup[i]==false || terrain_wave_xup[min(i+1,floor(numberofblocks_horizontal))]==false        ///if not on or next to wave point, don't make wave   (waves are 2 thick)
				makeok=false
			var waveno;
				waveno=floor(   (i*aizen.bw)/(kouchou.rw/6))
			if terrainammo>=terrain_wave_ha[waveno]   ///errored here with 0 as waveno?
				makeok=false
			if terrainammo<=terrain_wave_ylim
				makeok=true                 break;                
                
			case "blobs" :
			makeok=false
			for (ii=0; ii<terrain_blob_number; ii+=1)
			{
				if (i*aizen.bw)+kouchou.room_left_border_x>= terrain_blob_xl[ii] && (i*aizen.bw)+kouchou.room_left_border_x<= terrain_blob_xr[ii] && terrainammo >= terrain_blob_yu[ii] && terrainammo <= terrain_blob_yd[ii]
				{
					makeok=true
				}
			};
			if terrainammo==terrain_blob_line1y ||  terrainammo==terrain_blob_line2y 
			makeok=true                 break;
                
			case "sidesteps":
			if steps_on_right
			{
				if i>sidesteps_start_i+terrainammo*2
					makeok=false
			}
			else
			{
				if i<sidesteps_start_i-terrainammo*2
					makeok=false
			}
			if terrainammo mod 3 ==0
				makeok=true

			break;
            
			case "chamberspillar":
			makeok=false
			for (ii=0; ii<4; ii+=1)
			{
				if chambers_y[ii]==terrainammo
				{
					makeok=true
					break;
				}
			};
			if i==chambers_central_pillar || i==chambers_central_pillar-1 || i==chambers_central_pillar+1
				makeok=true
                
			break;
                        
			case "secretbox":
			makeok=false

			if secretbox_on_right 
			{
				if i > secretbox_platforms_startxi 
				{
					makeok=true
					if i>=secretbox_xistart && i<=secretbox_xifinish && terrainammo>1 && terrainammo<9   ///box boundaries
						makeok=false
				}
				else
				{
					if terrainammo mod 3 ==0
						makeok=true
				}
			}
			else   ///secret box on left
			{
				if i < secretbox_platforms_startxi
				{
					makeok=true
					if i>=secretbox_xistart && i<=secretbox_xifinish && terrainammo>1 && terrainammo<9   ///box boundaries
						makeok=false
				}
				else
				{
					if terrainammo mod 3 ==0
						makeok=true
				}
			} 

            
			break;
            
            
			case "biomegap":      
			makeok=false                    break;  
            
               
            
			default: show_error("unhandled terraintype in terraingen",true);
		}

     
		var a;
		a=-1
		
		////////////////////// if all checks passed,  create block
		if makeok 
		{
			var typeofblock;
			typeofblock="block"   ///normal
			var rand;
			rand=random(1)
			
			if biome!="summit" && terrain_special_block_ok() && rand<0.02
				typeofblock="payday ore"      ////payday
			if biome=="sand" && rand>=0.02 && rand <0.04
				typeofblock="weaksand"      ////dissolve block (weaksand)
			if rand>=0.04 && rand<0.045
				typeofblock="instrument"
			//if biome!="summit" && random(1)>0.999
			//	typeofblock=3     ////gunpowder
			//if random(1)>0.995
			//	typeofblock=4   ///pineapple
			//if random(1)>0.995 && terrain_special_block_ok()      TURRET BLOCKS DISABLED
			//	typeofblock=5   ///sentinel    
     

			switch typeofblock
			{
				case "block":
					a=spawn_block(kouchou.room_left_border_x+i*aizen.bw,argument0,0)
					ds_list_add(blockstosprite_prevlayer,a)   break;
				case "payday ore":
					a=spawn_ore_block(kouchou.room_left_border_x+i*aizen.bw,argument0) break;
				case "weaksand":
					a=spawn_weaksand_block(kouchou.room_left_border_x+i*aizen.bw,argument0) break;
				//case 3:
				//	a=spawn_gunpowder_block(kouchou.room_left_border_x+i*40,argument0,0)
				//	ds_list_add(blockstosprite,a)       ///gunnysnake itself doesn't make a block so this makes one for the initial position
				//	instance_create(kouchou.room_left_border_x+i*40,argument0,gunnysnake) break;
				//case 4:
				//	a=spawn_tree_block(kouchou.room_left_border_x+i*40,argument0) break;
				//case 5:
				//	a=spawn_turret_block(kouchou.room_left_border_x+i*40,argument0) break;
				case "instrument":
					//show_message("i="+string(i))
					a=spawn_instrument_block(kouchou.room_left_border_x+i*aizen.bw,argument0,false) break;
				default:
					show_error("unhandled typeofblock case",true)
			}
		}
		
		terrain_buffer_layer_newest[i]=a

			
		if random(1)>0.995                                                            /////fossils
		{
			var a;
			a=instance_create(kouchou.room_left_border_x+i*aizen.bw,argument0,ef_fossil)
			a.image_xscale=choose(0.5,0.7,0.9)
			a.image_yscale=a.image_xscale
			a.image_xscale=choose(1,-1)
			switch biome
			{
				case "summit":
					image_index=choose(0,1,2)
					image_angle=random(360) break;
				case "sand":
					image_index=choose(3) break;
				case "cave":
					 image_index=choose(4) break;
			}
		}
        
        
		////spawn extras (props, critters, throwable critters
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////props,critters,crabs won't spawn on startingflat
		if terraintype!="startingflat"
		{
			if random(1)>0.999                                                           /////props
			{
				var p_type,p_type_die;
				switch biome
				{
					case "summit":       ///decide the type of prop here
					default:
					p_type=prop_sprite_statue_1
					p_type_die=prop_sprite_statue_1_die
					break;
				}
				prop_create(kouchou.room_left_border_x+i*aizen.bw,argument0,prop_sprite_statue_1,prop_sprite_statue_1_die)
			}
		}
	
          
	};
	if terraintype!="startingflat"
	{
		if random(1)>0.995                                                          /////critter
		{
			var critter_type,critter_species;
			critter_type=choose("ground")//,"flying"
			if critter_type=="ground"
				critter_species=choose("worm")//,snake etc)
			var a;
			a=instance_create(kouchou.room_left_border_x+i*aizen.bw,5+argument0,critter)
			with a
				critter_setup("worm")
		}
		
		
		
		if random(1)>0.75                                                          /////throwable critters
		{
			var possibles=ds_list_create()
			
			for (var i = 0; i < numberofblocks_horizontal; i++) 
			{
				if terrain_buffer_layer_newest[i]>0 && terrain_buffer_layer2[i]==-1
					ds_list_add(possibles,terrain_buffer_layer_newest[i])
			}
			
			if ds_list_size(possibles) >0
			{
				ds_list_shuffle(possibles)
				var critter_spawn_x;
				critter_spawn_x=possibles[| 0].x
				show_debug_message("spawned, crittter_spawn_x = "+string(critter_spawn_x)+" terrain_buffer_layer_newest["+string(0)+"] = "+string(terrain_buffer_layer_newest[0])+" terrain_buffer_layer2["+string(0)+"] = "+string(terrain_buffer_layer2[0]))
				ds_list_destroy(possibles)
				
				var a;
				a=instance_create(critter_spawn_x,argument0-aizen.bh,crab)
				with a
					critter_throwable_setup(choose("crab","goat"))
			}
		}
	}
}
