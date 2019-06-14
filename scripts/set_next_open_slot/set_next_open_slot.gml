next_open_slot=-1
for (i=0; i<MAX_PLAYER_COUNT; i+=1)
{
	if ready[i]==-1
	{
		next_open_slot=i
		break;
	}
};

