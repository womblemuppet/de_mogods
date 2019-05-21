room=gameroom

global.fft=1   ///testing variable for flood orb parents

to_draw=ds_list_create()
will_update_blocks_to_draw_list=false

surface_redraw_counter=0   ///counter for SURFACE_REDRAW_EVERY
SURFACE_REDRAW_EVERY=400  ///surface will be redrawn every x travelled
fossil_surface=surface_create(kouchou.rw,kouchou.rh+SURFACE_REDRAW_EVERY)   ///fossil surface  (has extra height past the viewable height as a buffer)
fossil_surface_redraw_needed=false


STACK=ds_list_create() //not a stack. but, the stack. hence the caps. oh well.
STACK_SHITCALL_NUMBER=3  /// [finaledit] probably can delete this variable
last_stack_sprite=-1
debug_show_hitboxes=false
debug=false
lightning_triple_combine=false
bloodmoon_recalc_call=false

temp_block_grid=ds_grid_create(ceil(kouchou.rw/20),ceil(kouchou.rh/20))   ////grid for finding lowest point volcs can spawn from, filled in with 1's where blocks are.
temp_volc_spawn_possibles_list=ds_list_create()


candraw=true   ///whether 2 players dying at the same time can cause a draw. set to false on a timer after a player dies.
SUPER_METER_AMOUNT=12    ///meter is full after this many attacks
healthcap=5   ///max health value
bedrockcounter=0   ///counts to 40, then terrain generation script is called
biome="summit"  
biome_length=1460  //1260
biome_length_accumulative=0   

//biomelevels   1960,3160,4860,99999   

CREATIONDELAY=2400   //// complicated shit don't touch if you can help it

biome_schedule=ds_list_create()    ///list for which biome comes next

ds_list_add(biome_schedule,choose("forest","sand"))
ds_list_add(biome_schedule,"cave")



/////////////



bedrock=1080
travelled=0      ////total distance in pixels that the screen has scrolled down
mode=0          //// normal, about to shitcall, or shitcalling

/***************************************************
  0=normal
  1=space just pushed (shit about to happen)
  2=shit happening
****************************************************/
peacetime=0

image_speed=0.15
shitcalltickercd=5

screenshake_amount=4
screenshake_ammo=8
screenshake_D=0 /// -1, 0 1
screenshake_speed=5

vscreenshake_amount=4
vscreenshake_ammo=8
vscreenshake_D=0 /// -1, 0 1
vscreenshake_speed=5

warning_subimage=0  //ticks in step event
hothandspaydaycolour=c_white

hudfloatingmasks_subimage=0
HUDFLOATINGMASKS_IMAGE_NUMBER=22

stackframe_sprite=arcade_cabinet_maskbar_inactive
stackframe_subimage=0
stackframe_image_number=0

lastplayerx=0
scoer=0

pausescreen_doubletap_counter=0

pausescreen_requester=-4

BLOCK_DESTRUCTION_FIDELITY=5

//[future] variable that adds to round cd timer when player takes dmg or after large amount of meteors

