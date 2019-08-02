uniques_phase_counter=UNIQUES_SLINGER_TIME_IN_PHASE
sprites[0]=Slinger_3H_idle_phase
sprites[9]=Slinger_3H_idle_phase
sprites[1]=Slinger_3H_run_phase
sprites[8]=Slinger_3H_run_phase
if sprite_index==Slinger_3H_idle
	sprite_index=Slinger_3H_idle_phase
else if sprite_index==Slinger_3H_run
	sprite_index=Slinger_3H_idle_phase
