lavacounter+=0.5
if lavacounter>=redlumpwidth
{
    lavacounter=0
    instance_create(-redlumpwidth,lavalevel,bottomlava)
}


if lavaUP==true && lavalevel>LAVARISEN
    lavalevel-=2
else if lavaUP==false && lavalevel<LAVAFALLEN
    lavalevel+=2
   
    
var laval;
laval=lavalevel
with bottomlava
    y=laval  ///this is dumb

