x=kouchou.room_left_border_x
y=kouchou.room_top_border_y


log=ds_list_create()
log_pos=0
log_pos_last=0
HISTORY_MAX_NUMBER_OF_LINES=8
WIDTH=700
HISTORY_X_OFFSET=250

vgap=20
yoffset=35
input_yoffset=10

input_pos_y_offset=yoffset+(HISTORY_MAX_NUMBER_OF_LINES-1)*vgap+input_yoffset
MAXY=input_pos_y_offset+16

BACK_COLOUR=make_colour_rgb(29, 82, 81)