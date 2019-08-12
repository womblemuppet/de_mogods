log=ds_list_create()
log_pos=0
log_pos_last=0
HISTORY_MAX_NUMBER_OF_LINES=8
WIDTH=700


vgap=20
yoffset=35
input_yoffset=10


input_pos_y=yoffset+(HISTORY_MAX_NUMBER_OF_LINES-1)*vgap+input_yoffset
MAXY=input_pos_y+16
x=kouchou.room_left_border_x+200
y=kouchou.room_top_border_y