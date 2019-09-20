/////////////////////// new biome check
if travelled>biome_length+biome_length_accumulative
{
	biome_length_accumulative+=biome_length
	biome=biome_schedule[| 0]
	ds_list_delete(biome_schedule,0)
	biomeswitch=true
	ds_list_add(lightingtravelledmarks,travelled)
	ds_list_add(lightingtravelledbiome,biome)
    
	//////////////////////////////////biome lengths here
	if biome=="cave"
	     biome_length=999999
	////////////////////////////////////////////
    
	if kouchou.map=="multiplayer"
	{
		if biome=="forest"
			backdrop_create(jangle,room_height+200,jangle,810,jangleend)  //ends best at 700
		else if biome=="cave"
			backdrop_create(cave_start,room_height+200,cave_fill,10000,cave_end)
	}
}
if !ds_list_empty(lightingtravelledmarks)
{
    if (travelled-1760)>lightingtravelledmarks[| 0]
    {
        lighting.target_colour=lightingcolourmap[? lightingtravelledbiome[| 0]]
        lighting.target_alpha=lightingalphamap[? lightingtravelledbiome[| 0]]
        ds_list_delete(lightingtravelledmarks,0) 
        ds_list_delete(lightingtravelledbiome,0)               
    }
}
