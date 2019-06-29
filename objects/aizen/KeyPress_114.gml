
if debug_show_hitboxes
{
	debug_show_hitboxes=false
	with hitbox
		visible=true
}
else
{
	debug_show_hitboxes=true
	with hitbox
		visible=false
}

if debug_show_hitboxes
	create_console_top_fade_text("draw hitboxes enabled")
else
	create_console_top_fade_text("draw hitboxes disabled")

