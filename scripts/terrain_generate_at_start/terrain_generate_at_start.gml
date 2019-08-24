biomeswitch=false   ///(I think) true when cutting gap between biomes
player_baseline_prev=880
player_baseline=880

for (iii=10; iii<27; iii+=1)   //row by row  
{
	biomeswitch=false
	travelled+=bh            
	bedrockcounter=aizen.bh+1
	travelled_tick_biome_threshold_check()
	terrain_generate(iii*bh)
}
	
bedrockcounter=0
	