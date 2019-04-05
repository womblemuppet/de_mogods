var stun_amount,hknockback,vknockback;
hknockback=argument0   ///knockback hspeed
vknockback=argument1


var pusher,pushee;
pusher=other.creator
pushee=self.id



with flower
{                   
    if pusher!=owner && owner!=-1
    {
        cooldown=25          /////stop anyone picking it up for a short time
        samepersoncooldown=70
        owner=-1               ///// remove owner and stop prev owner from getting for a slightly longer time
        vspd=-24             
        timer=TIMERSTARTNUMBER      /////reset eat time
        y-=4
        shake=0                    
        sprite_index=pineapple_fall
    }
    

}
with coco                     ///////////////// transfer coco
{
    if owner==pusher && cd<1
    {
        owner=pushee
        cd=20
        passes+=1
        if passes>2
            instance_destroy()
    }  
}


if other.direction==0             //////////pushed to right
{
    hspd=hknockback
    vspd=-vknockback
}
if other.direction==180            ///////////pushed to left
{
    hspd=-hknockback
    vspd=-vknockback
}

if !place_meeting(x,y-1,block)               ////includes 1 pixel raise
    y-=1

