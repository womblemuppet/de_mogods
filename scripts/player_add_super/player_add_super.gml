var amount;
amount=argument0

super_meter+=amount

if super_meter>=super_meter_max
{
	super_meter=0
	player_activate_super_mode()
	HUD_reset_super_bar(P)
}
else
{
	HUD_increment_super_bar(P,amount)
}