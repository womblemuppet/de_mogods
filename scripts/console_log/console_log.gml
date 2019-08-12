with console
{	
	ds_list_add(log,argument0)

	log_pos_last+=1
	if log_pos_last>=HISTORY_MAX_NUMBER_OF_LINES
		log_pos+=1
}
