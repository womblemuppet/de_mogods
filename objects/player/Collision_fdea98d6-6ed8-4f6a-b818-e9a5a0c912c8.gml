if (other.owner==-1 ) && (other.samepersoncooldown<1 || ( other.cooldown<1 && other.lastowner!=self.id) )
	{
	//show_message("take")
	//show_message(other.cooldown)
	other.owner=self.id
	other.lastowner=self.id
	other.timer=other.TIMERSTARTNUMBER
    
	with other
	{
		alarm[1]=5
		sprite_index=pineapple_chilling
	}
}

