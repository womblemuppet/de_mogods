if crab_being_held!=-1 && crab_being_held!=noone && crab_being_held!=undefined //error paranoia.
{
    if instance_exists(crab_being_held)
    {
        var a;
        a=instance_create_depth(x,y+20,0,crabjectile)
        a.creator=self.id
        a.sprite_index=crab_being_held.thrown_sprite
        a.corpse_sprite=crab_being_held.hit_sprite
	   a.mask_index=crabjectile_mask_spr
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
