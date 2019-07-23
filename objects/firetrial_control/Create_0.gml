
WAVETIMER=650
STARTTIME=300

wavecounter=1
numberofclingys=1

redlumpwidth=615  //(-1)
redlumpheight=251  //(+1)



lavacounter=0   ///counter for creating constant stream of lava objs horizontally
LAVARISEN=room_height-redlumpheight
LAVAFALLEN=room_height+20
lavalevel=LAVAFALLEN+50
lavaUP=true
meteorlevel=0
for (var i=-1; i<room_width/redlumpwidth; i+=1)
{
    instance_create(i*redlumpwidth,lavalevel,bottomlava)
};


ammo=10
meteor_wave=choose(0,1)   ///0=wave to right 1=wave to left 2=freethrow
alarm[0]=STARTTIME  ///first wave of meteors, no clingys

alarm[1]=WAVETIMER+STARTTIME



