for (var i=0; i<30; i+=1)
{
    fallamount[i]=0
    repeat(24)
    {
        if !place_meeting(i*40,fallamount[i]*40,block)
            fallamount[i]+=1
        else
            break;    
    }
};

