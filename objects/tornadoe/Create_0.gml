alarm[0]=35   ///become active alarm
alarm[1]=990   //destroy alarm


hspd=1.25

active=true
repeat_effects_factor=1  //number of times to loop effects, doubles effects when active
WIDTH=300
TOTAL_HEIGHT=700
height=50   ///distance from top of tornado to death line
height_delta_counter=0
effect_line_y=0   ///death line
MAX_GROWTH_DEPTH=600
grow_rate=0.5
SPIRAL_EFFECT_HEIGHT=125 ///height of sprite spiralpower_base
TUNNEL_EFFECT_WIDTH=74   ///width of sprite tunnel_effect1
pushed_speed=7
min_speed=2
dir=90
type="funnel"

x=kouchou.room_x_halfway
y=kouchou.room_top_border_y+TOTAL_HEIGHT//+((kouchou.rh/4)*3)+400


//[finaledit] if doesn't scroll, make tunnel a lot less tall (wasted effects)

