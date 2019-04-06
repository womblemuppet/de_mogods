
if mode==0
{
	for (i=0; i<NUMBEROFLINES; i+=1)
	{
		if textpos[i]>0 || i==0
		{
			if textpos[i]<string_length(text[i])
			textpos[i]+=1
			if textpos[i]>string_length(text[i])-6
			{
			if textpos[min(NUMBEROFLINES,i+1)]==0
				textpos[min(NUMBEROFLINES,i+1)]=1
			}
		}
	};
	if textpos[NUMBEROFLINES-1]>=string_length(text[NUMBEROFLINES-1])
	{
		mode=1  
		alarm[0]=40
	}
}

