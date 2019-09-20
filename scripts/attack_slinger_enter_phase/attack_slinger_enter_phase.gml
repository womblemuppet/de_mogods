/////////////////////////////////////////////////////
///  	attack_slinger_enter_phase(target)
/////////////////////////////////////////////////////

//var current_sprite,current_image_index;
//current_sprite=sprite_index
//current_image_index=image_index
player_flush_lockdowns();
//sprite_index=current_sprite
//image_index=current_image_index

uniques_phase_counter=UNIQUES_SLINGER_TIME_IN_PHASE
sprites[? "idle"]=Slinger_3H_idle_phase
sprites[? "idle_u"]=Slinger_3H_idle_phase
sprites[? "run"]=Slinger_3H_run_phase
sprites[? "run_u"]=Slinger_3H_run_phase
if sprite_index==Slinger_3H_idle
	sprite_index=Slinger_3H_idle_phase
else if sprite_index==Slinger_3H_run
	sprite_index=Slinger_3H_idle_phase
iframes=1000
uniques_phase_target=argument0