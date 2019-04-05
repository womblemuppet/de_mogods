if !gamepad
    return keyboard_check_pressed(argument0)

if gamepad
    return gamepad_button_check_pressed(padnumber,argument0)
