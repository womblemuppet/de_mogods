/// @description ult time ticker
aizen.playerulttimeindex[P]+=1


if aizen.playerulttimeindex[P]>18 ///ran out of ult time
{
    supers=0
    aizen.playersupercount[P]=0
    aizen.playerulttimeindex[P]=0
}
else
    alarm[7]=29    ///tick

