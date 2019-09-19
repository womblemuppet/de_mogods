life=60
speed=9
die_sprite=ooga_ultimate_groundpound_shockwave_die
show_debug_message("shockwave create event! speed ="+string(speed))

hit_collector=noone

if aizen.debug_show_hitboxes
{
	visible=true;
	depth=-4
}

///OVERRIDE: do not inherit, will reset hit values to true