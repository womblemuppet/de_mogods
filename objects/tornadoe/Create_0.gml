alarm[0]=35   ///become active alarm
alarm[1]=990   //destroy alarm

x=kouchou.room_x_halfway
y=kouchou.room_top_border_y+((kouchou.rh/5)*4)+400

x=kouchou.room_left_border_x   //TEST
hspd=1.25                                   //TEST

active=true
repeat_effects_factor=1  //number of times to loop effects, doubles effects when active
WIDTH=300
TOTAL_HEIGHT=1200
height=300
height_delta_counter=0
effect_line_y=0
MAX_GROWTH_DEPTH=900
grow_rate=0.5
SPIRAL_EFFECT_HEIGHT=125 ///height of sprite spiralpower_base
TUNNEL_EFFECT_WIDTH=74   ///width of sprite tunnel_effect1
pushed_speed=7
min_speed=2
dir=90
type="funnel"



//[finaledit] if doesn't scroll, make tunnel a lot less tall (wasted effects)

