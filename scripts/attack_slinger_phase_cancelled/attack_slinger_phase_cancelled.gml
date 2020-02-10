/////////////////////////////////////////////////////
///  	attack_slinger_phase_cancelled()
/////////////////////////////////////////////////////

uniques_phase_counter=0

///revert idle and running sprites back to normal versions
sprites[? "idle"]=Slinger_3H_idle
sprites[? "idle_holding"]=Slinger_3H_idle_holding
sprites[? "idle_u"]=Slinger_U_idle
sprites[? "idle_u_holding"]=Slinger_U_idle_holding
sprites[? "run"]=Slinger_3H_run
sprites[? "run_holding"]=Slinger_3H_run_holding
sprites[? "run_u"]=Slinger_U_run
sprites[? "run_u_holding"]=Slinger_U_run_holding


//update current sprite to non-phase version if possible
if sprite_index==Slinger_3H_idle_phase
	sprite_index=Slinger_3H_idle
else if sprite_index==Slinger_3H_run_phase
	sprite_index=Slinger_3H_idle
else if sprite_index==Slinger_3H_idle_phase_holding
	sprite_index=Slinger_3H_idle_holding
else if sprite_index==Slinger_3H_run_phase_holding
	sprite_index=Slinger_3H_idle_holding
	
uniques_phase_target=noone