window_set_fullscreen(!window_get_fullscreen())

if window_get_fullscreen()
    create_console_top_fade_text("fullscreen mode forced")
else
    create_console_top_fade_text("windowed mode forced")

