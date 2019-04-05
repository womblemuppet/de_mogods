

WIDTH=900
HEIGHT=800
x=room_width/2
y=room_height/2
xx=room_width/2-WIDTH/2
yy=room_height/2-HEIGHT/2

select=0
SELECTMAX=2
/***************************************************
  select

0  -  resume  
1  -  command list
2  -  exit to menu
  

10 - in command list
****************************************************/
select_menu_text[SELECTMAX]=""
select_menu_text[0]="Resume game"
select_menu_text[1]="Combat techniques list"
select_menu_text[2]="Exit to menu"



commandlist_select=0

box_highlightcolour[0]=c_silver
box_normiecolour[0]=c_dkgray
box_highlightcolour[1]=c_blue
box_normiecolour[1]=c_navy
box_highlightcolour[2]=c_fuchsia
box_normiecolour[2]=c_purple

commands_list=ds_list_create() /// in future needs to collect from player
commands_list_properties=ds_list_create()
commands_list_properties2=ds_list_create()
commands_list_conditions=ds_list_create()
commands_list_boxtype=ds_list_create()


ds_list_add(commands_list,"upper cut")
ds_list_add(commands_list_properties,-1)
ds_list_add(commands_list_properties2,-1)
ds_list_add(commands_list_conditions,"")
ds_list_add(commands_list_boxtype,0)

ds_list_add(commands_list,"falcon punch (holdable)")
ds_list_add(commands_list_properties,1)
ds_list_add(commands_list_properties2,2)
ds_list_add(commands_list_conditions,"")
ds_list_add(commands_list_boxtype,0)

ds_list_add(commands_list,"dash")
ds_list_add(commands_list_properties,-1)
ds_list_add(commands_list_properties2,-1)
ds_list_add(commands_list_conditions,"")
ds_list_add(commands_list_boxtype,0)

ds_list_add(commands_list,"air dash")
ds_list_add(commands_list_properties,-1)
ds_list_add(commands_list_properties2,-1)
ds_list_add(commands_list_conditions,"when airbourne")
ds_list_add(commands_list_boxtype,1)

ds_list_add(commands_list,"ground pound")
ds_list_add(commands_list_properties,-1)
ds_list_add(commands_list_properties2,-1)
ds_list_add(commands_list_conditions,"when airbourne")
ds_list_add(commands_list_boxtype,1)

ds_list_add(commands_list,"air grab")
ds_list_add(commands_list_properties,0)
ds_list_add(commands_list_properties2,-1)
ds_list_add(commands_list_conditions,"when airbourne")
ds_list_add(commands_list_boxtype,1)

ds_list_add(commands_list,"pocket orb")
ds_list_add(commands_list_properties,-1)
ds_list_add(commands_list_properties2,-1)
ds_list_add(commands_list_conditions,"")
ds_list_add(commands_list_boxtype,2)









/* */
/*  */
