if mode=="dying"
{
	alpha-=0.1
	if alpha<0.1
		instance_destroy()
}
