alarm[10]=400



if mode!=0
    exit



///////////////////////////////////////////////////////////////////////////////////
////////////////////////             spawn volcs     //////////////////////////////
///////////////////////////////////////////////////////////////////////////////////

if kouchou.map=="multiplayer"
{
    if mode==0    ///normal state
    {       
        var n;
        n=instance_number(orbb)+instance_number(instrument)
        
        if n<1
            spawn_instrument()
        if peacetime>1100
        {
            if n<4
            {
                    spawn_instrument()
            }
        }
    }   
}    



    


