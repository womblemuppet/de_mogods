if !frozen
{
    y-=0.65
    
    if y<2*(room_height/3)
    {
        y-=0.35
        if image_alpha<0.15
            image_alpha-=0.025
    }
    if y<140
    {
        image_alpha-=0.05
        if image_alpha<0.05 && alarm[0]==-1
            instance_destroy()
    }
}


