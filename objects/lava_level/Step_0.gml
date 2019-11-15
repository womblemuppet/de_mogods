if damaging
	lava_check_collision()
else
{
	damaging_timer--
	if damaging_timer<1
	{
		damaging=true
		vspeed=-1
	}
}
