if wontcollide_counter>0
{
    wontcollide_counter-=1
    if wontcollide_counter==0
    {
        if place_meeting(x,y,block)
            mode=2
        else
            mode=1        
    }
}

var vspd,triggered;
vspd=6
triggered=false

if place_meeting(x,y+vspd,block) 
{
    if mode==1
        triggered=true      
}
else
{
    if mode==2
        mode=1
}

if place_meeting(x,y+vspd,player)
{
    var a;
    a=instance_place(x,y+vspd,player)
    if a!=undefined && a!=noone && a==-1
    {
        if a.creator!=creator
            triggered=true
    }
        
    
}
if triggered
{
    var a;
    a=attack_create_hitbox(25,1,false,false,false,"clusterbomb",vet_clusterbomb_firesprite,0.25,99,0,-6)
    a.creator=creator
    effect_aniend(vet_clusterbomb_firesprite,0.25,-2)
    instance_destroy()
    exit
}

y+=vspd    ////vspd




