/////////////////////////////////////////////////////
///  	attack_slinger_enter_phase(target)
/////////////////////////////////////////////////////

var phase_target;
phase_target=argument0

uniques_phase_counter=UNIQUES_SLINGER_TIME_IN_PHASE


///change idle and running sprites to phase versions
sprites[? "idle"]=Slinger_3H_idle_phase
sprites[? "idle_holding"]=Slinger_3H_idle_phase_holding
sprites[? "idle_u"]=Slinger_U_idle_phase
sprites[? "idle_u_holding"]=Slinger_U_idle_phase_holding
sprites[? "run"]=Slinger_3H_run_phase
sprites[? "run_holding"]=Slinger_3H_run_phase_holding
sprites[? "run_u"]=Slinger_U_run_phase
sprites[? "run_u_holding"]=Slinger_U_run_phase_holding


//update current sprite to phase version if possible
if sprite_index==Slinger_3H_idle
	sprite_index=Slinger_3H_idle_phase
else if sprite_index==Slinger_3H_run
	sprite_index=Slinger_3H_idle_phase
else if sprite_index==Slinger_3H_idle_holding
	sprite_index=Slinger_3H_idle_phase_holding
else if sprite_index==Slinger_3H_run_holding
	sprite_index=Slinger_3H_idle_phase_holding


uniques_phase_target=phase_target