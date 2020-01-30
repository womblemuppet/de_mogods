SHRUBS=ds_list_create()
ds_list_add(SHRUBS,"rock_1","rock_2","shrub_1","shrub_2","shrub_3","shrub_4")
TREES=ds_list_create()
ds_list_add(TREES,"tree_1","tree_2","tree_3","tree_4")
TORCHES=ds_list_create()
ds_list_add(TORCHES,"tiki_torch_1","tiki_torch_2","tiki_torch_3")
DESTROYED_STATUES=ds_list_create()
ds_list_add(DESTROYED_STATUES,"dedstatue_1","dedstatue_2","dedstatue_3")
WHOLE_STATUES=ds_list_create()
ds_list_add(WHOLE_STATUES,"statue_1","statue_2","statue_3")
STRUCTURES=ds_list_create()
ds_list_add(STRUCTURES,"building_01")
PALM_TREES=ds_list_create()
ds_list_add(PALM_TREES,"ptree_1","ptree_2","ptree_3")
BRICKCLUMPS=ds_list_create()
ds_list_add(BRICKCLUMPS,"brickclumps_1","brickclumps_2")
VINES=ds_list_create()
ds_list_add(VINES,"vine_1","vine_2","vine_3")
VINEYSHRUBS=ds_list_create()
ds_list_add(VINEYSHRUBS,"vineyshrub_1","vineyshrub_2")
VINEYTREES=ds_list_create()
ds_list_add(VINEYTREES,"vineytree_1","vineytree_2","vineytree_3","vineytree_4")

//[finaledit] not being destroyed

whole_statues_cooldown=0
WHOLE_STATUES_COOLDOWN_AMOUNT=40 //blocks

destroyed_statues_cooldown=0
DESTROYED_STATUES_COOLDOWN_AMOUNT=40