//Chunkery
//Data for a 'chunk', which has a current_chunk_name (shape), ammo, prop list and terrain type 

current_chunk_name="startingflat"    ///the current type of chunk
chunkery_chunk_shape=ds_map_create() ///these maps have the chunk_name as the key and hold various properties about the chunk type
chunkery_ammo_min=ds_map_create()
chunkery_ammo_max=ds_map_create()
chunkery_sprite_list=ds_map_create()
chunkery_allowed_props_instance=ds_map_create() 


prop_lists_init()


map_of_chunk_style_pools=ds_map_create()   ///each key links to a list with the pool of chunk styles

////////////////////////////////////////////////////////////////////////////////////////// SUMMIT

list_of_chunk_styles_summit=ds_list_create()
ds_map_add(map_of_chunk_style_pools,"summit",list_of_chunk_styles_summit)
ds_list_add(list_of_chunk_styles_summit,"platgrassy","rectanglebumpygrassy","lplatformbumpygrassy","lplatformtemple","secretboxtemple","doublewavesgrassy","secretboxtemple","sidestepstemple","chamberspillartemple")



var chunk_type_allowed_props_startingflat;
chunk_type_allowed_props_startingflat=create_chunk_type_allowed_props(0.25,TREES,0.1,DESTROYED_STATUES,0.25,SHRUBS)

var chunk_type_allowed_props_grassy;
chunk_type_allowed_props_grassy=create_chunk_type_allowed_props(0.1,TREES,0.05,DESTROYED_STATUES,0.15,SHRUBS)

var chunk_type_allowed_props_temple;
chunk_type_allowed_props_temple=create_chunk_type_allowed_props(0.2,TORCHES,0.1,WHOLE_STATUES)

var chunk_type_allowed_props_jungle;
chunk_type_allowed_props_jungle=create_chunk_type_allowed_props(0.4,TREES,0.3,SHRUBS)

var chunk_type_allowed_props_sandy;
chunk_type_allowed_props_sandy=create_chunk_type_allowed_props(0.7,SHRUBS)

var chunk_type_allowed_props_cave;
chunk_type_allowed_props_cave=create_chunk_type_allowed_props(0.5,TORCHES)

////startingflat
ds_map_add(chunkery_chunk_shape,"startingflat","solidline")
ds_map_add(chunkery_sprite_list,"startingflat",BLOCK_SPRITE_SUMMIT_FULL)
ds_map_add(chunkery_ammo_min,"startingflat",7)
ds_map_add(chunkery_ammo_max,"startingflat",7)
ds_map_add(chunkery_allowed_props_instance,"startingflat",chunk_type_allowed_props_startingflat)

////platgrassy
ds_map_add(chunkery_chunk_shape,"platgrassy","singleplatformbumpy")
ds_map_add(chunkery_sprite_list,"platgrassy",BLOCK_SPRITE_SUMMIT_FULL)
ds_map_add(chunkery_ammo_min,"platgrassy",6)
ds_map_add(chunkery_ammo_max,"platgrassy",10)
ds_map_add(chunkery_allowed_props_instance,"platgrassy",chunk_type_allowed_props_grassy)

////lplatformbumpygrassy
ds_map_add(chunkery_chunk_shape,"lplatformbumpygrassy","lplatformbumpy")
ds_map_add(chunkery_sprite_list,"lplatformbumpygrassy",BLOCK_SPRITE_SUMMIT_FULL)
ds_map_add(chunkery_ammo_min,"lplatformbumpygrassy",6)
ds_map_add(chunkery_ammo_max,"lplatformbumpygrassy",8)
ds_map_add(chunkery_allowed_props_instance,"lplatformbumpygrassy",chunk_type_allowed_props_grassy)

////lplatformtemple
ds_map_add(chunkery_chunk_shape,"lplatformtemple","lplatform")
ds_map_add(chunkery_sprite_list,"lplatformtemple",BLOCK_SPRITE_SUMMIT_FULL)
ds_map_add(chunkery_ammo_min,"lplatformtemple",6)
ds_map_add(chunkery_ammo_max,"lplatformtemple",8)
ds_map_add(chunkery_allowed_props_instance,"lplatformtemple",chunk_type_allowed_props_temple)

////doublewavesgrassy
ds_map_add(chunkery_chunk_shape,"doublewavesgrassy","doublewaves")
ds_map_add(chunkery_sprite_list,"doublewavesgrassy",BLOCK_SPRITE_SUMMIT_FULL)
ds_map_add(chunkery_ammo_min,"doublewavesgrassy",5)
ds_map_add(chunkery_ammo_max,"doublewavesgrassy",7)
ds_map_add(chunkery_allowed_props_instance,"doublewavesgrassy",chunk_type_allowed_props_grassy)

////rectanglebumpygrassy
ds_map_add(chunkery_chunk_shape,"rectanglebumpygrassy","rectanglebumpy")
ds_map_add(chunkery_sprite_list,"rectanglebumpygrassy",BLOCK_SPRITE_SUMMIT_FULL)
ds_map_add(chunkery_ammo_min,"rectanglebumpygrassy",5)
ds_map_add(chunkery_ammo_max,"rectanglebumpygrassy",7)
ds_map_add(chunkery_allowed_props_instance,"rectanglebumpygrassy",chunk_type_allowed_props_grassy)

//sidestepstemple
ds_map_add(chunkery_chunk_shape,"sidestepstemple","sidesteps")
ds_map_add(chunkery_sprite_list,"sidestepstemple",BLOCK_SPRITE_TEMPLE_FULL)
ds_map_add(chunkery_ammo_min,"sidestepstemple",5)
ds_map_add(chunkery_ammo_max,"sidestepstemple",14)
ds_map_add(chunkery_allowed_props_instance,"sidestepstemple",chunk_type_allowed_props_temple)

