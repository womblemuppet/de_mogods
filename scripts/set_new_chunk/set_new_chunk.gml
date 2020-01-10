////access random terraintype and current_chunk_name from chunkery
		
if !ds_map_exists(map_of_chunk_style_pools,biome)
	show_error("biome key nonexistant in mapofchunkstylepools: "+biome,true)
ds_list_shuffle(map_of_chunk_style_pools[? biome])
current_chunk_name=ds_list_find_value(map_of_chunk_style_pools[? biome],0)   //eg "sandypits" "sandydots" "startingflat"
terraintype=chunkery_chunk_shape[? current_chunk_name]   //eg "pits" , "rectangle"

if !ds_map_exists(chunkery_ammo_min,current_chunk_name)
	show_error("nonexistant chunktype in chunkeryammo min. called="+string(current_chunk_name),true)
if !ds_map_exists(chunkery_ammo_max,current_chunk_name)
	show_error("nonexistant chunktype in chunkeryammo max. called="+string(current_chunk_name),true)

///set specific terraintype characteristics
            
//if terraintype!="solidline"   ///full line


terrain_ammo=irandom_range(chunkery_ammo_min[? current_chunk_name],chunkery_ammo_max[? current_chunk_name])
	
set_terrain_type_patterns()