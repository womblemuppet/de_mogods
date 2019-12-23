if instance_exists(other.creator) || other.creator==noone
{
	if other.hit[P]==false && other.creator!=creator
	{
		instance_destroy()
	}	
}