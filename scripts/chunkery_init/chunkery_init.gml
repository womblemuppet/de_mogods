//Chunkery
//Data for a 'chunk', which has a current_chunk_name (shape), ammo, prop list and terrain type 

current_chunk_name="startingflat"    ///the current type of chunk
chunkery_chunk_shape=ds_map_create()
chunkery_ammo_min=ds_map_create()
chunkery_ammo_max=ds_map_create()
chunkery_sprite_list=ds_map_create()
chunkery_id_of_prop_list=ds_map_create() 




map_of_chunk_style_pools=ds_map_create()   ///each key links to a list with the pool of chunk styles

////////////////////////////////////////////////////////////////////////////////////////// SUMMIT

list_of_chunk_styles_summit=ds_list_create()
ds_map_add(map_of_chunk_style_pools,"summit",list_of_chunk_styles_summit)
ds_list_add(list_of_chunk_styles_summit,"platgrassy","rectanglebumpygrassy","lplatformbumpygrassy","lplatformtemple","secretboxtemple","doublewavesgrassy","secretboxtemple","sidestepstemple","chamberspillartemple")



////startingflat
ds_map_add(chunkery_chunk_shape,"startingflat","solidline")
ds_map_add(chunkery_sprite_list,"startingflat",BLOCK_SPRITE_SUMMIT_FULL)
ds_map_add(chunkery_ammo_min,"startingflat",7)
ds_map_add(chunkery_ammo_max,"startingflat",7)
ds_map_add(chunkery_id_of_prop_list,"startingflat",0)    
       
////platgrassy
ds_map_add(chunkery_chunk_shape,"platgrassy","singleplatformbumpy")
ds_map_add(chunkery_sprite_list,"platgrassy",BLOCK_SPRITE_SUMMIT_FULL)
ds_map_add(chunkery_ammo_min,"platgrassy",6)
ds_map_add(chunkery_ammo_max,"platgrassy",10)
ds_map_add(chunkery_id_of_prop_list,"platgrassy",0)

////lplatformbumpygrassy
ds_map_add(chunkery_chunk_shape,"lplatformbumpygrassy","lplatformbumpy")
ds_map_add(chunkery_sprite_list,"lplatformbumpygrassy",BLOCK_SPRITE_SUMMIT_FULL)
ds_map_add(chunkery_ammo_min,"lplatformbumpygrassy",6)
ds_map_add(chunkery_ammo_max,"lplatformbumpygrassy",8)
ds_map_add(chunkery_id_of_prop_list,"lplatformbumpygrassy",0)

////lplatformtemple
ds_map_add(chunkery_chunk_shape,"lplatformtemple","lplatform")
ds_map_add(chunkery_sprite_list,"lplatformtemple",BLOCK_SPRITE_SUMMIT_FULL)
ds_map_add(chunkery_ammo_min,"lplatformtemple",6)
ds_map_add(chunkery_ammo_max,"lplatformtemple",8)
ds_map_add(chunkery_id_of_prop_list,"lplatformtemple",0)

////doublewavesgrassy
ds_map_add(chunkery_chunk_shape,"doublewavesgrassy","doublewaves")
ds_map_add(chunkery_sprite_list,"doublewavesgrassy",BLOCK_SPRITE_SUMMIT_FULL)
ds_map_add(chunkery_ammo_min,"doublewavesgrassy",5)
ds_map_add(chunkery_ammo_max,"doublewavesgrassy",7)
ds_map_add(chunkery_id_of_prop_list,"doublewavesgrassy",0)

////rectanglebumpygrassy
ds_map_add(chunkery_chunk_shape,"rectanglebumpygrassy","rectanglebumpy")
ds_map_add(chunkery_sprite_list,"rectanglebumpygrassy",BLOCK_SPRITE_SUMMIT_FULL)
ds_map_add(chunkery_ammo_min,"rectanglebumpygrassy",5)
ds_map_add(chunkery_ammo_max,"rectanglebumpygrassy",7)
ds_map_add(chunkery_id_of_prop_list,"rectanglebumpygrassy",0)

//sidestepstemple
ds_map_add(chunkery_chunk_shape,"sidestepstemple","sidesteps")
ds_map_add(chunkery_sprite_list,"sidestepstemple",BLOCK_SPRITE_TEMPLE_FULL)
ds_map_add(chunkery_ammo_min,"sidestepstemple",5)
ds_map_add(chunkery_ammo_max,"sidestepstemple",14)
ds_map_add(chunkery_id_of_prop_list,"sidestepstemple",0)

//chamberspillartemple
ds_map_add(chunkery_chunk_shape,"chamberspillartemple","chamberspillar")
ds_map_add(chunkery_sprite_list,"chamberspillartemple",BLOCK_SPRITE_TEMPLE_FULL)
ds_map_add(chunkery_ammo_min,"chamberspillartemple",4)
ds_map_add(chunkery_ammo_max,"chamberspillartemple",12)
ds_map_add(chunkery_id_of_prop_list,"chamberspillartemple",0)

