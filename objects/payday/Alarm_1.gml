with coin
    fade=true

var highest,winning,tie;
tie=0
highest=0
winning=-1

for (i=0; i<4; i+=1)
{
   // show_message(string(highest)+" is the highest value, contested by "+string(i)+" with "+string(purse[i]))
    if purse[i]>highest
    {
        winning=i
        highest=purse[i]

    }
};
if winning!=-1
{
    for (i=0; i<3; i+=1)
    {
        if purse[i]==purse[winning]
        {
            tie+=1
        }
    };
    if tie<2 
    {
        screenflash(make_colour_rgb(207,181,59),0.3,0,8)
        with player
        {
            if P==winning       
            {     
                sidezap=true
            }
        }
    }
}

makeitrain=false
/*show_message("winning: "+string(winning))
show_message("purse[winning]: "+string(purse[winning]))
show_message("tie: "+string(tie))*/



alarm[2]=130   ///payday dies, call next in stack


/* */
/*  */
