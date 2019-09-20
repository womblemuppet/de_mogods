var numberofblocks_horizontal;
numberofblocks_horizontal=kouchou.rw/aizen.bw

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
	terrain_pyramid_plateau_y=terrain_ammo-choose(3,4,5)
	break;
			
	case "doublewaves":         ///both waves and double waves
	case "waves":              
	for (var i=0; i<6; i+=1)
	{
		terrain_wave_ha[i]=terrain_ammo-choose(1,2,3,4,5)
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

	terrain_blob_line1y=choose(7,8,9)   ///based on terrain_ammo
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