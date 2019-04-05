/***************************************************
  stack_add_orb( orb type , whether to shitcall or not if stack full )
****************************************************/

///add type to stack
ds_list_add(aizen.STACK,argument0)

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
                    shitcall(75,true)
            }
        }
}
