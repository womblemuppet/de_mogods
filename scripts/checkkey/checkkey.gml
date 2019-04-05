if !gamepad
    return keyboard_check(argument0)

if gamepad
    return gamepad_button_check(padnumber,argument0)


//gamepad_axis_value(padnumber, gp_axislh);



