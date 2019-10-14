if instance_exists(other.creator)                  /////////// ON HIT   //////////////////
{
    with other.creator
    {
        if dash_delay_before_can_attack_counter>5
            dash_delay_before_can_attack_counter=5
    }
}

player_hit_by_dash()





