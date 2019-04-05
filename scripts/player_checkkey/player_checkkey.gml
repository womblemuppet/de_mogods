/***************************************************
  possible args are
  "left"
  "up"
  "right"
  "down"
 ***************************************************/

var bndmap,keytocheck;
bndmap=tousen.controltype[0]
keytocheck=ds_map_find_value(ds_map_find_value(tousen.bindingsetupmap,bndmap),argument0)
if bndmap=="kb1" || bndmap=="kb2"  //keyboard
{
    if keyboard_check(keytocheck)
        return true
}
else ///controller
{
    if keytocheck=="NS_RIGHT" || keytocheck=="NS_UP" || keytocheck=="NS_LEFT" || keytocheck=="NS_DOWN"
    {
        if keytocheck=="NS_RIGHT"
        {
            if gamepad_axis_value(controllernumber,gp_axislh)>aizen.DEADZONE || gamepad_button_check(controllernumber,gp_padr)
                return true
        }
        if keytocheck=="NS_UP"
        {
            if gamepad_axis_value(controllernumber,gp_axislv)<-aizen.DEADZONE || gamepad_button_check(controllernumber,gp_padu)
                return true
        }
        if keytocheck=="NS_LEFT"
        {
            if gamepad_axis_value(controllernumber,gp_axislh)<-aizen.DEADZONE || gamepad_button_check(controllernumber,gp_padl)
                return true
        }
        if keytocheck=="NS_DOWN"
        {
            if gamepad_axis_value(controllernumber,gp_axislv)>aizen.DEADZONE || gamepad_button_check(controllernumber,gp_padd)
                return true
        }
    }
    else
    {
        if gamepad_button_check(controllernumber,keytocheck)
            return true
    }
}

return false