//chamberspillartemple
ds_map_add(chunkery_chunk_shape,"chamberspillartemple","chamberspillar")
ds_map_add(chunkery_sprite_list,"chamberspillartemple",BLOCK_SPRITE_TEMPLE_FULL)
ds_map_add(chunkery_ammo_min,"chamberspillartemple",4)
ds_map_add(chunkery_ammo_max,"chamberspillartemple",12)
ds_map_add(chunkery_allowed_props_instance,"chamberspillartemple",chunk_type_allowed_props_temple)

//secretboxtemple
ds_map_add(chunkery_chunk_shape,"secretboxtemple","secretbox")
ds_map_add(chunkery_sprite_list,"secretboxtemple",BLOCK_SPRITE_TEMPLE_FULL)
ds_map_add(chunkery_ammo_min,"secretboxtemple",9)
ds_map_add(chunkery_ammo_max,"secretboxtemple",11)
ds_map_add(chunkery_allowed_props_instance,"secretboxtemple",chunk_type_allowed_props_temple)
////////////////////////////////////////////////////////////////////////////////////////// SAND


list_of_chunk_styles_sand=ds_list_create()
ds_map_add(map_of_chunk_style_pools,"sand",list_of_chunk_styles_sand)
ds_list_add(list_of_chunk_styles_sand,"sandyrectangle","sandywaves","sandylplatformbumpy","sandypits","sandydots")

////sandyrectangle
ds_map_add(chunkery_chunk_shape,"sandyrectangle","rectangle")
ds_map_add(chunkery_sprite_list,"sandyrectangle",BLOCK_SPRITE_SAND_FULL)
ds_map_add(chunkery_ammo_min,"sandyrectangle",3)
ds_map_add(chunkery_ammo_max,"sandyrectangle",5)
ds_map_add(chunkery_allowed_props_instance,"sandyrectangle",chunk_type_allowed_props_sandy)

////sandywaves
ds_map_add(chunkery_chunk_shape,"sandywaves","waves")
ds_map_add(chunkery_sprite_list,"sandywaves",BLOCK_SPRITE_SAND_FULL)
ds_map_add(chunkery_ammo_min,"sandywaves",7)
ds_map_add(chunkery_ammo_max,"sandywaves",14)
ds_map_add(chunkery_allowed_props_instance,"sandywaves",chunk_type_allowed_props_sandy)

////sandylplatformbumpy
ds_map_add(chunkery_chunk_shape,"sandylplatformbumpy","lplatformbumpy")
ds_map_add(chunkery_sprite_list,"sandylplatformbumpy",BLOCK_SPRITE_SAND_FULL)
ds_map_add(chunkery_ammo_min,"sandylplatformbumpy",9)
ds_map_add(chunkery_ammo_max,"sandylplatformbumpy",10)
ds_map_add(chunkery_allowed_props_instance,"sandylplatformbumpy",chunk_type_allowed_props_sandy)

////sandypits
ds_map_add(chunkery_chunk_shape,"sandypits","pits")
ds_map_add(chunkery_sprite_list,"sandypits",BLOCK_SPRITE_SAND_FULL)
ds_map_add(chunkery_ammo_min,"sandypits",3)
ds_map_add(chunkery_ammo_max,"sandypits",7)
ds_map_add(chunkery_allowed_props_instance,"sandypits",chunk_type_allowed_props_sandy)

//sandydots
ds_map_add(chunkery_chunk_shape,"sandydots","dots")
ds_map_add(chunkery_sprite_list,"sandydots",BLOCK_SPRITE_SAND_FULL)
ds_map_add(chunkery_ammo_min,"sandydots",2)
ds_map_add(chunkery_ammo_max,"sandydots",4)
ds_map_add(chunkery_allowed_props_instance,"sandydots",chunk_type_allowed_props_sandy)


////////////////////////////////////////////////////////////////////////////////////////// FOREST


list_of_chunk_styles_forest=ds_list_create()
ds_map_add(map_of_chunk_style_pools,"forest",list_of_chunk_styles_forest)
ds_list_add(list_of_chunk_styles_forest,"forestpits")

////forestpits
ds_map_add(chunkery_chunk_shape,"forestpits","pits")
ds_map_add(chunkery_sprite_list,"forestpits",BLOCK_SPRITE_FOREST_FULL)
ds_map_add(chunkery_ammo_min,"forestpits",4)
ds_map_add(chunkery_ammo_max,"forestpits",4)
ds_map_add(chunkery_allowed_props_instance,"forestpits",chunk_type_allowed_props_jungle)

////////////////////////////////////////////////////////////////////////////////////////// CAVE


list_of_chunk_styles_cave=ds_list_create()
ds_map_add(map_of_chunk_style_pools,"cave",list_of_chunk_styles_cave)
ds_list_add(list_of_chunk_styles_cave,"caveblobs")

////caveblobs
ds_map_add(chunkery_chunk_shape,"caveblobs","blobs")
ds_map_add(chunkery_sprite_list,"caveblobs",BLOCK_SPRITE_CAVE_FULL)
ds_map_add(chunkery_ammo_min,"caveblobs",14)
ds_map_add(chunkery_ammo_max,"caveblobs",14)
ds_map_add(chunkery_allowed_props_instance,"caveblobs",chunk_type_allowed_props_cave)





/*
ds_map_add(chunkery_chunk_shape,"","")
ds_map_add(chunkery_sprite_list,"","")
ds_map_add(chunkery_ammo_min,"","")
ds_map_add(chunkery_ammo_max,"","")
ds_map_add(chunkery_allowed_props_instance,"","")
*/