/*
IMGSPEED_AMBIENT //slowish, should be able to see frame by frame
//potentially have as a global frame (ratio) counter to sync everything? is that possible
IMGSPEED_IMPORTANT // different ratio to ambient
IMGSPEED_SPARKY   //double of important



/* */
/*  */


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   GUI   /////////
METER_BACKGROUND_COLOUR=make_colour_rgb(17,255,61)
METER_COLOUR=make_colour_rgb(237,255,216)


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////            biome sprite lists          ////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
BLOCK_SPRITE_SUMMIT_FULL=ds_list_create()
BLOCK_SPRITE_TEMPLE_FULL=ds_list_create()
BLOCK_SPRITE_SAND_FULL=ds_list_create()
BLOCK_SPRITE_FOREST_FULL=ds_list_create()
BLOCK_SPRITE_CAVE_FULL=ds_list_create()
BLOCK_SPRITE_GUNNY_FULL=ds_list_create()
ds_list_add(BLOCK_SPRITE_SUMMIT_FULL,grassy_full_temp,grassy1,grassy2,grassy3,grassy4,grassy5,grassy6,grassy7,grassy8,grassy9,grassy10,grassy11,grassy12,grassy13,grassy14,grassy15,grassy16)
ds_list_add(BLOCK_SPRITE_SUMMIT_FULL,grassy5_2)
ds_list_add(BLOCK_SPRITE_TEMPLE_FULL,temple_full,temple1,temple2,temple3,temple4,temple5,temple6,temple7,temple8,temple9,temple10,temple11,temple12,temple13,temple14,temple15,temple16)
ds_list_add(BLOCK_SPRITE_TEMPLE_FULL,temple5_2)
ds_list_add(BLOCK_SPRITE_SAND_FULL,sand_full,sand1,sand2,sand3,sand4,sand5,sand6,sand7,sand8,sand9,sand10,sand11,sand12,sand13,sand14,sand15,sand16)
ds_list_add(BLOCK_SPRITE_SAND_FULL,sand5_2)
ds_list_add(BLOCK_SPRITE_FOREST_FULL,forest_full,forest1,forest2,forest3,forest4,forest5,forest6,forest7,forest8,forest9,forest10,forest11,forest12,forest13,forest14,forest15,forest16)
ds_list_add(BLOCK_SPRITE_FOREST_FULL,forest5_2)
ds_list_add(BLOCK_SPRITE_CAVE_FULL,cave_full,cave1,cave2,cave3,cave4,cave5,cave6,cave7,cave8,cave9,cave10,cave11,cave12,cave13,cave14,cave15,cave16)
ds_list_add(BLOCK_SPRITE_CAVE_FULL,cave5_2)
ds_list_add(BLOCK_SPRITE_GUNNY_FULL,gunny_full,gunny1,gunny2,gunny3,gunny4,gunny5,gunny6,gunny7,gunny8,gunny9,gunny10,gunny11,gunny12,gunny13,gunny14,gunny15,gunny16)
ds_list_add(BLOCK_SPRITE_GUNNY_FULL,gunny5)
STACK_ORB_SPRITES=ds_list_create()
STACK_ORB_SPRITES_DIE=ds_list_create()
STACK_ORB_SPRITES_BIRTH=ds_list_create()
ds_list_add(STACK_ORB_SPRITES,orb_sprite2,orb_sprite4,orb_sprite7,orb_sprite8,orb_flood,tornadoe_orbsprite,moonlight_orbsprite)
ds_list_add(STACK_ORB_SPRITES_DIE,orb_sprite2_die,orb_sprite4_die,orb_sprite7_die,orb_sprite8_die,orb_flood_die,tornadoe_orbsprite_die,moonlight_orbsprite_die)
ds_list_add(STACK_ORB_SPRITES_BIRTH,orb_sprite2_spawn,orb_sprite4_spawn,orb_sprite7_spawn,orb_sprite8_spawn,orb_flood_spawn,tornadoe_orbsprite_spawn,moonlight_orbsprite_spawn)





/***************************************************
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                                                                    ------------------CHUNKERY-----------------------

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////       
***************************************************/
chunk_type="startingflat"    ///the current type of chunk
chunkery_chunk_type=ds_map_create()
chunkery_ammo_min=ds_map_create()
chunkery_ammo_max=ds_map_create()
chunkery_sprite_list=ds_map_create()
chunkery_id_of_prop_list=ds_map_create() 


    
    
    
map_of_chunk_style_pools=ds_map_create()   ///each key links to a list with the pool of chunk styles

////////////////////////////////////////////////////////////////////////////////////////// SUMMIT

list_of_chunk_styles_summit=ds_list_create()
ds_map_add(map_of_chunk_style_pools,"summit",list_of_chunk_styles_summit)
ds_list_add(list_of_chunk_styles_summit,"platgrassy","rectanglebumpygrassy","lplatformbumpygrassy","lplatformtemple","secretboxtemple","doublewavesgrassy","secretboxtemple","sidestepstemple","chamberspillartemple")



////startingflat
ds_map_add(chunkery_chunk_type,"startingflat","solidline")
ds_map_add(chunkery_sprite_list,"startingflat",BLOCK_SPRITE_SUMMIT_FULL)
ds_map_add(chunkery_ammo_min,"startingflat",7)
ds_map_add(chunkery_ammo_max,"startingflat",10)
ds_map_add(chunkery_id_of_prop_list,"startingflat",0)    
       
////platgrassy
ds_map_add(chunkery_chunk_type,"platgrassy","singleplatformbumpy")
ds_map_add(chunkery_sprite_list,"platgrassy",BLOCK_SPRITE_SUMMIT_FULL)
ds_map_add(chunkery_ammo_min,"platgrassy",6)
ds_map_add(chunkery_ammo_max,"platgrassy",10)
ds_map_add(chunkery_id_of_prop_list,"platgrassy",0)

