/***************************************************
  stack_add_orb( orb type , whether to shitcall or not if stack full )
****************************************************/

///add type to stack

var orb_to_add;
orb_to_add=argument0
if orb_to_add==undefined
	orb_to_add=take_from_upcoming_stack()
	
ds_list_add(aizen.STACK,orb_to_add)

with aizen
{
	if !ds_list_empty(STACK)
	{            
		stackframe_sprite=arcade_cabinet_maskbar
		stackframe_subimage=0
		stackframe_image_number=7
	}
}

///////////////// shitcall check
if argument1   ///true for normal orb pickup, false for superorbcall
{
	if ds_list_size(aizen.STACK)>=aizen.STACK_SHITCALL_NUMBER
	{
		if aizen.alarm[1]<1 && aizen.mode==0
		{
			with aizen
				shitcall(50)
		}
	}
}
