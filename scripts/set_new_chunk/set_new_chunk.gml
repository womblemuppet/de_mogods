////access random terraintype and chunk_type from chunkery
		
if !ds_map_exists(map_of_chunk_style_pools,biome)
	show_error("biome key nonexistant in mapofchunkstylepools: "+biome,true)
ds_list_shuffle(map_of_chunk_style_pools[? biome])
chunk_type=ds_list_find_value(map_of_chunk_style_pools[? biome],0)   //eg "sandypits" "sandydots" "startingflat"
terraintype=chunkery_chunk_type[? chunk_type]   //eg "pits" , "rectangle"
        
if !ds_map_exists(chunkery_ammo_min,chunk_type)
	show_error("nonexistant chunktype in chunkeryammo min. called="+string(chunk_type),true)
if !ds_map_exists(chunkery_ammo_max,chunk_type)
	show_error("nonexistant chunktype in chunkeryammo max. called="+string(chunk_type),true)

///set specific terraintype characteristics
            
//if terraintype!="solidline"   ///full line
	terrainammo=irandom_range(chunkery_ammo_min[? chunk_type],chunkery_ammo_max[? chunk_type])
	
set_terrain_type_patterns()