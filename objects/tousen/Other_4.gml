if room==theoverworld
{

    switch overworld_room
    {
	    case 0:
    
	    for (var i=0; i<room_width-40; i+=1)
	    {
	        instance_create(i*40,40,wall)
	    };
	    for (var i=0; i<room_height-40; i+=1)
	    {
	        instance_create(40,i*40,wall)
	    };
	    for (var i=0; i<room_width-40; i+=1)
	    {
	        instance_create(i*40,room_height-40,wall)
	    };
	    for (var i=0; i<room_height-40; i+=1)
	    {
	        instance_create(room_width-40,i*40,wall)
	    };    
    
	    instance_create(160,160,avatar)
    
        
	    spawn_npc(120,120,"bob",true,false)
	    spawn_npc(120,280,"fire_shrine",false,true)
	    spawn_npc(200,280,"ice_shrine",false,true)
	    spawn_npc(280,280,"lightning_shrine",false,true) 
	    break;

    }
    npc_set_sprites()
    dialogue_make_pool()
}

