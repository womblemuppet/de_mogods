var makeok;
makeok=true


var block_column_number;
block_column_number=argument0

var numberofblocks_horizontal
numberofblocks_horizontal=kouchou.rw/aizen.bw
	

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
		if block_column_number*aizen.bw==ds_list_find_value(pitlist,ii)
			makeok=false
		if terrain_ammo==1 /// connect pits at bottom
		{
			makeok=false
			if random(1)>0.5
				makeok=true
		}
	};                              break;
            
            
	case "rectangle" :
	if block_column_number*aizen.bw+kouchou.room_left_border_x<rectx1 || block_column_number*aizen.bw+kouchou.room_left_border_x>rectx2+aizen.bw
		makeok=false

	if terrain_ammo==1 && random(1)>0.75 || terrain_ammo==2 
		makeok=true                 break;
                
            
	case "rectanglebumpy" :
	if block_column_number*aizen.bw+kouchou.room_left_border_x<rectx1 || block_column_number*aizen.bw+kouchou.room_left_border_x>rectx2+aizen.bw
		makeok=false

	if terrain_ammo==1 && random(1)>0.75 || terrain_ammo==2 
		makeok=true                 
	if block_column_number>platform_singleblob_startxi && block_column_number<platform_singleblob_endxi  && terrain_ammo==platform_singleblob_ya     ///random platform
		makeok=true                
                
	break;
                
	case "reverserectangle" :
	makeok=false
	if block_column_number*aizen.bw+kouchou.room_left_border_x<rectx1 || block_column_number*aizen.bw+kouchou.room_left_border_x>rectx2
		makeok=true                    break;
            
            
	case "singleplatform" :
	makeok=false
	if terrain_ammo>=platform_startya && terrain_ammo <= platform_endya      ////main platform
		makeok=true
	if block_column_number>platform_singleblob_startxi && block_column_number<platform_singleblob_endxi  && terrain_ammo==platform_singleblob_ya    ///random platform
		makeok=true
				          break;
	case "singleplatformbumpy" :
	makeok=false
	if terrain_ammo>=platform_startya && terrain_ammo <=platform_endya      ////main platform
		makeok=true
	if ( terrain_ammo==platform_endya+1  && random(1)>0.8 ) || ( terrain_ammo==platform_startya-1 && random(1)>0.4 )    ///bumps   (more smooth on bottom)
		makeok=true
	if block_column_number>platform_singleblob_startxi && block_column_number<platform_singleblob_endxi  && terrain_ammo==platform_singleblob_ya     ///random platform
		makeok=true
				          break;  
	case "lplatform" :
	makeok=false
            
	if terrain_ammo<5 || (lplatform_on_right && block_column_number<lplatform_xi) || (!lplatform_on_right && block_column_number>lplatform_xi)    ///lplatform
		makeok=true
	if block_column_number>platform_singleblob_startxi && block_column_number<platform_singleblob_endxi  && terrain_ammo==platform_singleblob_ya     ///random platform
		makeok=true
				          break;         
	case "lplatformbumpy" :
	makeok=false
            
	if terrain_ammo<5 || (lplatform_on_right && block_column_number<lplatform_xi) || (!lplatform_on_right && block_column_number>lplatform_xi)    ///lplatform
		makeok=true
	if terrain_ammo==6 && irandom(1)>0.4
		makeok=true
	if block_column_number>platform_singleblob_startxi && block_column_number<platform_singleblob_endxi  && terrain_ammo==platform_singleblob_ya     ///random platform
		makeok=true
				          break;            
                
	case "pyramid" :
	makeok=false
	if block_column_number>terrain_ammo && block_column_number<(numberofblocks_horizontal)-terrain_ammo
		makeok=true
	if terrain_ammo>terrain_pyramid_plateau_y
		makeok=false
	if terrain_ammo==0 || terrain_ammo==1 || terrain_ammo==2
		makeok=true                 break;
                
                
	case "waves":
	if terrain_wave_xup[block_column_number]==false
		makeok=false
	var waveno;
	waveno=floor(   (block_column_number*aizen.bw)/(kouchou.rw/6))
	//show_message(string(waveno))
	if terrain_ammo>=terrain_wave_ha[waveno]
		makeok=false
	if terrain_ammo<=terrain_wave_ylim
		makeok=true                 break;
                
	case "doublewaves":
	if terrain_wave_xup[block_column_number]==false || terrain_wave_xup[min(block_column_number+1,floor(numberofblocks_horizontal))]==false        ///if not on or next to wave point, don't make wave   (waves are 2 thick)
		makeok=false
	var waveno;
		waveno=floor(   (block_column_number*aizen.bw)/(kouchou.rw/6))
	if terrain_ammo>=terrain_wave_ha[waveno]   ///errored here with 0 as waveno?
		makeok=false
	if terrain_ammo<=terrain_wave_ylim
		makeok=true                 break;                
                
	case "blobs" :
	makeok=false
	for (ii=0; ii<terrain_blob_number; ii+=1)
	{
		if (block_column_number*aizen.bw)+kouchou.room_left_border_x>= terrain_blob_xl[ii] && (block_column_number*aizen.bw)+kouchou.room_left_border_x<= terrain_blob_xr[ii] && terrain_ammo >= terrain_blob_yu[ii] && terrain_ammo <= terrain_blob_yd[ii]
		{
			makeok=true
		}
	};
	if terrain_ammo==terrain_blob_line1y ||  terrain_ammo==terrain_blob_line2y 
	makeok=true                 break;
                
	case "sidesteps":
	if steps_on_right
	{
		if block_column_number>sidesteps_start_i+terrain_ammo*2
			makeok=false
	}
	else
	{
		if block_column_number<sidesteps_start_i-terrain_ammo*2
			makeok=false
	}
	if terrain_ammo mod 3 ==0
		makeok=true

	break;
            
	case "chamberspillar":
	makeok=false
	for (ii=0; ii<4; ii+=1)
	{
		if chambers_y[ii]==terrain_ammo
		{
			makeok=true
			break;
		}
	};
	if block_column_number==chambers_central_pillar || block_column_number==chambers_central_pillar-1 || block_column_number==chambers_central_pillar+1
		makeok=true
                
	break;
                        
	case "secretbox":
	makeok=false

	if secretbox_on_right 
	{
		if block_column_number > secretbox_platforms_startxi 
		{
			makeok=true
			if block_column_number>=secretbox_xistart && block_column_number<=secretbox_xifinish && terrain_ammo>1 && terrain_ammo<9   ///box boundaries
				makeok=false
		}
		else
		{
			if terrain_ammo mod 3 ==0
				makeok=true
		}
	}
	else   ///secret box on left
	{
		if block_column_number < secretbox_platforms_startxi
		{
			makeok=true
			if block_column_number>=secretbox_xistart && block_column_number<=secretbox_xifinish && terrain_ammo>1 && terrain_ammo<9   ///box boundaries
				makeok=false
		}
		else
		{
			if terrain_ammo mod 3 ==0
				makeok=true
		}
	} 

            
	break;
            
            
	case "biomegap":      
	makeok=false   
	
	break;  
            
               
            
	default: show_error("unhandled terraintype in terraingen",true);
}

return makeok