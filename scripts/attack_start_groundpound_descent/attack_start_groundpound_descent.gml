////////////////////////////////////////////////////////////////////////////////
///    start groundpound descent(attack name)
////////////////////////////////////////////////////////////////////////////////
var gp_attack_name;
gp_attack_name=argument0


cangroundpound=2
vspd=GROUND_POUND_SPEED
groundpound_current_hitbox_object=attack_create_hitbox(GROUND_POUND_STUN_AMOUNT,1,true,true,gp_attack_name,groundpound_hitbox,0.2,0,0,-10)
return groundpound_current_hitbox_object