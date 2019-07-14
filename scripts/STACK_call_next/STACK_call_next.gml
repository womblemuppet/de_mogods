with aizen
{
	if !ds_list_empty(STACK)
		alarm[1]=5
	else
	{
		mode=0
        
		stackframe_sprite=arcade_cabinet_maskbar_inactive
		stackframe_subimage=0
		stackframe_image_number=0  
          
		alarm[0]=150  ///call instrument
		last_stack_sprite=-1
	}
}
