if select!=10       //// outer pause menu
{

	if checkkey_pushed(ds_map_find_value(kouchou.keybinding_map_array[pausescreen_requester_id],"downbutton"))
	{
		select+=1
		if select>SELECTMAX
			select=0
	}
	else if checkkey_pushed(ds_map_find_value(kouchou.keybinding_map_array[pausescreen_requester_id],"upbutton"))
	{
		select-=1
		if select<0
			select=SELECTMAX
	}
	else if checkkey_pushed(ds_map_find_value(kouchou.keybinding_map_array[pausescreen_requester_id],"lightbutton"))
	{
		switch (select)
		{
			case 0:
				instance_destroy()  break;
			case 1:
				select=10           break;
			case 2:
				return_to_menu()    break;  
		}
	}
	else if checkkey_pushed(ds_map_find_value(kouchou.keybinding_map_array[pausescreen_requester_id],"heavybutton"))
	{
		instance_destroy()
	}



}
else             ///// command list
{
	if checkkey_pushed(ds_map_find_value(kouchou.keybinding_map_array[pausescreen_requester_id],"downbutton"))
	{
		commandlist_select+=1
		if commandlist_select>ds_list_size(commands_list)-1
		commandlist_select=0
	}
	else if checkkey_pushed(ds_map_find_value(kouchou.keybinding_map_array[pausescreen_requester_id],"upbutton"))
	{
		commandlist_select-=1
		if commandlist_select<0
			commandlist_select=ds_list_size(commands_list)-1
	}
	else if checkkey_pushed(ds_map_find_value(kouchou.keybinding_map_array[pausescreen_requester_id],"heavybutton"))    
	{
		select=1
	}
}


if checkkey_pushed(ds_map_find_value(kouchou.keybinding_map_array[pausescreen_requester_id],"startbutton"))
{
	instance_destroy()
}




