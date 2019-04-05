if instance_exists(other.creator)                  /////////// ON HIT   //////////////////
{
    with other.creator
    {
        if dash_attacks_allowed_counter>5
            dash_attacks_allowed_counter=5
    }
}

player_hit_by_dash()





