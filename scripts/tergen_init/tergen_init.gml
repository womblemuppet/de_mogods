
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                ////////////////////////////////////////////////////////////////////////// TERGEN ////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


///[finaledit] some of these might be obsolete


terrain_buffer_layer_newest=[]
terrain_buffer_layer2=[]
terrain_buffer_layer3=[]
for (i = 0; i < (kouchou.rw/bw); i++)
{
	terrain_buffer_layer_newest[i]=-2
	terrain_buffer_layer2[i]=-2
	terrain_buffer_layer3[i]=-2
}


lightingcolourmap=ds_map_create()
lightingalphamap=ds_map_create()
ds_map_add(lightingcolourmap,"summit",c_white)
ds_map_add(lightingalphamap,"summit",1)
ds_map_add(lightingcolourmap,"sand",c_yellow)
ds_map_add(lightingalphamap,"sand",0.05)
ds_map_add(lightingcolourmap,"cave",c_black)
ds_map_add(lightingalphamap,"cave",0.2)
ds_map_add(lightingcolourmap,"forest",c_black)
ds_map_add(lightingalphamap,"forest",0.075)

lightingtravelledmarks=ds_list_create()
lightingtravelledbiome=ds_list_create()
mountainscrolllevel=biome_length*3+CREATIONDELAY-1000
cavelevel=biome_length*3+CREATIONDELAY+200
mountainlevel=biome_length*2+CREATIONDELAY-4400

terraintype=chunkery_chunk_type[? chunk_type]    ///type of chunk being created
terrain_ammo=5      /// number of rows left on current chunk

pitlist=ds_list_create()  //where the pits are
rectx1=0                  //rectangle and reverse rectangle bounds
rectx2=1200             ////
terrain_pyramid_plateau_y=3

terrain_wave_ha[5]=0   //// cutoff at top for waves
terrain_wave_ha[0]=0
terrain_wave_ha[1]=0
terrain_wave_ha[2]=0
terrain_wave_ha[3]=0
terrain_wave_ha[4]=0

terrain_wave_xup[kouchou.rw/aizen.bw]=false   ///array that stores whether there is a wave at that x pos or not
for (var i=0; i<kouchou.rw/aizen.bw; i+=1)
{
	terrain_wave_xup[kouchou.rw/aizen.bw]=false
};
terrain_wave_ylim=choose(2,3,4)  ///bottom line that connects waves  (based on terrain_ammo)

terrain_blob_number=10    ////number of blobs
terrain_blob_xl[10]=0    //// coordinates of each blob 
terrain_blob_xr[10]=0
terrain_blob_yu[10]=0
terrain_blob_yd[10]=0
terrain_blob_line1y=choose(7,8,9)   ///based on terrain_ammo
terrain_blob_line2y=choose(0,1,2)

steps_on_right=true   ////whether steps appear on the right or left

chambers_y[4]=0          ////up to 5 chamber ammo-y positions are set
chambers_y[0]=0
chambers_y[1]=0
chambers_y[2]=0
chambers_y[3]=0
chambers_central_pillar=0  ///x position of central pillar in chambers

secretbox_on_right=true   ///whether secret box is on right or left
secretbox_xistart=4         ///x start and end of the secret box
secretbox_xifinish=8
secretbox_platforms_startxi=20    ///the 1/2way x line between the platforms and boxed area

lplatform_on_right=true
lplatform_xi=10




biomeswitch=false        ///true when changing biomes

///these are default values for the first created chunk as set below it
rectx1=round(random(kouchou.rw/2)/aizen.bw)*aizen.bw
rectx2=round(random(kouchou.rw/2)/aizen.bw)*aizen.bw+kouchou.room_x_halfway
platform_startya=3
platform_endya=4
platform_singleblob_startxi=irandom(floor(kouchou.rw/aizen.bw)-6)      ///defines a potential single blob (doesn't get created if ya =-1)
platform_singleblob_endxi=platform_singleblob_startxi+irandom(5)
platform_singleblob_ya=choose(-1,-1,-1,-1,1,2,3,4,5)
