
if (other.creator!=self.id || (other.creator==self.id &&  cangroundpound==2 )) && other.triggered==false
{
	if other.creator==self.id &&  cangroundpound==2    ///if you groundpounded onto mine, make gp used
	{
		cangroundpound=3
	}
        
        
        
	other.triggered=true   ///will explode soon
}

