var me;
me=self.id

chain_id_to_delete=instance_create_depth(x,y,-2,baitchain)
chain_id_to_delete.target=noone
chain_id_to_delete.tx=x
chain_id_to_delete.ty=y

if instance_exists(me)  //someone got paranoid...
{
	with chain_id_to_delete
	{
		target=me
		tx=me.x
		ty=me.y
	}
}

return chain_id_to_delete