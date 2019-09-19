uniques_phase_counter=0
sprites[? "idle"]=Slinger_3H_idle
sprites[? "idle_u"]=Slinger_3H_idle
sprites[? "run"]=Slinger_3H_run
sprites[? "run_u"]=Slinger_3H_run
if sprite_index==Slinger_3H_idle_phase
	sprite_index=Slinger_3H_idle
else if sprite_index==Slinger_3H_run_phase
	sprite_index=Slinger_3H_idle
uniques_phase_target=noone