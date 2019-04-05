/// @description [finaledit] could be optimized
if image_alpha<target_alpha
    image_alpha+=0.005
if image_alpha>target_alpha
    image_alpha-=0.005
colour=merge_colour(colour,target_colour,0.1)

if start==true
{
    if image_alpha>0
        image_alpha-=0.0175
    else
    {
        image_alpha=0
        start=false        
    }
}

