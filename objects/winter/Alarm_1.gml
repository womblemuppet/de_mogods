/// @description make icicles

var blocklist;
blocklist=ds_list_create()

with block
{
    if !place_meeting(x,y+1,block) && !place_meeting(x,y+aizen.bh+1,block) && !place_meeting(x,y+81,block) && divisible  ///if no block under you for two squares
        ds_list_add(blocklist,self.id)
}


ds_list_shuffle(blocklist)
//show_message(ds_list_size(blocklist))
for (var i=0; i<ds_list_size(blocklist); i+=1)
{
    with ds_list_find_value(blocklist,i)
    {
            instance_create(x,y+aizen.bh,icespike)
            //instance_create(x+10,y+40,icespike)
            instance_create(x+aizen.bw/2,y+aizen.bh,icespike)
            //instance_create(x+30,y+40,icespike)                        

    }
};
ds_list_destroy(blocklist)


