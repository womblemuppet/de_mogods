COMBO_TEXT_Y_VALUE=100
last_hit_timer[0]=0
for (var i = 0; i < kouchou.MAX_PLAYER_COUNT;i++) 
{
	last_hit_timer[i]=0
}

combo_hit_count[0]=0
for (var i = 0; i < kouchou.MAX_PLAYER_COUNT;i++) 
{
	combo_hit_count[i]=0
}


last_got_hit_timer[0]=0
for (var i = 0; i <kouchou.MAX_PLAYER_COUNT;i++)
{
	last_got_hit_timer[i]=0
}

last_got_hit_by[0]=noone
for (var i =0; i <kouchou.MAX_PLAYER_COUNT; i++)
{
	last_got_hit_by[i]=noone
}

TIMER_START=500
CLEAN_CUTOFF_TIME=325
VOLLEY_CUTOFF_TIME=450
CUCKED_CUTOFF_GOT_HIT_TIME=450
CUCKED_CUTOFF_HIT_TIME=300


///[player]
combo_sprites[0]=cctextspr_combo_p1
combo_sprites[1]=cctextspr_combo_p1
combo_sprites[2]=cctextspr_combo_p1
combo_sprites[3]=cctextspr_combo_p1


///[ player, combo]
combo_number_sprites[0,0]=cctextspr_number2_p1
combo_number_sprites[0,1]=cctextspr_number3_p1
combo_number_sprites[0,2]=cctextspr_number4_p1
combo_number_sprites[0,3]=cctextspr_number5_p1
combo_number_sprites[0,4]=cctextspr_number6_p1

combo_number_sprites[1,0]=cctextspr_number2_p1
combo_number_sprites[1,1]=cctextspr_number3_p1
combo_number_sprites[1,2]=cctextspr_number4_p1
combo_number_sprites[1,3]=cctextspr_number5_p1
combo_number_sprites[1,4]=cctextspr_number6_p1

combo_number_sprites[2,0]=cctextspr_number2_p1
combo_number_sprites[2,1]=cctextspr_number3_p1
combo_number_sprites[2,2]=cctextspr_number4_p1
combo_number_sprites[2,3]=cctextspr_number5_p1
combo_number_sprites[2,4]=cctextspr_number6_p1

combo_number_sprites[3,0]=cctextspr_number2_p1
combo_number_sprites[3,1]=cctextspr_number3_p1
combo_number_sprites[3,2]=cctextspr_number4_p1
combo_number_sprites[3,3]=cctextspr_number5_p1
combo_number_sprites[3,4]=cctextspr_number6_p1

volley_sprites[0]=cctextspr_volley_p1
volley_sprites[1]=cctextspr_volley_p1
volley_sprites[2]=cctextspr_volley_p1
volley_sprites[3]=cctextspr_volley_p1

denied_sprites[0]=cctextspr_denied_p1
denied_sprites[1]=cctextspr_denied_p1
denied_sprites[2]=cctextspr_denied_p1
denied_sprites[3]=cctextspr_denied_p1



debug=false