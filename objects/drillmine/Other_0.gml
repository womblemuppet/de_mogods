if y<-10 || y>kouchou.room_bottom_border_y+1000
{
	if instance_exists(creator)
		creator.mines_ammo+=1
	instance_destroy()

}