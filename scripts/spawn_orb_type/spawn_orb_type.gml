var a;
a=instance_create(argument0,argument1,orbb)
a.type=argument2
with a
{
    normal_sprite=ds_list_find_value(aizen.STACK_ORB_SPRITES,type)
    death_sprite=ds_list_find_value(aizen.STACK_ORB_SPRITES_DIE,type)
    birth_sprite=ds_list_find_value(aizen.STACK_ORB_SPRITES_BIRTH,type)
    sprite_index=birth_sprite
}
return a
