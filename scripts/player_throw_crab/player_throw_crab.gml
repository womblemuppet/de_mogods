if crab_being_held!=-1 && crab_being_held!=noone && crab_being_held!=undefined //error paranoia.
{
    if instance_exists(crab_being_held)
    {
        var a;
        a=instance_create(x,y+20,crabjectile)
        a.creator=self.id
        a.sprite_index=crab_being_held.thrown_sprite
        a.squish_sprite=crab_being_held.squish_sprite
        a.hit_sprite=crab_being_held.hit_sprite
        if !right
            a.direction=180
        
        with crab_being_held
        {
            instance_destroy()
        }
                
        holding_a_crab=false
        crab_being_held=-1
    }
}
