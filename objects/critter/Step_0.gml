if movement=="walk" && y<2000
    grav(16)

if hspd>0
{
    repeat(hspd)
    {
        if !place_meeting(x+1,y,block)
            x+=1
        else
        {
            hspd=0
            break;
        }
    }
}
else if hspd<0
{
    repeat(abs(hspd))
    {
        if !place_meeting(x-1,y,block)
            x-=1
        else
        {
            hspd=0
            break;
        }
    }
}

