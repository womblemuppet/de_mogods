/***************************************************
  p_move(direction code)
  
***************************************************/

var dx,dy;
dx=find_dx(argument0)
dy=find_dy(argument0)

aimD=argument0*90



if !player_checkkey(ky(rv(argument0))) && !player_checkkey(ky(tl(argument0))) && !player_checkkey(ky(tr(argument0)))   //if not pressing any other keys, this movement is "first down"
    firstdown=argument0
if ((player_checkkey(ky(tl(argument0))) && !place_meeting(basex+find_dx(tl(argument0)),basey+find_dy(tl(argument0)),OVERWORLD_SOLID)) || (player_checkkey(ky(tr(argument0))) && !place_meeting(basex+find_dx(tr(argument0)),basey+find_dy(tr(argument0)),OVERWORLD_SOLID))) && firstdown==argument0  //if you are turning L or R while this key is already down and can turn, turn instead of staying in same direction
    exit
if firstdown==rv(argument0) //don't allow moving in reverse direction and this direction at same time
    exit
if moveq!=-1  
    exit

if timer<timerLEEWAY  //allow canceling of movement into another movement if under the leeway time
{
    if !place_meeting(basex+dx,basey+dy,OVERWORLD_SOLID) && (!(place_meeting(basex+dx,basey+dy,denizen)) || (place_meeting(x,y,denizen)) )//&& basex mod 24==0 && basey mod 24==0) // && cantcancel==false
    {
        if (moveD==tl(argument0) || moveD==tr(argument0) || moveD==-1)  //if not from reverse direction, reset base and set direction
        {
            x=basex //reset base and turn direction (move cancel)
            y=basey
            timer=0
            if moveD==tl(argument0) ||moveD==tr(argument0)
                timer=timerLEEWAY
        }     
        if moveD==rv(argument0) || (x==basex && y==basey)            /// if from reverse direction or on base, swap direction 
            moveD=argument0
    }
}
playermove()

