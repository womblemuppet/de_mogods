/***************************************************
  grav(max vspd)
  for generic objects' gravity (not player)
  call in step event
****************************************************/


if !place_meeting(x,y+1,block)    ///if nothing below you
{
    vspd+=1   ///gravity    
    if vspd>0 ////then if falling
    {
        repeat(vspd)
        {
            if !place_meeting(x,y+1,block)
            {
                y+=1  ///fall movement
            }
            else
                break;
        }
    }
}
else
{ 
    if vspd>0           ///if falling
    {
        vspd=0           ////if something is below you, stop falling
    }
    else if vspd<0      ///else if rising
    {        
        if place_meeting(x,y-1,block)    ///if something above you, move up and collide
        {
            y-=1
            vspd=1
        }
    }
}   


if vspd>argument0
    vspd=argument0
if vspd<-18
    vspd=-18
    
if y>15000
    show_error(object_get_name(self.id)+"dropped off map.",true)
