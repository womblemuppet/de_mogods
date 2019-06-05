/// @description ult time ticker
aizen.playerulttimeindex[P]+=1


if aizen.playerulttimeindex[P]>18 ///ran out of ult time
{
    unique_ooga_gp_charges=0
	super_mode=false
    aizen.playersupercount[P]=0
    aizen.playerulttimeindex[P]=0
}
else
    alarm[7]=29    ///tick

