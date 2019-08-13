window_set_fullscreen(!window_get_fullscreen())

if window_get_fullscreen()
    console_log("fullscreen mode forced")
else
    console_log("windowed mode forced")

