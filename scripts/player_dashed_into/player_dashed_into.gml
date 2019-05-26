var stun_amount,hknockback,vknockback,airmulti,airvmulti,aircheck1;
stun_amount=argument0   ///time to be stunned
hknockback=argument1   ///knockback hspeed
vknockback=argument2
airmulti=1 //multiplier when getting combod
airvmulti=1
aircheck1=false


var pusher,pushee;
pusher=other.creator
pushee=self.id


if other.bunts==true
{
    if groundcheck==noone  //get hit twice as much if they're in the air
    {
        airmulti=1.75
        airvmulti=1.35
        stun_amount=22
    }
    
    if other.direction==0
        hspd=hknockback*airmulti
    if other.direction==180
        hspd=-hknockback*airmulti
    
    vspd=-vknockback*airvmulti
    STUNNED=stun_amount
    if !place_meeting(x,y-1,block)
        y-=1

}

if other.stops_dasher_on_contact==true                  ////if stop_dasher_on_contact is true, 'stops' player
{
    with pusher
    {
        if hspd>3
            hspd=3
        else if hspd<-3
            hspd=-3
        vspd=vspd/1.5
    }
}
    
other.hit[P]=true

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// TEST FOR CLASH
var clasher;
clasher=-1
if instance_exists(dashclasher)  ///unnecessary
{
    with dashclasher
    {
        if gothit==pusher
            clasher=self.id
    }
}        

if clasher==-1    ///if no clash object exists created by pusher, create one with direction equal to pushee direction
{
    var a;
    a=instance_create(x,y,dashclasher)
    a.gothit=pushee
    a.direction=pushee.direction
}
else    /// if clash object exists created by pusher, clash, deleting clash object and dash objects                ///////////////CLASH
{
    if other.direction==180
        clasher.gothit.hspd=hknockback*airmulti
    else
        clasher.gothit.hspd=-hknockback*airmulti
    clasher.gothit.vspd=-vknockback*airvmulti
    clasher.gothit.STUNNED=stun_amount
    effect_create_above(ef_firework,x,y,2,c_green)
    with clasher
        instance_destroy()
    with dashattack
    {
        if creator==pusher || creator==pushee
        {
            instance_destroy()
        }
    }
}        
