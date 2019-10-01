if uniques_vet_kamikaze_lockdown
{
	uniques_vet_kamikaze_number_of_mines++
	with other
		instance_destroy()
	exit
}

if other.ready==true && other.triggered==false
{
	other.triggered=true   ///will explode soon
	//if other.creator==self.id &&  cangroundpound==2    ///if you groundpounded onto mine, make gp used
	//{
	//	cangroundpound=3
	//}
}
        
