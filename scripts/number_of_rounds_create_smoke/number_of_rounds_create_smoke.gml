

var a;
a=create_menupart_generic(rch_smoke1,0,smokepos+50-random(100),room_height,0,number_of_rounds_smoke_step_event)
a.vspd=choose(-1,-3)
a.mode="normal"


smokepos+=SMOKE_X_GAP
if smokepos>room_width
	smokepos-=(room_width+SMOKE_X_GAP)


return a