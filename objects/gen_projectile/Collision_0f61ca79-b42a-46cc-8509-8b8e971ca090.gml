if can_collide_with_terrain
{
	effect_aniend(sunblast_blast_spr,0.2,-2)
	create_terrain_cutter(sunblast_terrain_cut_mask,"disintegrated",270,0)
	instance_destroy()
}