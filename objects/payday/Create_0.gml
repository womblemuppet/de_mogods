for (var i=kouchou.room_left_border_x; i<kouchou.rw/220; i+=1)
{
    instance_create(150+i*180,0-150*(i mod 2),coin)
    
};
alarm[1]=500   //payday times out, winner is chosen
makeitrain=true
image_speed=0.15
purse[3]=0
purse[0]=0
purse[1]=0
purse[2]=0
screenflash(make_colour_rgb(207,181,59),0.2,0,4)
aizen.hothandspaydaycolour=c_yellow

