var me;
me=self.id
chain_effect_id_to_delete=instance_create_depth(x,y,0,ef_chain)
chain_effect_id_to_delete.target=noone
chain_effect_id_to_delete.tx=x
chain_effect_id_to_delete.ty=y

if instance_exists(me)  //someone got paranoid...
{
	with chain_effect_id_to_delete
	{
		target=me
		tx=me.x
		ty=me.y
	}
}

