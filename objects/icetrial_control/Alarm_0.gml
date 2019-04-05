    // ice box before spikes


D=choose(90,270)
if wavecount>2
    D=choose(0,90,180,270)

for (i=0; i<room_width/40; i+=1)
{
    spawn_ice_block(i*40,0)
};
for (i=0; i<room_width/40; i+=1)
{
    spawn_ice_block(i*40,room_height-40)
};
for (i=1; i<(room_height/40)-1; i+=1)
{
    spawn_ice_block(0,i*40)
};
for (i=1; i<(room_height/40)-1; i+=1)
{
    spawn_ice_block(room_width-40,i*40)
};

var moved;
moved=false

if !instance_exists(player)
{
    if player.x<50
    {
        moved=true
        player.x=50
    }
    if player.x>room_width-50
    {
        moved=true
        player.x=room_width-50
    }
    if player.y<50
    {
        moved=true
        player.y=50
    }
    if player.y>room_height-90
    {
        moved=true
        player.y=room_height-90
    }
}


if moved
{    
    var fuse;
    fuse=0
    
    while (fuse<50)   //this loop sucks
    {
        with player
        {
            with collision_circle(x,y,75,block,false,true)
            {
                if object_index!=ice_block
                    instance_destroy()
            }
            if collision_circle(x,y,75,block,false,true)==noone
                fuse+=50
        }
        fuse+=1    
    }
}
alarm[1]=150

