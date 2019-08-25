room=gameroom


global.fft=1   ///testing variable for flood orb parents



to_draw=ds_list_create()     ////list of block ids to be drawn in draw_blocks_and_fossils during draw event
to_draw_size=0
will_update_blocks_to_draw_list=false

call_a_block_has_been_destroyed=false
destroy_proximity_coods_x=ds_list_create()
destroy_proximity_coods_y=ds_list_create()


surface_redraw_counter=0   ///counter for SURFACE_REDRAW_INTERVAL
SURFACE_REDRAW_INTERVAL=400  ///surface will be redrawn every x travelled
fossil_surface=surface_create(kouchou.rw,kouchou.rh+SURFACE_REDRAW_INTERVAL)   ///fossil surface  (has extra height past the viewable height as a buffer)
fossil_surface_redraw_needed=false


STACK=ds_list_create() //not a stack. but, the stack. hence the caps. oh well.
STACK_SHITCALL_NUMBER=3  /// [finaledit] probably can delete this variable
last_stack_sprite=-1
debug_show_hitboxes=false
debug=false
bloodmoon_recalc_call=false

//bw=40  ///block width
//bh=40  ///block height

temp_block_grid=ds_grid_create(ceil(kouchou.rw/20),ceil(kouchou.rh/20))   ////grid for finding lowest point volcs can spawn from, filled in with 1's where blocks are.
temp_volc_spawn_possibles_list=ds_list_create()

//rename this to withindrawtimethreshold
candraw=true   ///whether 2 players dying at the same time can cause a draw. set to false on a timer after a player dies.
healthcap=5   ///max health value
bedrockcounter=0   ///counts up to block height, then terrain generation script is called. INITIALIZED BEFOREHAND IN ROOM START
biome="summit"  
biome_length=1460  //1260
biome_length_accumulative=0   


CREATIONDELAY=200
biome_schedule=ds_list_create()    ///list for which biome comes next
number_of_tergenned_lines=0
total_baseline_movement=0


ds_list_add(biome_schedule,choose("forest","sand"))
ds_list_add(biome_schedule,"cave")



travelled=0      ////total distance in pixels that the screen has scrolled down

mode=0          //// normal, about to shitcall, or shitcalling

/***************************************************
  0=normal
  1=space just pushed (shit about to happen)
  2=shit happening
****************************************************/
peacetime=0
first_blood_status="none"  //"none" no fb yet - counting down peacetime, "occurred" player first blood hit, "timedout" ground has been zapped
first_blood_neutral_cooldown=0
first_blood_neutral_queued=false

image_speed=0.15

screenshake_amount=4
screenshake_ammo=8
screenshake_D=0 /// -1, 0 1
screenshake_speed=5

vscreenshake_amount=4
vscreenshake_ammo=8
vscreenshake_D=0 /// -1, 0 1
vscreenshake_speed=5

top_of_screen_warning_subimage=0

hothandspaydaycolour=c_white






//hud_pocket_circle_orb_lost
stackframe_sprite=arcade_cabinet_maskbar_inactive
stackframe_subimage=0
stackframe_image_number=0

lastplayerx=0
scoer=0

pausescreen_doubletap_counter=0

pausescreen_requester_id=-4

BLOCK_DESTRUCTION_FIDELITY=5

//[future] variable that adds to round cd timer when player takes dmg or after large amount of meteors

/*
IMGSPEED_AMBIENT //slowish, should be able to see frame by frame
//potentially have as a global frame (ratio) counter to sync everything? is that possible
IMGSPEED_IMPORTANT // different ratio to ambient
IMGSPEED_SPARKY   //double of important
*/





terrain_block_sprite_lists_init()

chunkery_init()