////lplatformbumpygrassy
ds_map_add(chunkery_chunk_type,"lplatformbumpygrassy","lplatformbumpy")
ds_map_add(chunkery_sprite_list,"lplatformbumpygrassy",BLOCK_SPRITE_SUMMIT_FULL)
ds_map_add(chunkery_ammo_min,"lplatformbumpygrassy",6)
ds_map_add(chunkery_ammo_max,"lplatformbumpygrassy",8)
ds_map_add(chunkery_id_of_prop_list,"lplatformbumpygrassy",0)

////lplatformtemple
ds_map_add(chunkery_chunk_type,"lplatformtemple","lplatform")
ds_map_add(chunkery_sprite_list,"lplatformtemple",BLOCK_SPRITE_SUMMIT_FULL)
ds_map_add(chunkery_ammo_min,"lplatformtemple",6)
ds_map_add(chunkery_ammo_max,"lplatformtemple",8)
ds_map_add(chunkery_id_of_prop_list,"lplatformtemple",0)


////doublewavesgrassy
ds_map_add(chunkery_chunk_type,"doublewavesgrassy","doublewaves")
ds_map_add(chunkery_sprite_list,"doublewavesgrassy",BLOCK_SPRITE_SUMMIT_FULL)
ds_map_add(chunkery_ammo_min,"doublewavesgrassy",5)
ds_map_add(chunkery_ammo_max,"doublewavesgrassy",7)
ds_map_add(chunkery_id_of_prop_list,"doublewavesgrassy",0)

////rectanglebumpygrassy
ds_map_add(chunkery_chunk_type,"rectanglebumpygrassy","rectanglebumpy")
ds_map_add(chunkery_sprite_list,"rectanglebumpygrassy",BLOCK_SPRITE_SUMMIT_FULL)
ds_map_add(chunkery_ammo_min,"rectanglebumpygrassy",5)
ds_map_add(chunkery_ammo_max,"rectanglebumpygrassy",7)
ds_map_add(chunkery_id_of_prop_list,"rectanglebumpygrassy",0)

//sidestepstemple
ds_map_add(chunkery_chunk_type,"sidestepstemple","sidesteps")
ds_map_add(chunkery_sprite_list,"sidestepstemple",BLOCK_SPRITE_TEMPLE_FULL)
ds_map_add(chunkery_ammo_min,"sidestepstemple",5)
ds_map_add(chunkery_ammo_max,"sidestepstemple",14)
ds_map_add(chunkery_id_of_prop_list,"sidestepstemple",0)

//chamberspillartemple
ds_map_add(chunkery_chunk_type,"chamberspillartemple","chamberspillar")
ds_map_add(chunkery_sprite_list,"chamberspillartemple",BLOCK_SPRITE_TEMPLE_FULL)
ds_map_add(chunkery_ammo_min,"chamberspillartemple",4)
ds_map_add(chunkery_ammo_max,"chamberspillartemple",12)
ds_map_add(chunkery_id_of_prop_list,"chamberspillartemple",0)

//secretboxtemple
ds_map_add(chunkery_chunk_type,"secretboxtemple","secretbox")
ds_map_add(chunkery_sprite_list,"secretboxtemple",BLOCK_SPRITE_TEMPLE_FULL)
ds_map_add(chunkery_ammo_min,"secretboxtemple",9)
ds_map_add(chunkery_ammo_max,"secretboxtemple",11)
ds_map_add(chunkery_id_of_prop_list,"secretboxtemple",0)
////////////////////////////////////////////////////////////////////////////////////////// SAND


list_of_chunk_styles_sand=ds_list_create()
ds_map_add(map_of_chunk_style_pools,"sand",list_of_chunk_styles_sand)
ds_list_add(list_of_chunk_styles_sand,"sandyrectangle","sandywaves","sandylplatformbumpy","sandypits","sandydots")

////sandyrectangle
ds_map_add(chunkery_chunk_type,"sandyrectangle","rectangle")
ds_map_add(chunkery_sprite_list,"sandyrectangle",BLOCK_SPRITE_SAND_FULL)
ds_map_add(chunkery_ammo_min,"sandyrectangle",3)
ds_map_add(chunkery_ammo_max,"sandyrectangle",5)
ds_map_add(chunkery_id_of_prop_list,"sandyrectangle",0)

////sandywaves
ds_map_add(chunkery_chunk_type,"sandywaves","waves")
ds_map_add(chunkery_sprite_list,"sandywaves",BLOCK_SPRITE_SAND_FULL)
ds_map_add(chunkery_ammo_min,"sandywaves",7)
ds_map_add(chunkery_ammo_max,"sandywaves",14)
ds_map_add(chunkery_id_of_prop_list,"sandywaves",0)

