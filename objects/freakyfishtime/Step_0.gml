if mode==0
{
    var lowest,lowesty;
    lowest=noone
    lowesty=-100
    
    with player
    {
        if y>freakyfishtime.y-50 && y>=lowesty
        {
            if y>lowesty || (y==lowesty && choose(0,1)==1)  //[finaledit] untested...
            {
                lowest=self.id
                lowesty=y
            }
            
        }   
    }
    if lowest!=noone
    {
        with lowest
        {
            var a;
            a=instance_create(x,y,coco)
            a.owner=self.id
        }
        aizen.alarm[6]=1         
        mode=1
        visible=false
        
    }
}

for (i=0; i<13; i+=1)
{
    if timer[i]>-1
        timer[i]-=1
    if timer[i]==0
    {
        STACK_call_next()
        //show_message("(in step) alarm event!!!!. mynumber="+string(myfft))
    }
};


