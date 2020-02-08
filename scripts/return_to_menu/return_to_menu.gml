/***************************************************
  only applicable with aizen
****************************************************/
instance_activate_all()
screenflash(c_white,0.3,"fade",5)

with chunk_type_allowed_props
	instance_destroy()

with aizen
{
    instance_destroy()
    room=menu
}
