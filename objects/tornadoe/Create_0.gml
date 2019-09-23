alarm[0]=35   ///become active alarm
alarm[1]=990   //destroy alarm

sky.rain_on=true

sprite_index=tornado_main_spr
image_speed=0.2

hspd=1.25

active=true
repeat_effects_factor=1  //number of times to loop effects, doubles effects when active
WIDTH=150
TOTAL_HEIGHT=700
height=50   ///distance from top of tornado to death line
height_delta_counter=0
horizontal_delta_counter=0
effect_line_y=0   ///death line
MAX_GROWTH_DEPTH=600
grow_rate=0.5
block_syphon_effects_counter=0
BLOCK_SYPHON_EFFECTS_COUNTER_MAX=30

pushed_speed=7
min_speed=2
dir=90
type="funnel"

x=kouchou.room_x_halfway
y=kouchou.room_top_border_y+TOTAL_HEIGHT

make_effect_blocks=ds_list_create()


