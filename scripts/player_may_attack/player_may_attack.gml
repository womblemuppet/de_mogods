if player_not_locked_down()
{
    if push_other_attacks_timer<1 && dash_attacks_allowed_counter<1 && STUNNED<1 && STUNNED2<1
        return true
    else 
        return false
}
else
    return false
