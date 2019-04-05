if crab_being_held!=-1
{
    if instance_exists(crab_being_held)
    {
        with crab_being_held
            owner=-1
        holding_a_crab=false
        crab_being_held=-1
    }
}   
