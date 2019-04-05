/***************************************************
    string_split_lines_add_to_list
    takes a string (arg0) and cuts it into widths of size (arg1) , adding all substrings to list (arg2)
****************************************************/
var t,fuse;
t=""
fuse=0
while string_width(string_hash_to_newline(argument0))>argument1 && fuse<1000
{
    while string_width(string_hash_to_newline(t))<argument1
    {
        t+=string_copy(argument1,0,1)
        string_delete(argument1,0,1)
    }
    ds_list_add(argument2,t)
    t=""
	fuse+=1
}
if fuse>1000
	show_error("fuse blown",true)
	
ds_list_add(argument2,t)
