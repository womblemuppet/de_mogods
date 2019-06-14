/***************************************************
  called by kouchou
****************************************************/

var n;
n=0

for (i=0; i<MAX_PLAYER_COUNT; i+=1)
{
    if ready[i]==2
        n+=1
};
if n==players_in && players_in>1
    return true
    
return false