//secretboxtemple
ds_map_add(chunkery_chunk_shape,"secretboxtemple","secretbox")
ds_map_add(chunkery_sprite_list,"secretboxtemple",BLOCK_SPRITE_TEMPLE_FULL)
ds_map_add(chunkery_ammo_min,"secretboxtemple",9)
ds_map_add(chunkery_ammo_max,"secretboxtemple",11)
ds_map_add(chunkery_id_of_prop_list,"secretboxtemple",0)
////////////////////////////////////////////////////////////////////////////////////////// SAND


list_of_chunk_styles_sand=ds_list_create()
ds_map_add(map_of_chunk_style_pools,"sand",list_of_chunk_styles_sand)
ds_list_add(list_of_chunk_styles_sand,"sandyrectangle","sandywaves","sandylplatformbumpy","sandypits","sandydots")

////sandyrectangle
ds_map_add(chunkery_chunk_shape,"sandyrectangle","rectangle")
ds_map_add(chunkery_sprite_list,"sandyrectangle",BLOCK_SPRITE_SAND_FULL)
ds_map_add(chunkery_ammo_min,"sandyrectangle",3)
ds_map_add(chunkery_ammo_max,"sandyrectangle",5)
ds_map_add(chunkery_id_of_prop_list,"sandyrectangle",0)

////sandywaves
ds_map_add(chunkery_chunk_shape,"sandywaves","waves")
ds_map_add(chunkery_sprite_list,"sandywaves",BLOCK_SPRITE_SAND_FULL)
ds_map_add(chunkery_ammo_min,"sandywaves",7)
ds_map_add(chunkery_ammo_max,"sandywaves",14)
ds_map_add(chunkery_id_of_prop_list,"sandywaves",0)

////sandylplatformbumpy
ds_map_add(chunkery_chunk_shape,"sandylplatformbumpy","lplatformbumpy")
ds_map_add(chunkery_sprite_list,"sandylplatformbumpy",BLOCK_SPRITE_SAND_FULL)
ds_map_add(chunkery_ammo_min,"sandylplatformbumpy",9)
ds_map_add(chunkery_ammo_max,"sandylplatformbumpy",10)
ds_map_add(chunkery_id_of_prop_list,"sandylplatformbumpy",0)

////sandypits
ds_map_add(chunkery_chunk_shape,"sandypits","pits")
ds_map_add(chunkery_sprite_list,"sandypits",BLOCK_SPRITE_SAND_FULL)
ds_map_add(chunkery_ammo_min,"sandypits",3)
ds_map_add(chunkery_ammo_max,"sandypits",7)
ds_map_add(chunkery_id_of_prop_list,"sandypits",0)

//sandydots
ds_map_add(chunkery_chunk_shape,"sandydots","dots")
ds_map_add(chunkery_sprite_list,"sandydots",BLOCK_SPRITE_SAND_FULL)
ds_map_add(chunkery_ammo_min,"sandydots",2)
ds_map_add(chunkery_ammo_max,"sandydots",4)
ds_map_add(chunkery_id_of_prop_list,"sandydots",0)


////////////////////////////////////////////////////////////////////////////////////////// FOREST


list_of_chunk_styles_forest=ds_list_create()
ds_map_add(map_of_chunk_style_pools,"forest",list_of_chunk_styles_forest)
ds_list_add(list_of_chunk_styles_forest,"forestpits")

////forestpits
ds_map_add(chunkery_chunk_shape,"forestpits","pits")
ds_map_add(chunkery_sprite_list,"forestpits",BLOCK_SPRITE_FOREST_FULL)
ds_map_add(chunkery_ammo_min,"forestpits",4)
ds_map_add(chunkery_ammo_max,"forestpits",4)
ds_map_add(chunkery_id_of_prop_list,"forestpits",0)

////////////////////////////////////////////////////////////////////////////////////////// CAVE


list_of_chunk_styles_cave=ds_list_create()
ds_map_add(map_of_chunk_style_pools,"cave",list_of_chunk_styles_cave)
ds_list_add(list_of_chunk_styles_cave,"caveblobs")

////forestpits
ds_map_add(chunkery_chunk_shape,"caveblobs","blobs")
ds_map_add(chunkery_sprite_list,"caveblobs",BLOCK_SPRITE_CAVE_FULL)
ds_map_add(chunkery_ammo_min,"caveblobs",14)
ds_map_add(chunkery_ammo_max,"caveblobs",14)
ds_map_add(chunkery_id_of_prop_list,"caveblobs",0)





/*
ds_map_add(chunkery_chunk_shape,"","")
ds_map_add(chunkery_sprite_list,"","")
ds_map_add(chunkery_ammo_min,"","")
ds_map_add(chunkery_ammo_max,"","")
ds_map_add(chunkery_id_of_prop_list,"","")
*/
