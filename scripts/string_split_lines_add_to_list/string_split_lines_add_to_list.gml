/***************************************************
    string_split_lines_add_to_list
    takes a string (arg0) and cuts it into widths of size (arg1) , adding all substrings to list (arg2)
****************************************************/
//test 
var sourcestring,t,fuse;
t=""
fuse=0
sourcestring=argument0
while string_length(sourcestring)>0 && fuse<1000         ///until all of the original string is converted into lines
{
	t=""  //reset t (temporary string)
	fuse+=1
	while string_width(t)<argument1 && string_length(sourcestring)>0  //add characters to t and remove them from the original string until they are at max length (1 line)
	{
		t+=string_copy(sourcestring,1,1)
		sourcestring=string_delete(sourcestring,1,1)
		//show_message("t="+t+" sourcestring="+sourcestring)
	}
	ds_list_add(argument2,t) ///add that line (t) to the specified list
	//show_message(t+" width:"+string(string_width(t))+" fuse:"+string(fuse))
}
if fuse>1000
	show_error("string split lines add to list infinite loop freeze preventionfuse blown ",true)
	
//ds_list_add(argument2,t)   ///finally, add the last (partial) line to the list as well.
