if mode==0 && speed==0
{
    if !instance_exists(targ)
    {
       instance_destroy()
       exit
    }

    if targ.y>round(y/16)*16+aizen.travelled mod 4
        y+=1
    if targ.y<round(y/16)*16+aizen.travelled mod 4
        y-=1
}



