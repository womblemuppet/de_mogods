horizon_1_start=400+kouchou.room_top_border_y
horizon_2_start=775+kouchou.room_top_border_y
horizon_1=horizon_1_start   ///sky meets sea
horizon_2=horizon_2_start   ///sea meets ground

rain_on=false
rain_offset=0
RAIN_OFFSET_MAX=275
TORNADO_RAIN_TILE_SIZE=275

rain_make_block_effect_counter=0
RAIN_MAKE_BLOCK_EFFECT_COUNTER_MAX=10


convergence=7000

if kouchou.map=="multiplayer"
{
    hue=127//150 //140 good bluec
    huewant=hue
    hue_goup=true
    skysat=127//100 //142  //194
    skyval=127//220 //173  //119
}
else if kouchou.map=="firetrial"
{
    hue=18 
    huewant=hue
    hue_goup=true
    skysat=142  //194
    skyval=173  //119
}
else if kouchou.map=="icetrial"
{
    hue=230 
    huewant=hue
    hue_goup=true
    skysat=102  //194
    skyval=173  //119
}
else if kouchou.map=="stormtrial"
{
    hue=148 
    huewant=hue
    hue_goup=true
    skysat=170  //194
    skyval=173  //119
}
topcol=make_colour_hsv(hue,skysat,skyval)  
botcol=make_colour_hsv(hue+5,skysat+7,skyval+7)  
    
    
/*
topsea=c_navy   ///top of sea colour
botsea=c_aqua   ///bottom of sea colour
*/

topground=make_colour_hsv(30,105,141)  //top of ground colour
botground=make_colour_hsv(38,66,141) //bottom of ground colour
image_speed=0.04  ///sea sparkle speed


/* */
/*  */
