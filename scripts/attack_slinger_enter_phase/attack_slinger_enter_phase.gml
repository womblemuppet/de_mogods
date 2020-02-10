/////////////////////////////////////////////////////
///  	attack_slinger_enter_phase(target)
/////////////////////////////////////////////////////

var phase_target;
phase_target=argument0

uniques_phase_counter=UNIQUES_SLINGER_TIME_IN_PHASE
sprites[? "idle"]=Slinger_3H_idle_phase
sprites[? "idle_u"]=Slinger_U_idle_phase
sprites[? "run"]=Slinger_3H_run_phase
sprites[? "run_u"]=Slinger_U_run_phase
if sprite_index==Slinger_3H_idle
	sprite_index=Slinger_3H_idle_phase
else if sprite_index==Slinger_3H_run
	sprite_index=Slinger_3H_idle_phase

uniques_phase_target=phase_target