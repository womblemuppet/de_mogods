if !gamepad
    return keyboard_check_released(argument0)

if gamepad
    return gamepad_button_check_released(padnumber,argument0)