////sandylplatformbumpy
ds_map_add(chunkery_chunk_type,"sandylplatformbumpy","lplatformbumpy")
ds_map_add(chunkery_sprite_list,"sandylplatformbumpy",BLOCK_SPRITE_SAND_FULL)
ds_map_add(chunkery_ammo_min,"sandylplatformbumpy",9)
ds_map_add(chunkery_ammo_max,"sandylplatformbumpy",10)
ds_map_add(chunkery_id_of_prop_list,"sandylplatformbumpy",0)

////sandypits
ds_map_add(chunkery_chunk_type,"sandypits","pits")
ds_map_add(chunkery_sprite_list,"sandypits",BLOCK_SPRITE_SAND_FULL)
ds_map_add(chunkery_ammo_min,"sandypits",3)
ds_map_add(chunkery_ammo_max,"sandypits",7)
ds_map_add(chunkery_id_of_prop_list,"sandypits",0)

//sandydots
ds_map_add(chunkery_chunk_type,"sandydots","dots")
ds_map_add(chunkery_sprite_list,"sandydots",BLOCK_SPRITE_SAND_FULL)
ds_map_add(chunkery_ammo_min,"sandydots",2)
ds_map_add(chunkery_ammo_max,"sandydots",4)
ds_map_add(chunkery_id_of_prop_list,"sandydots",0)


////////////////////////////////////////////////////////////////////////////////////////// FOREST


list_of_chunk_styles_forest=ds_list_create()
ds_map_add(map_of_chunk_style_pools,"forest",list_of_chunk_styles_forest)
ds_list_add(list_of_chunk_styles_forest,"forestpits")

////forestpits
ds_map_add(chunkery_chunk_type,"forestpits","pits")
ds_map_add(chunkery_sprite_list,"forestpits",BLOCK_SPRITE_FOREST_FULL)
ds_map_add(chunkery_ammo_min,"forestpits",4)
ds_map_add(chunkery_ammo_max,"forestpits",4)
ds_map_add(chunkery_id_of_prop_list,"forestpits",0)

////////////////////////////////////////////////////////////////////////////////////////// CAVE


list_of_chunk_styles_cave=ds_list_create()
ds_map_add(map_of_chunk_style_pools,"cave",list_of_chunk_styles_cave)
ds_list_add(list_of_chunk_styles_cave,"caveblobs")

////forestpits
ds_map_add(chunkery_chunk_type,"caveblobs","blobs")
ds_map_add(chunkery_sprite_list,"caveblobs",BLOCK_SPRITE_CAVE_FULL)
ds_map_add(chunkery_ammo_min,"caveblobs",14)
ds_map_add(chunkery_ammo_max,"caveblobs",14)
ds_map_add(chunkery_id_of_prop_list,"caveblobs",0)





/*
ds_map_add(chunkery_chunk_type,"","")
ds_map_add(chunkery_sprite_list,"","")
ds_map_add(chunkery_ammo_min,"","")
ds_map_add(chunkery_ammo_max,"","")
ds_map_add(chunkery_id_of_prop_list,"","")
*/




///[finaledit] some of these might be obsolete
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
terrainammo=5      /// number of rows left on current chunk

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

terrain_wave_xup[kouchou.rw/40]=false   ///array that stores whether there is a wave at that x pos or not
for (i=0; i<kouchou.rw/40; i+=1)
{
    terrain_wave_xup[kouchou.rw/40]=false
};
terrain_wave_ylim=choose(2,3,4)  ///bottom line that connects waves  (based on terrainammo)

terrain_blob_number=10    ////number of blobs
terrain_blob_xl[10]=0    //// coordinates of each blob 
terrain_blob_xr[10]=0
terrain_blob_yu[10]=0
terrain_blob_yd[10]=0
terrain_blob_line1y=choose(7,8,9)   ///based on terrainammo
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
rectx1=round(random(kouchou.rw/2)/40)*40
rectx2=round(random(kouchou.rw/2)/40)*40+kouchou.room_x_halfway
platform_startya=3
platform_endya=4
platform_singleblob_startxi=irandom(floor(kouchou.rw/40)-6)      ///defines a potential single blob (doesn't get created if ya =-1)
platform_singleblob_endxi=platform_singleblob_startxi+irandom(5)
platform_singleblob_ya=choose(-1,-1,-1,-1,1,2,3,4,5)
