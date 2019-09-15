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
		if terrainammo==1 /// connect pits at bottom
		{
			makeok=false
			if random(1)>0.5
				makeok=true
		}
	};                              break;
            
            
	case "rectangle" :
	if block_column_number*aizen.bw+kouchou.room_left_border_x<rectx1 || block_column_number*aizen.bw+kouchou.room_left_border_x>rectx2+aizen.bw
		makeok=false
	//if terrainammo==1 && (block_column_number*40-40==round(rectx1/40)*40 || block_column_number*40+40==round(rectx2/40)*40  || block_column_number*40==round(rectx1/40)*40 || block_column_number*40==round(rectx2/40)*40 )
	if terrainammo==1 && random(1)>0.75 || terrainammo==2 
		makeok=true                 break;
                
            
	case "rectanglebumpy" :
	if block_column_number*aizen.bw+kouchou.room_left_border_x<rectx1 || block_column_number*aizen.bw+kouchou.room_left_border_x>rectx2+aizen.bw
		makeok=false
	//if terrainammo==1 && (block_column_number*40-40==round(rectx1/40)*40 || block_column_number*40+40==round(rectx2/40)*40  || block_column_number*40==round(rectx1/40)*40 || block_column_number*40==round(rectx2/40)*40 )
	if terrainammo==1 && random(1)>0.75 || terrainammo==2 
		makeok=true                 
	if block_column_number>platform_singleblob_startxi && block_column_number<platform_singleblob_endxi  && terrainammo==platform_singleblob_ya     ///random platform
		makeok=true                
                
	break;
                
	case "reverserectangle" :
	makeok=false
	if block_column_number*aizen.bw+kouchou.room_left_border_x<rectx1 || block_column_number*aizen.bw+kouchou.room_left_border_x>rectx2
		makeok=true

	/*
	if block_column_number*40<rectx1+40*(1-(terrainammo mod 3)) || block_column_number*40>rectx2-40*(terrainammo mod 3)
	makeok=true
	if terrainammo==1
	{
	if block_column_number*40==round(rectx1/40)*40 || block_column_number*40==round(rectx2/40)*40 
		makeok=false
	}     */                          break;
            
            
	case "singleplatform" :
	makeok=false
	if terrainammo>=platform_startya && terrainammo <= platform_endya      ////main platform
		makeok=true
	if block_column_number>platform_singleblob_startxi && block_column_number<platform_singleblob_endxi  && terrainammo==platform_singleblob_ya    ///random platform
		makeok=true
				          break;
	case "singleplatformbumpy" :
	makeok=false
	if terrainammo>=platform_startya && terrainammo <=platform_endya      ////main platform
		makeok=true
	if ( terrainammo==platform_endya+1  && random(1)>0.8 ) || ( terrainammo==platform_startya-1 && random(1)>0.4 )    ///bumps   (more smooth on bottom)
		makeok=true
	if block_column_number>platform_singleblob_startxi && block_column_number<platform_singleblob_endxi  && terrainammo==platform_singleblob_ya     ///random platform
		makeok=true
				          break;  
	case "lplatform" :
	makeok=false
            
	if terrainammo<5 || (lplatform_on_right && block_column_number<lplatform_xi) || (!lplatform_on_right && block_column_number>lplatform_xi)    ///lplatform
		makeok=true
	if block_column_number>platform_singleblob_startxi && block_column_number<platform_singleblob_endxi  && terrainammo==platform_singleblob_ya     ///random platform
		makeok=true
				          break;         
	case "lplatformbumpy" :
	makeok=false
            
	if terrainammo<5 || (lplatform_on_right && block_column_number<lplatform_xi) || (!lplatform_on_right && block_column_number>lplatform_xi)    ///lplatform
		makeok=true
	if terrainammo==6 && irandom(1)>0.4
		makeok=true   //true
	if block_column_number>platform_singleblob_startxi && block_column_number<platform_singleblob_endxi  && terrainammo==platform_singleblob_ya     ///random platform
		makeok=true
				          break;            
                
	case "pyramid" :
	makeok=false
	if block_column_number>terrainammo && block_column_number<(numberofblocks_horizontal)-terrainammo
		makeok=true
	if terrainammo>terrain_pyramid_plateau_y
		makeok=false
	if terrainammo==0 || terrainammo==1 || terrainammo==2
		makeok=true                 break;
                
                
	case "waves":
	if terrain_wave_xup[block_column_number]==false
		makeok=false
	var waveno;
	waveno=floor(   (block_column_number*aizen.bw)/(kouchou.rw/6))
	//show_message(string(waveno))
	if terrainammo>=terrain_wave_ha[waveno]
		makeok=false
	if terrainammo<=terrain_wave_ylim
		makeok=true                 break;
                
	case "doublewaves":
	if terrain_wave_xup[block_column_number]==false || terrain_wave_xup[min(block_column_number+1,floor(numberofblocks_horizontal))]==false        ///if not on or next to wave point, don't make wave   (waves are 2 thick)
		makeok=false
	var waveno;
		waveno=floor(   (block_column_number*aizen.bw)/(kouchou.rw/6))
	if terrainammo>=terrain_wave_ha[waveno]   ///errored here with 0 as waveno?
		makeok=false
	if terrainammo<=terrain_wave_ylim
		makeok=true                 break;                
                
	case "blobs" :
	makeok=false
	for (ii=0; ii<terrain_blob_number; ii+=1)
	{
		if (block_column_number*aizen.bw)+kouchou.room_left_border_x>= terrain_blob_xl[ii] && (block_column_number*aizen.bw)+kouchou.room_left_border_x<= terrain_blob_xr[ii] && terrainammo >= terrain_blob_yu[ii] && terrainammo <= terrain_blob_yd[ii]
		{
			makeok=true
		}
	};
	if terrainammo==terrain_blob_line1y ||  terrainammo==terrain_blob_line2y 
	makeok=true                 break;
                
	case "sidesteps":
	if steps_on_right
	{
		if block_column_number>sidesteps_start_i+terrainammo*2
			makeok=false
	}
	else
	{
		if block_column_number<sidesteps_start_i-terrainammo*2
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
			if block_column_number>=secretbox_xistart && block_column_number<=secretbox_xifinish && terrainammo>1 && terrainammo<9   ///box boundaries
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
		if block_column_number < secretbox_platforms_startxi
		{
			makeok=true
			if block_column_number>=secretbox_xistart && block_column_number<=secretbox_xifinish && terrainammo>1 && terrainammo<9   ///box boundaries
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

return makeok