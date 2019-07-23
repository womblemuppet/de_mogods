hit[kouchou.MAX_PLAYER_COUNT]=false
for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
{
	hit[i]=false
};

hit_collector=noone

if aizen.debug_show_hitboxes
{
	visible=true;
	depth=-4
}
