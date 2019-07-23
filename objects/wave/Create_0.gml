image_alpha=0.6
image_speed=0.15
frozen=false

if ds_list_size(aizen.STACK)==0  ////if last one
{
    with freakyfishtime   /// cancel stack calling by FFT
    {
        //show_message("wave create event, last on stack so stopping alarm[0](stack caller), number="+string(myfft))    
        alarm[0]=-1
        for (var i=0; i<13; i+=1)
        {
            timer[i]=-1
        }
        
    }
}

